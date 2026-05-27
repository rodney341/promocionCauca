using System;
using System.Web.UI;

namespace WebAppPromocionCauca
{
    public partial class Rutas : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Define el título dinámico que se inyectará en la etiqueta <title> de la Site.Master
                Page.Title = "Rutas y Circuitos Oficiales";
            }
        }
    }
}
