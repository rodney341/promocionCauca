using System;
using System.Web.UI;
using WebAppPromocionCauca.Repositories; // ◄ Importar el nuevo repositorio

namespace WebAppPromocionCauca
{
    public partial class Rutas : System.Web.UI.Page
    {
        private readonly RutasLocalRepository _repository = new RutasLocalRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCatálogoTarjetas();
            }
        }

        private void CargarCatálogoTarjetas()
        {
            // Consumo directo y limpio desde el repositorio centralizado
            rptRutas.DataSource = _repository.ObtenerTodas();
            rptRutas.DataBind();
        }
    }
}
