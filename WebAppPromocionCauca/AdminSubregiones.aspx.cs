using Google.Cloud.Firestore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI.WebControls;

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
            try
            {
                FirestoreDb db = ObtenerDb();

                string rutaImagen = hfImagenActual.Value;

                if (fuImagen.HasFile)
                {
                    string carpeta =
                        Server.MapPath("~/images/subregiones/");

                    if (!Directory.Exists(carpeta))
                    {
                        Directory.CreateDirectory(carpeta);
                    }

                    string nombreArchivo =
                        Guid.NewGuid().ToString() +
                        Path.GetExtension(fuImagen.FileName);

                    string rutaFisica =
                        Path.Combine(carpeta, nombreArchivo);

                    fuImagen.SaveAs(rutaFisica);

                    rutaImagen =
                        "/images/subregiones/" + nombreArchivo;
                }

                var datos = new
                {
                    nombre = txtNombre.Text.Trim(),
                    descripcion = txtDescripcion.Text.Trim(),
                    imagen = rutaImagen,
                    url = txtUrl.Text.Trim(),
                    orden = Convert.ToInt32(txtOrden.Text),
                    activo = chkActivo.Checked
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

                LimpiarFormulario();
                CargarSubregiones();
            }
            catch (Exception ex)
            {
                Response.Write(
                    "<script>alert('" +
                    ex.Message.Replace("'", "") +
                    "');</script>");
            }
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

            List<Subregion> lista =
                new List<Subregion>();

            foreach (DocumentSnapshot doc in snapshot.Documents)
            {
                lista.Add(new Subregion
                {
                    id = doc.Id,
                    nombre = doc.ContainsField("nombre")
                        ? doc.GetValue<string>("nombre")
                        : "",

                    descripcion = doc.ContainsField("descripcion")
                        ? doc.GetValue<string>("descripcion")
                        : "",

                    imagen = doc.ContainsField("imagen")
                        ? doc.GetValue<string>("imagen")
                        : "",

                    url = doc.ContainsField("url")
                        ? doc.GetValue<string>("url")
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
            string id = e.CommandArgument.ToString();

            if (e.CommandName == "Editar")
            {
                EditarRegistro(id);
            }

            if (e.CommandName == "Eliminar")
            {
                EliminarRegistro(id);
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

            txtUrl.Text =
                doc.GetValue<string>("url");

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
            txtUrl.Text = "";
            txtOrden.Text = "";

            chkActivo.Checked = true;

            imgPreview.ImageUrl = "";
        }
    }

}