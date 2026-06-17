using System;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using WebAppPromocionCauca.Interfaces;
using WebAppPromocionCauca.Repositories;
using System.IO;


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
            ISubregionRepository repo = new SubregionLocalRepository();
            rptSubregiones.DataSource = repo.ObtenerSubregiones();
            rptSubregiones.DataBind();
        }
        [WebMethod]
        public static string ObtenerDatosJson()
        {
            try
            {
                if (HttpContext.Current == null)
                    return "{\"error\": \"El contexto HTTP actual es nulo.\"}";

                string rutaRegiones = HttpContext.Current.Server.MapPath("~/jsonFiles/regiones.json");
                string rutaCauca = HttpContext.Current.Server.MapPath("~/jsonFiles/cauca.json");
                string rutaLimites = HttpContext.Current.Server.MapPath("~/jsonFiles/limites_aledanos.json");

                if (!File.Exists(rutaRegiones))
                    return $"{{\"error\": \"No se encontró el archivo regiones.json en la ruta: {rutaRegiones.Replace("\\", "\\\\")}\"}}";

                if (!File.Exists(rutaCauca))
                    return $"{{\"error\": \"No se encontró el archivo cauca.json en la ruta: {rutaCauca.Replace("\\", "\\\\")}\"}}";

                if (!File.Exists(rutaLimites))
                    return $"{{\"error\": \"No se encontró el archivo limites_aledanos.json en la ruta: {rutaLimites.Replace("\\", "\\\\")}\"}}";

                string regiones = File.ReadAllText(rutaRegiones);
                string cauca = File.ReadAllText(rutaCauca);
                string limites = File.ReadAllText(rutaLimites);

                return $"{{\"regiones\": {regiones}, \"cauca\": {cauca}, \"limites\": {limites}}}";
            }
            catch (Exception ex)
            {
                string mensajeError = ex.Message.Replace("\"", "\\\"");
                return $"{{\"error\": \"Excepción interna del servidor: {mensajeError}\"}}";
            }
        }
    }
}
