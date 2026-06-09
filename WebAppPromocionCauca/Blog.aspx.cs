using Google.Cloud.Firestore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web.UI;
using WebAppPromocionCauca.Interfaces;
using WebAppPromocionCauca.Models;
using WebAppPromocionCauca.Repositories;

namespace WebAppPromocionCauca
{
    public partial class Blog : Page
    {
        private const int TAMANO_PAGINA = 6;
        protected string HtmlPaginacion = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.Title = "Crónicas de Nuestra Tierra | Turismo Cauca";

                Page.MetaDescription =
                    "Historias, rutas, gastronomía y experiencias para descubrir el Cauca.";

                CargarBlogs();
            }
        }

        private void CargarBlogs()
        {

            IBlogRepository repo = RepositoryFactory.CrearBlogRepository();
            List<BlogModel> blogs =  repo.ObtenerBlogs();
            int paginaActual = 1;

            if (!string.IsNullOrEmpty(Request.QueryString["p"]))
            {
                int.TryParse(Request.QueryString["p"], out paginaActual);

                if (paginaActual <= 0)
                    paginaActual = 1;
            }

            int totalRegistros = blogs.Count;

            int totalPaginas =
                (int)Math.Ceiling((double)totalRegistros / TAMANO_PAGINA);

            rptBlog.DataSource = blogs
                .Skip((paginaActual - 1) * TAMANO_PAGINA)
                .Take(TAMANO_PAGINA)
                .ToList();

            rptBlog.DataBind();

            GenerarPaginacion(paginaActual, totalPaginas);
        }

        private void GenerarPaginacion(
            int paginaActual,
            int totalPaginas)
        {
            string html = "";

            if (totalPaginas <= 1)
            {
                HtmlPaginacion = "";
                return;
            }

            // Anterior
            if (paginaActual > 1)
            {
                html += $@"
                <li class='page-item'>
                    <a class='page-link'
                       href='Blog.aspx?p={paginaActual - 1}'>
                       «
                    </a>
                </li>";
            }

            for (int i = 1; i <= totalPaginas; i++)
            {
                string active =
                    i == paginaActual
                    ? "active"
                    : "";

                html += $@"
                <li class='page-item {active}'>
                    <a class='page-link'
                       href='Blog.aspx?p={i}'>
                        {i}
                    </a>
                </li>";
            }

            // Siguiente
            if (paginaActual < totalPaginas)
            {
                html += $@"
                <li class='page-item'>
                    <a class='page-link'
                       href='Blog.aspx?p={paginaActual + 1}'>
                       »
                    </a>
                </li>";
            }

            HtmlPaginacion = html;
        }

    }
}