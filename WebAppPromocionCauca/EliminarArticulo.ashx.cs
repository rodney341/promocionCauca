using System;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;

namespace WebAppPromocionCauca
{
    public class EliminarArticulo : IHttpHandler
    {
        private static readonly string BaseFirebaseUrl = "https://turismocauca-7a4ec-default-rtdb.firebaseio.com/blog";

        public void ProcessRequest(HttpContext context)
        {
            // Configuramos los encabezados de respuesta para datos limpios JSON libres de bloqueos
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = Encoding.UTF8;

            try
            {
                // 1. Capturamos el ID del artículo que viene por la URL (QueryString)
                string idArticulo = context.Request.QueryString["id"];

                if (string.IsNullOrEmpty(idArticulo))
                {
                    context.Response.Write("{\"resultado\":\"ERROR: ID no válido.\"}");
                    return;
                }

                string urlConsulta = $"{BaseFirebaseUrl}/{idArticulo}.json";
                string jsonArticulo = "";

                // 2. Descargamos la información de Firebase para extraer las rutas de las fotos
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

                    // 3. Destrucción física de las imágenes en el disco duro del servidor
                    BorrarArchivoFisico(context, datos.ContainsKey("UrlImagen") ? datos["UrlImagen"]?.ToString() : "");
                    BorrarArchivoFisico(context, datos.ContainsKey("UrlImagen2") ? datos["UrlImagen2"]?.ToString() : "");

                    if (datos.ContainsKey("Galeria") && datos["Galeria"] is System.Collections.ArrayList)
                    {
                        var listaGaleria = (System.Collections.ArrayList)datos["Galeria"];
                        foreach (var fotoUrl in listaGaleria)
                        {
                            BorrarArchivoFisico(context, fotoUrl?.ToString());
                        }
                    }
                }

                // 4. Eliminación definitiva del registro en la base de datos en la nube
                using (WebClient client = new WebClient())
                {
                    client.UploadString(urlConsulta, "DELETE", "");
                }

                // Devolvemos confirmación en formato JSON plano estándar
                context.Response.Write("{\"resultado\":\"SUCCESS\"}");
            }
            catch (Exception ex)
            {
                context.Response.Write("{\"resultado\":\"ERROR: " + ex.Message.Replace("\"", "'") + "\"}");
            }
        }

        private void BorrarArchivoFisico(HttpContext context, string rutaWebRelativa)
        {
            if (!string.IsNullOrWhiteSpace(rutaWebRelativa) && rutaWebRelativa.StartsWith("/images/"))
            {
                // Mapeamos de forma segura la ruta física en el disco local usando el contexto de la petición
                string rutaFisicaDisco = context.Server.MapPath("~" + rutaWebRelativa);

                if (File.Exists(rutaFisicaDisco))
                {
                    File.Delete(rutaFisicaDisco);
                }
            }
        }

        public bool IsReusable
        {
            get { return false; }
        }
    }
}
