using Google.Cloud.Firestore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web.UI;
using WebAppPromocionCauca.Models;

namespace WebAppPromocionCauca
{
    public partial class Blog : Page
    {
        private const int TAMANO_PAGINA = 6;
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
        private List<BlogModel> ObtenerBlogs()
        {
            try
            {
                string url =
                    "https://script.google.com/macros/s/AKfycbw5ZXIC0qVh-TvRyJAyhJoYfqT0ErNbl0OYn4h6v-XZWNHWzHtCbJ_QGuEhD55h_ANLFw/exec?tipo=blog";

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
        private List<BlogModel> ObtenerBlogsxx()
        {
            string credentialPath =
                Server.MapPath("~/App_Data/firebase-key.json");

            if (!File.Exists(credentialPath))
            {
                throw new Exception("No existe el archivo firebase-key.json");
            }

            Environment.SetEnvironmentVariable(
                "GOOGLE_APPLICATION_CREDENTIALS",
                credentialPath);

            FirestoreDb db =
                FirestoreDb.Create("turismocauca-7a4ec");

            Query query = db.Collection("blog")
                            .WhereEqualTo("activo", true);

            List<BlogModel> lista =
                new List<BlogModel>();

            try
            {
                QuerySnapshot snapshot =
                    query.GetSnapshotAsync()
                         .GetAwaiter()
                         .GetResult();

                foreach (DocumentSnapshot doc in snapshot.Documents)
                {
                    DateTime fecha = DateTime.MinValue;

                    if (doc.ContainsField("fechaPublicacion"))
                    {
                        Timestamp ts =
                            doc.GetValue<Timestamp>("fechaPublicacion");

                        fecha = ts.ToDateTime();
                    }

                    lista.Add(new BlogModel
                    {
                        titulo = doc.ContainsField("titulo")
                            ? doc.GetValue<string>("titulo")
                            : "",

                        resumen = doc.ContainsField("resumen")
                            ? doc.GetValue<string>("resumen")
                            : "",

                        contenido = doc.ContainsField("contenido")
                            ? doc.GetValue<string>("contenido")
                            : "",

                        urlImagen = doc.ContainsField("imagen")
                            ? doc.GetValue<string>("imagen")
                            : "",

                        categoria = doc.ContainsField("categoria")
                            ? doc.GetValue<string>("categoria")
                            : "",

                      //  Slug = doc.ContainsField("slug")? doc.GetValue<string>("slug"): "",

                        autor = doc.ContainsField("autor")
                            ? doc.GetValue<string>("autor")
                            : "",

                        fecha = fecha,

                        activo = doc.ContainsField("activo")
                            && doc.GetValue<bool>("activo")
                    });
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

            return lista;
        }

        private void CargarBlogs()
        {
            List<BlogModel> blogs = ObtenerBlogs();

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

        protected string HtmlPaginacion = "";

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