using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebAppPromocionCauca
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Añade los metadatos de redes sociales en el encabezado
            var ogImage = new System.Web.UI.HtmlControls.HtmlMeta();
            ogImage.Attributes.Add("property", "og:image");
            ogImage.Content = "https://unsplash.com"; // Tu foto principal del Cauca
            Page.Header.Controls.Add(ogImage);

            if (!IsPostBack)
            {
                // 🎯 SEO: Configuración de la Portada Principal
                Page.Title = "Vive Cauca | Portal Oficial de Promoción Turística";

                Page.MetaDescription = "Descubre el Departamento del Cauca: la arquitectura de Popayán, el Parque Natural Puracé, el mercado de Silvia y la riqueza cultural del Macizo Colombiano.";

                Page.MetaKeywords = "turismo cauca, viajar a popayan, parque purace, silvia guambia, tierradentro, ecoturismo colombia, semana santa popayan, gastronomia unesco";
                CargarSubregiones();
            }
        }

        protected void btnExplorar_Click(object sender, EventArgs e)
        {
            // Response.Redirect("~/Rutas.aspx");
            Response.Redirect("~/Default.aspx#destinos");
        }

        protected void lnkDestino_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string destinoSeleccionado = btn.CommandArgument;

            // Enrutamiento basado en la selección del turista
            switch (destinoSeleccionado)
            {
                case "Popayan":
                    Response.Redirect("~/Destinos/Popayan.aspx");
                    break;
                case "Purace":
                    Response.Redirect("~/Destinos/Purace.aspx");
                    break;
                case "Cultura":
                    Response.Redirect("~/Destinos/CulturaSaberes.aspx");
                    break;
            }
        }
        private void CargarSubregiones()
        {
            var subregiones = new List<dynamic>
            {
                new {
                    Nombre = "Centro",
                    Descripcion = "Popayán y municipios cercanos con riqueza histórica y gastronómica.",
                    Imagen = "/images/subregiones/centro.jpg",
                    Url = "/Subregion.aspx?id=centro"
                },

                new {
                    Nombre = "Macizo Colombiano",
                    Descripcion = "Nacimiento de grandes ríos y paisajes de alta montaña.",
                    Imagen = "/images/subregiones/macizo.jpg",
                    Url = "/Subregion.aspx?id=macizo"
                },

                new {
                    Nombre = "Oriente",
                    Descripcion = "Patrimonio arqueológico y comunidades indígenas ancestrales.",
                    Imagen = "/images/subregiones/oriente.jpg",
                    Url = "/Subregion.aspx?id=oriente"
                },

                new {
                    Nombre = "Norte",
                    Descripcion = "Cultura afrodescendiente, tradición y desarrollo agrícola.",
                    Imagen = "/images/subregiones/norte.jpg",
                    Url = "/Subregion.aspx?id=norte"
                },

                new {
                    Nombre = "Pacífico",
                    Descripcion = "Selva tropical, manglares y biodiversidad excepcional.",
                    Imagen = "/images/subregiones/pacifico.jpg",
                    Url = "/Subregion.aspx?id=pacifico"
                },

                new {
                    Nombre = "Sur",
                    Descripcion = "Montañas andinas, tradición campesina y paisajes naturales.",
                    Imagen = "/images/subregiones/sur.jpg",
                    Url = "/Subregion.aspx?id=sur"
                },
                new {
                    Nombre = "Piamonte",
                    Descripcion = "Montañas andinas, tradición campesina y paisajes naturales.",
                    Imagen = "/images/subregiones/sur.jpg",
                    Url = "/Subregion.aspx?id=sur"
                }
            };
        /*    var total = subregiones.Count;
            rptSubregiones.ItemDataBound += (s, e) =>
            {
                if (e.Item.ItemType == ListItemType.Item ||
                    e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    if (e.Item.ItemIndex == total - 1 && total % 2 != 0)
                    {
                        var contenedor = (HtmlGenericControl)e.Item.FindControl("contenedor");
                        contenedor.Attributes["class"] =
                            "col-lg-6 col-md-8 mx-auto";
                    }
                }
            };*/
            rptSubregiones.DataSource = subregiones;
            rptSubregiones.DataBind();
        }
    }
}
