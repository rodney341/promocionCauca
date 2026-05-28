using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;

namespace WebAppPromocionCauca
{
    public partial class AdminBlog : Page
    {
        private static readonly string FirebaseUrl = "https://turismocauca-7a4ec-default-rtdb.firebaseio.com/blog.json";
        private static readonly string BaseFirebaseUrl = "https://turismocauca-7a4ec-default-rtdb.firebaseio.com/blog";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.Title = "Redacción Editorial | Carga de Archivos";
            }
        }
        // ⚡ ENTORNO BLINDADO CONTRA ERRORES 401
        [WebMethod]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json)]
        public static string EliminarArticuloEImagenes(string idArticulo)
        {
            // El resto del código de tu método (consultar Firebase, borrar fotos y borrar nodo) se conserva exactamente IGUAL
            try
            {
                string urlConsulta = $"{BaseFirebaseUrl}/{idArticulo}.json";
                string jsonArticulo = "";

                using (WebClient client = new WebClient())
                {
                    client.Encoding = Encoding.UTF8;
                    jsonArticulo = client.DownloadString(urlConsulta);
                }

                if (!string.IsNullOrEmpty(jsonArticulo) && jsonArticulo != "null")
                {
                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    var datos = serializer.Deserialize<System.Collections.Generic.Dictionary<string, object>>(jsonArticulo);

                    if (datos.ContainsKey("articulo_1"))
                    {
                        datos = (System.Collections.Generic.Dictionary<string, object>)datos["articulo_1"];
                    }

                    BorrarArchivoFisico(datos.ContainsKey("UrlImagen") ? datos["UrlImagen"]?.ToString() : "");
                    BorrarArchivoFisico(datos.ContainsKey("UrlImagen2") ? datos["UrlImagen2"]?.ToString() : "");

                    if (datos.ContainsKey("Galeria") && datos["Galeria"] is System.Collections.ArrayList)
                    {
                        var listaGaleria = (System.Collections.ArrayList)datos["Galeria"];
                        foreach (var fotoUrl in listaGaleria)
                        {
                            BorrarArchivoFisico(fotoUrl?.ToString());
                        }
                    }
                }

                using (WebClient client = new WebClient())
                {
                    client.UploadString(urlConsulta, "DELETE", "");
                }

                return "SUCCESS";
            }
            catch (Exception ex)
            {
                return "ERROR: " + ex.Message;
            }
        }


        // Método auxiliar seguro para destruir archivos binarios del disco
        private static void BorrarArchivoFisico(string rutaWebRelativa)
        {
            if (!string.IsNullOrWhiteSpace(rutaWebRelativa) && rutaWebRelativa.StartsWith("/images/"))
            {
                // Traduce la ruta web (ej: /images/cronica_123.jpg) a una ruta física real del disco duro (C:\...)
                string rutaFisicaDisco = System.Web.HttpContext.Current.Server.MapPath("~" + rutaWebRelativa);

                if (File.Exists(rutaFisicaDisco))
                {
                    File.Delete(rutaFisicaDisco); // Elimina permanentemente el archivo binario
                }
            }
        }



        protected void btnPublicarServidor_Click(object sender, EventArgs e)
        {
            pnlExito.Visible = false;
            pnlError.Visible = false;

            // 1. Validaciones básicas de campos vacíos
            if (string.IsNullOrWhiteSpace(txtTitulo.Text) || string.IsNullOrWhiteSpace(txtAutor.Text) ||
                string.IsNullOrWhiteSpace(txtResumen.Text) || string.IsNullOrWhiteSpace(txtContenido.Text))
            {
                MostrarError("Por favor completa todos los campos de texto obligatorios.");
                return;
            }

            // 2. Control obligatorio de la Imagen 1
            if (!fileImagen1.HasFile)
            {
                MostrarError("Es obligatorio seleccionar una imagen principal (Imagen 1) de tu almacenamiento.");
                return;
            }

            try
            {
                // Procesar y guardar la Imagen 1 en el servidor local
                string urlFisicaImagen1 = ProcesarSubidaImagen(fileImagen1);
                if (urlFisicaImagen1.StartsWith("ERROR:"))
                {
                    MostrarError(urlFisicaImagen1.Replace("ERROR:", ""));
                    return;
                }

                // Procesar opcionalmente la Imagen 2
                string urlFisicaImagen2 = "";
                if (fileImagen2.HasFile)
                {
                    urlFisicaImagen2 = ProcesarSubidaImagen(fileImagen2);
                    if (urlFisicaImagen2.StartsWith("ERROR:"))
                    {
                        MostrarError(urlFisicaImagen2.Replace("ERROR:", ""));
                        return;
                    }
                }

                // 🛠️ ALMACENAMIENTO MATRICIAL DE LA GALERÍA MÚLTIPLE DE ARCHIVOS LOCALES
                List<string> listaRutasGaleria = new List<string>();

                if (fileGaleriaMultiple.HasFiles)
                {
                    // ⚡ CAPA DE SEGURIDAD DEFINITIVA: Valida que el paquete HTTP no exceda el límite establecido
                    if (fileGaleriaMultiple.PostedFiles.Count > 5)
                    {
                        MostrarError("Operación denegada: La galería no puede contener más de 5 imágenes complementarias.");
                        return;
                    }

                    foreach (System.Web.HttpPostedFile archivoPosteado in fileGaleriaMultiple.PostedFiles)
                    {
                        string extension = Path.GetExtension(archivoPosteado.FileName).ToLower();
                        if (extension != ".jpg" && extension != ".jpeg" && extension != ".png" && extension != ".webp")
                        {
                            MostrarError("El archivo " + archivoPosteado.FileName + " de la galería no es una imagen válida (Soportados: JPG, PNG, WEBP).");
                            return;
                        }

                        if (archivoPosteado.ContentLength > 4194304) // Límite individual de 4MB
                        {
                            MostrarError("La imagen " + archivoPosteado.FileName + " de la galería supera el peso límite de 4MB.");
                            return;
                        }

                        // Generamos una firma única por cada foto de la galería
                        string nombreUnicoFoto = "galeria_" + DateTime.Now.Ticks + "_" + Guid.NewGuid().ToString().Substring(0, 5) + extension;
                        string rutaServidorFolder = Server.MapPath("~/images/");

                        if (!Directory.Exists(rutaServidorFolder))
                        {
                            Directory.CreateDirectory(rutaServidorFolder);
                        }

                        string rutaCompletaDestino = Path.Combine(rutaServidorFolder, nombreUnicoFoto);
                        archivoPosteado.SaveAs(rutaCompletaDestino);

                        listaRutasGaleria.Add("/images/" + nombreUnicoFoto);
                    }
                }


                // 3. Formatear saltos de línea para que pasen limpios como HTML semántico (<br/>)
                string contenidoConFormato = txtContenido.Text.Trim().Replace("\r\n", "<br/>").Replace("\n", "<br/>");

                // 4. Construir el objeto estructurado plano con el arreglo de la galería integrado
                var nuevoArticulo = new
                {
                    Autor = txtAutor.Text.Trim(),
                    Categoria = ddlCategoria.SelectedValue,
                    Fecha = DateTime.UtcNow.ToString("yyyy-MM-ddTHH:mm:ssZ"),
                    Titulo = txtTitulo.Text.Trim(),
                    Resumen = txtResumen.Text.Trim(),
                    Contenido = contenidoConFormato,
                    UrlImagen = urlFisicaImagen1,
                    UrlImagen2 = urlFisicaImagen2,
                    Galeria = listaRutasGaleria.ToArray() // Convierte la colección a un arreglo JSON nativo []
                };

                // 5. Envío síncronizado seguro para Web Forms hacia Firebase
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                string jsonPayload = serializer.Serialize(nuevoArticulo);

                using (HttpClient client = new HttpClient())
                {
                    var content = new StringContent(jsonPayload, Encoding.UTF8, "application/json");
                    HttpResponseMessage response = client.PostAsync(FirebaseUrl, content).Result;

                    if (response.IsSuccessStatusCode)
                    {
                        pnlExito.Visible = true;
                        LimpiarCampos();
                    }
                    else
                    {
                        MostrarError("Las imágenes se guardaron en el servidor, pero Firebase rechazó el registro.");
                    }
                }
            }
            catch (Exception ex)
            {
                MostrarError("Fallo crítico en el almacenamiento: " + ex.Message);
            }
        }

        // 🛠️ MOTOR INTERNO DE PROCESAMIENTO Y VALIDACIÓN BINARIA DE ARCHIVOS
        private string ProcesarSubidaImagen(System.Web.UI.WebControls.FileUpload controlArchivo)
        {
            string extension = Path.GetExtension(controlArchivo.FileName).ToLower();

            if (extension != ".jpg" && extension != ".jpeg" && extension != ".png" && extension != ".webp")
            {
                return "ERROR: El archivo " + controlArchivo.FileName + " no es una imagen válida (Soportados: JPG, PNG, WEBP).";
            }

            if (controlArchivo.PostedFile.ContentLength > 4194304)
            {
                return "ERROR: La imagen supera el peso límite de 4MB.";
            }

            string nombreUnico = "cronica_" + DateTime.Now.Ticks + extension;
            string rutaServidorFolder = Server.MapPath("~/images/");

            if (!Directory.Exists(rutaServidorFolder))
            {
                Directory.CreateDirectory(rutaServidorFolder);
            }

            string rutaCompletaDestino = Path.Combine(rutaServidorFolder, nombreUnico);
            controlArchivo.SaveAs(rutaCompletaDestino);

            return "/images/" + nombreUnico;
        }

        private void MostrarError(string mensaje)
        {
            pnlError.Visible = true;
            litMensajeError.Text = mensaje;
        }

        private void LimpiarCampos()
        {
            txtTitulo.Text = string.Empty;
            txtAutor.Text = string.Empty;
            txtResumen.Text = string.Empty;
            txtContenido.Text = string.Empty;
            ddlCategoria.SelectedIndex = 0;
        }
    }
}
