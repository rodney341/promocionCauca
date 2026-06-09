using Google.Cloud.Firestore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using WebAppPromocionCauca.Models;

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

        private List<SubregionModel> ObtenerSubregiones()
        {
            try
            {
                string url =
                    "https://script.google.com/macros/s/AKfycbxTIHwRRIVeUln3Z1sfEiAHLsCZPVDjd8KFGMlMTlvna1yVWQYbCobAxBER-wtn6ofiJQ/exec?tipo=subregiones";

                using (WebClient client = new WebClient())
                {
                    client.Encoding =
                        System.Text.Encoding.UTF8;

                    string json =
                        client.DownloadString(url);

                    return JsonConvert
                        .DeserializeObject<List<SubregionModel>>(json)
                        .ToList();
                }
            }
            catch
            {
                return new List<SubregionModel>();
            }
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

            SubregionModel subregion = ObtenerSubregiones()
    .FirstOrDefault(x => x.slug == slug);


            if (subregion == null)
            {
                Response.Redirect("~/Default.aspx");
                return;
            }



            lblNombre.Text = subregion.nombre;

            lblDescripcion.Text = subregion.descripcion;
                
            litContenido.Text = subregion.contenido;

            string imagen = subregion.imagen;
                
            subHeroBg.Attributes["style"] =
                $"background-image:url('{imagen}')";
            if (subregion.galeria != null &&
                subregion.galeria.Count > 0)
            {
                List<string> galeria =subregion.galeria;
                rptGaleria.DataSource = galeria;
                rptGaleria.DataBind();
            }

            int orden = subregion.orden;

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