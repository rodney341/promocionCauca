using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppPromocionCauca
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Inicializaciones lógicas de la campaña promocional si son requeridas
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
