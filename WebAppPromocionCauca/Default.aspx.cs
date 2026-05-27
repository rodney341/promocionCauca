using System;
using System.Web.UI;
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
    }
}
