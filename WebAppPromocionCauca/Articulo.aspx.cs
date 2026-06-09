using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net;
using System.Web.UI;
using WebAppPromocionCauca.Models;
using System.Linq;

namespace WebAppPromocionCauca
{
    public partial class Articulo : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Deja que JavaScript controle dinámicamente la inyección de los textos
                Page.Title = "Leyendo Crónica de Viaje | Vive Cauca";
                CargarArticulo();
            }
        }

        private List<BlogModel> ObtenerBlogs()
        {
            try
            {
                string url =
                    "https://script.google.com/macros/s/AKfycbxTIHwRRIVeUln3Z1sfEiAHLsCZPVDjd8KFGMlMTlvna1yVWQYbCobAxBER-wtn6ofiJQ/exec?tipo=blog";

                using (WebClient client = new WebClient())
                {
                    client.Encoding =
                        System.Text.Encoding.UTF8;

                    string json =
                        client.DownloadString(url);

                    return JsonConvert
                        .DeserializeObject<List<BlogModel>>(json)
                        .OrderByDescending(x => x.fecha)
                        .ToList();
                }
            }
            catch
            {
                return new List<BlogModel>();
            }
        }

        private void CargarArticulo()
        {
            string slug = Request.QueryString["slug"];

            if (string.IsNullOrWhiteSpace(slug))
            {
                Response.Redirect("~/Blog.aspx");
                return;
            }

            BlogModel articulo = ObtenerBlogs()
                .FirstOrDefault(x => x.slug == slug);

            if (articulo == null)
            {
                Response.Redirect("~/Blog.aspx");
                return;
            }

            lblTitulo.Text = articulo.titulo;
            lblCategoria.Text = articulo.categoria;
            lblAutor.Text = articulo.autor;
            lblResumen.Text = articulo.resumen;
            lblFecha.Text = articulo.fecha.ToString("dd MMMM yyyy");

            litContenido.Text = articulo.contenido;

            heroArticulo.Attributes["style"] =
                $"background-image:url('{articulo.urlImagen}')";
            imgSecundaria.ImageUrl = articulo.urlImagen2;
            if (articulo.galeria != null &&
                  articulo.galeria.Count > 0)
            {
                List<string> galeria = articulo.galeria;
                rptGaleria.DataSource = galeria;
                rptGaleria.DataBind();
            }

            Page.Title =
                articulo.titulo + " | Turismo Cauca";
        }

    }
}
