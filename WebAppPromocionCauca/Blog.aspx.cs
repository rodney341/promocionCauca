using System;
using System.Web.UI;

namespace WebAppPromocionCauca
{
    public partial class Blog : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Dejamos únicamente las configuraciones esenciales de metadatos SEO
                Page.Title = "Blog de Viajes e Historias del Cauca | Crónicas en Vivo";
            }
        }
    }
}
