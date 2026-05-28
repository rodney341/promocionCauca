using System;
using System.Web.UI;

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
            }
        }
    }
}
