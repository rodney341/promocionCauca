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

            string contenido =
                doc.GetValue<string>("contenido");

            string[] parrafos =
                contenido.Split(
                    new[] { "\r\n\r\n", "\n\n" },
                    StringSplitOptions.RemoveEmptyEntries);

            litContenido.Text =
                string.Join("",
                    parrafos.Select(p =>
                        $"<p>{Server.HtmlEncode(p.Trim())}</p>"));

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

            int orden = doc.GetValue<int>("orden");

            CargarNavegacion(orden);

        }

        private void CargarNavegacion(int ordenActual)
        {
            FirestoreDb db = ObtenerDb();

            var lista = db.Collection("subregiones")
                .WhereEqualTo("activo", true)
                .GetSnapshotAsync()
                .GetAwaiter()
                .GetResult()
                .Documents
                .Select(d => new
                {
                    Nombre = d.GetValue<string>("nombre"),
                    Slug = d.GetValue<string>("slug"),
                    Orden = d.GetValue<int>("orden")
                })
                .OrderBy(x => x.Orden)
                .ToList();

            int indice =
                lista.FindIndex(x => x.Orden == ordenActual);

            if (indice == -1)
                return;

            // ANTERIOR
            int indiceAnterior =
                (indice == 0)
                ? lista.Count - 1
                : indice - 1;

            lnkAnterior.Text =
                "← " + lista[indiceAnterior].Nombre;

            lnkAnterior.NavigateUrl =
                "/Subregion.aspx?id=" +
                lista[indiceAnterior].Slug;

            lnkAnterior.Visible = true;

            // SIGUIENTE
            int indiceSiguiente =
                (indice == lista.Count - 1)
                ? 0
                : indice + 1;

            lnkSiguiente.Text =
                lista[indiceSiguiente].Nombre + " →";

            lnkSiguiente.NavigateUrl =
                "/Subregion.aspx?id=" +
                lista[indiceSiguiente].Slug;

            lnkSiguiente.Visible = true;
        }

    }
}