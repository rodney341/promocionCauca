using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web.UI;
using WebAppPromocionCauca.Interfaces;
using WebAppPromocionCauca.Models;
using WebAppPromocionCauca.Repositories;

namespace WebAppPromocionCauca
{
    public partial class Articulo : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.Title = "Leyendo Crónica de Viaje | Vive Cauca";
                CargarArticulo();
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
            IBlogRepository repo = new BlogSheetsRepository();

            BlogModel articulo = repo.ObtenerBlogs()
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

            imgPrincipal.ImageUrl = ResolveUrl(articulo.urlImagen);
            imgSecundaria.ImageUrl = ResolveUrl(articulo.urlImagen2);
            //imgSecundaria.ImageUrl = articulo.urlImagen2;
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
