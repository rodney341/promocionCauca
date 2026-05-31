using Google.Cloud.Firestore;
using System;
using System.Linq;
using System.Collections.Generic;

namespace WebAppPromocionCauca
{
    public partial class Subregion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarSubregion();
            }
        }

        private FirestoreDb ObtenerDb()
        {
            string credentialPath =
                Server.MapPath("~/App_Data/firebase-key.json");

            if (!System.IO.File.Exists(credentialPath))
            {
                throw new Exception(
                    "No existe firebase-key.json en App_Data");
            }

            Environment.SetEnvironmentVariable(
                "GOOGLE_APPLICATION_CREDENTIALS",
                credentialPath);

            return FirestoreDb.Create("turismocauca-7a4ec");
        }

        private void CargarSubregion()
        {
            string slug =
                Request.QueryString["id"];

            if (string.IsNullOrEmpty(slug))
            {
                Response.Redirect("~/Default.aspx");
                return;
            }

            FirestoreDb db = ObtenerDb();

            Query query =
                db.Collection("subregiones")
                  .WhereEqualTo("slug", slug);

            var snapshot =
                query.GetSnapshotAsync()
                .GetAwaiter()
                .GetResult();

            if (snapshot.Documents.Count == 0)
            {
                Response.Redirect("~/Default.aspx");
                return;
            }

            var doc = snapshot.Documents.First();

            lblNombre.Text =
                doc.GetValue<string>("nombre");

            lblDescripcion.Text =
                doc.GetValue<string>("descripcion");

            litContenido.Text =
                doc.GetValue<string>("contenido");

            string imagen =
                doc.GetValue<string>("imagen");

            subHeroBg.Attributes["style"] =
                $"background-image:url('{imagen}')";
            if (doc.ContainsField("galeria"))
            {
                List<string> galeria =
                    doc.GetValue<List<string>>("galeria");

                rptGaleria.DataSource = galeria;
                rptGaleria.DataBind();
            }
        }
    }
}