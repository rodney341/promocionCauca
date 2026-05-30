using System;
using System.Web.UI;

namespace WebAppPromocionCauca
{
    public partial class DetalleSubregion : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // El título dinámico se actualizará en la pestaña
                Page.Title = "Explorando Subregión | Territorio Cauca";
            }
        }
    }
}
