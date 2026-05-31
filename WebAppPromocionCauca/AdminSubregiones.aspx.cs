using Google.Cloud.Firestore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI.WebControls;
using WebAppPromocionCauca.Models;
using System.Globalization;

namespace WebAppPromocionCauca
{
    public partial class AdminSubregiones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarSubregiones();
            }
        }
        private string GenerarSlug(string texto)
        {
            texto = texto.ToLower();

            texto = texto.Replace("á", "a");
            texto = texto.Replace("é", "e");
            texto = texto.Replace("í", "i");
            texto = texto.Replace("ó", "o");
            texto = texto.Replace("ú", "u");
            texto = texto.Replace("ñ", "n");

            texto = texto.Replace(" ", "-");

            return texto;
        }

        private FirestoreDb ObtenerDb()
        {
            string credentialPath =
                Server.MapPath("~/App_Data/firebase-key.json");

            Environment.SetEnvironmentVariable(
                "GOOGLE_APPLICATION_CREDENTIALS",
                credentialPath);

            return FirestoreDb.Create("turismocauca-7a4ec");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            FirestoreDb db = ObtenerDb();

            List<string> galeria =
                    new List<string>();

            string rutaImagen = hfImagenActual.Value;
            if (fuImagen.HasFile)
            {
                if (fuImagen.PostedFile.ContentLength > 50 * 1024 * 1024)
                {
                    throw new Exception(
                        "La imagen supera los 5 MB permitidos.");
                }
                string carpeta =
                    Server.MapPath("~/images/subregiones/");
                if (!Directory.Exists(carpeta))
                {
                    Directory.CreateDirectory(carpeta);
                }

                string nombreLimpio =
                    GenerarNombreSeguro(
                        fuImagen.FileName);

                string nombreFinal =
                    ObtenerNombreDisponible(
                        carpeta,
                        nombreLimpio);

                string rutaFisica =
                    Path.Combine(carpeta, nombreFinal);

                fuImagen.SaveAs(rutaFisica);

                rutaImagen =
                    "/images/subregiones/" + nombreFinal;
            }

            if (fuGaleria.HasFiles)
            {
                string carpeta =
                    Server.MapPath("~/images/subregiones/");

                foreach (HttpPostedFile archivo in fuGaleria.PostedFiles)
                {
                    string nombreArchivo =
                        Guid.NewGuid() +
                        Path.GetExtension(archivo.FileName);

                    string rutaFisica =
                        Path.Combine(carpeta, nombreArchivo);

                    archivo.SaveAs(rutaFisica);

                    galeria.Add(
                        "/images/subregiones/" +
                        nombreArchivo);
                }
            }

            string slug =
                GenerarSlug(txtNombre.Text);

            var datos = new
            {
                nombre = txtNombre.Text,
                slug = slug,
                descripcion = txtDescripcion.Text,
                contenido = txtContenido.Text,
                imagen = rutaImagen,
                orden = Convert.ToInt32(txtOrden.Text),
                activo = chkActivo.Checked,
                galeria = galeria
            };

            if (string.IsNullOrEmpty(hfId.Value))
            {
                db.Collection("subregiones")
                  .Document()
                  .SetAsync(datos)
                  .GetAwaiter()
                  .GetResult();
            }
            else
            {
                db.Collection("subregiones")
                  .Document(hfId.Value)
                  .SetAsync(datos)
                  .GetAwaiter()
                  .GetResult();
            }

            CargarSubregiones();
        }

        private void CargarSubregiones()
        {
            FirestoreDb db = ObtenerDb();

            Query query =
                db.Collection("subregiones")
                  .OrderBy("orden");

            QuerySnapshot snapshot =
                query.GetSnapshotAsync()
                     .GetAwaiter()
                     .GetResult();

            List<SubregionModel> lista =
                new List<SubregionModel>();

            foreach (DocumentSnapshot doc in snapshot.Documents)
            {
                lista.Add(new SubregionModel
                {
                    id = doc.Id,
                    nombre = doc.ContainsField("nombre")
                        ? doc.GetValue<string>("nombre")
                        : "",

                    descripcion = doc.ContainsField("descripcion")
                        ? doc.GetValue<string>("descripcion")
                        : "",
                    contenido = doc.ContainsField("contenido")
                        ? doc.GetValue<string>("contenido")
                        : "",
                    imagen = doc.ContainsField("imagen")
                        ? doc.GetValue<string>("imagen")
                        : "",

                    orden = doc.ContainsField("orden")
                        ? doc.GetValue<int>("orden")
                        : 0,

                    activo = doc.ContainsField("activo")
                        && doc.GetValue<bool>("activo")
                });
            }

            gvSubregiones.DataSource = lista;
            gvSubregiones.DataBind();
        }

        protected void gvSubregiones_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                string id = e.CommandArgument.ToString();

                FirestoreDb db = ObtenerDb();

                DocumentReference docRef =
                    db.Collection("subregiones")
                      .Document(id);

                DocumentSnapshot doc =
                    docRef.GetSnapshotAsync()
                          .GetAwaiter()
                          .GetResult();

                if (doc.Exists)
                {
                    string imagen = "";

                    if (doc.ContainsField("imagen"))
                    {
                        imagen =
                            doc.GetValue<string>("imagen");
                    }

                    if (!string.IsNullOrEmpty(imagen))
                    {
                        string rutaFisica =
                            Server.MapPath(imagen);

                        if (System.IO.File.Exists(rutaFisica))
                        {
                            System.IO.File.Delete(rutaFisica);
                        }
                    }

                    docRef.DeleteAsync()
                          .GetAwaiter()
                          .GetResult();
                }

                if (doc.ContainsField("galeria"))
                {
                    var galeria =
                        doc.GetValue<List<string>>("galeria");

                    foreach (string img in galeria)
                    {
                        string ruta =
                            Server.MapPath(img);

                        if (System.IO.File.Exists(ruta))
                        {
                            System.IO.File.Delete(ruta);
                        }
                    }
                }

                CargarSubregiones();
            }
        }

        private void EditarRegistro(string id)
        {
            FirestoreDb db = ObtenerDb();

            DocumentSnapshot doc =
                db.Collection("subregiones")
                  .Document(id)
                  .GetSnapshotAsync()
                  .GetAwaiter()
                  .GetResult();

            if (!doc.Exists)
                return;

            hfId.Value = doc.Id;

            txtNombre.Text =
                doc.GetValue<string>("nombre");

            txtDescripcion.Text =
                doc.GetValue<string>("descripcion");

            txtOrden.Text =
                doc.GetValue<int>("orden")
                   .ToString();

            chkActivo.Checked =
                doc.GetValue<bool>("activo");

            string imagen =
                doc.GetValue<string>("imagen");

            hfImagenActual.Value = imagen;

            imgPreview.ImageUrl = imagen;
        }

        private void EliminarRegistro(string id)
        {
            FirestoreDb db = ObtenerDb();

            db.Collection("subregiones")
              .Document(id)
              .DeleteAsync()
              .GetAwaiter()
              .GetResult();

            CargarSubregiones();
        }

        protected void btnNuevo_Click(
            object sender,
            EventArgs e)
        {
            LimpiarFormulario();
        }

        private void LimpiarFormulario()
        {
            hfId.Value = "";
            hfImagenActual.Value = "";

            txtNombre.Text = "";
            txtDescripcion.Text = "";
            txtOrden.Text = "";

            chkActivo.Checked = true;

            imgPreview.ImageUrl = "";
        }



        private string GenerarNombreSeguro(
            string nombreArchivo)
            {
                string nombre =
                    Path.GetFileNameWithoutExtension(nombreArchivo);

                string extension =
                    Path.GetExtension(nombreArchivo);

                nombre = nombre.ToLower();

                nombre = nombre.Normalize(
                    NormalizationForm.FormD);

                nombre = new string(
                    nombre.Where(
                        c => CharUnicodeInfo.GetUnicodeCategory(c)
                            != UnicodeCategory.NonSpacingMark)
                    .ToArray());

                nombre = Regex.Replace(
                    nombre,
                    @"[^a-z0-9]+",
                    "-");

                nombre = nombre.Trim('-');

                return nombre + extension.ToLower();
            }


            private string ObtenerNombreDisponible(
                string carpeta,
                string nombreArchivo)
                {
                    string nombre =
                        Path.GetFileNameWithoutExtension(nombreArchivo);

                    string extension =
                        Path.GetExtension(nombreArchivo);

                    string nombreFinal =
                        nombreArchivo;

                    int contador = 1;

                    while (File.Exists(
                        Path.Combine(carpeta, nombreFinal)))
                    {
                        nombreFinal =
                            $"{nombre}-{contador}{extension}";

                        contador++;
                    }

                    return nombreFinal;
                }

}

        

}