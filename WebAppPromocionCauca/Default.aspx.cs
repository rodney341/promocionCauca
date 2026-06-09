using System;
using System.Web.UI;
using WebAppPromocionCauca.Interfaces;
using WebAppPromocionCauca.Repositories;


namespace WebAppPromocionCauca
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var ogImage = new System.Web.UI.HtmlControls.HtmlMeta();
            ogImage.Attributes.Add("property", "og:image");
            ogImage.Content = "/images/Colibri-AdrianaCollazos.jpg";
            Page.Header.Controls.Add(ogImage);

            if (!IsPostBack)
            {
                Page.Title = "Vive Cauca | Portal Oficial de Promoción Turística";

                Page.MetaDescription = "Descubre el Departamento del Cauca: la arquitectura de Popayán, el Parque Natural Puracé, el mercado de Silvia y la riqueza cultural del Macizo Colombiano.";

                Page.MetaKeywords = "turismo cauca, viajar a popayan, parque purace, silvia guambia, tierradentro, ecoturismo colombia, semana santa popayan, gastronomia unesco";
                CargarSubregiones();
            }
        }

        private void CargarSubregiones()
        {
            ISubregionRepository repo = RepositoryFactory.CrearSubregionRepository();
            rptSubregiones.DataSource = repo.ObtenerSubregiones();
            rptSubregiones.DataBind();
        }
    }
}
