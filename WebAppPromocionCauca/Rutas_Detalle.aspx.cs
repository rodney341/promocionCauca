using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Security.Principal;
using System.Web;
using WebAppPromocionCauca.Models;
using WebAppPromocionCauca.Repositories; // ◄ Importar el nuevo repositorio

namespace WebAppPromocionCauca
{
    public partial class Rutas_Detalle : System.Web.UI.Page
    {
        private readonly RutasLocalRepository _repository = new RutasLocalRepository();

        protected List<string> GeoJsonDataOutput = new List<string>();
        protected List<string> GeoJsonFilesOutput = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatosCircuito();
            }
        }

        private void CargarDatosCircuito()
        {
            string idParam = Request.QueryString["id"];
            int idRuta;

            if (string.IsNullOrEmpty(idParam) || !int.TryParse(idParam, out idRuta))
            {
                MostrarError();
                return;
            }

            // Consultar directamente al repositorio centralizado por ID
            RutaModel rutaSeleccionada = _repository.ObtenerPorId(idRuta);

            if (rutaSeleccionada == null)
            {
                MostrarError();
                return;
            }

            // Asignación de literales a los controles del servidor
            litNombreRuta.Text = rutaSeleccionada.nombre;
            litDuracionHeader.Text = rutaSeleccionada.duracion;
            litDuracionFicha.Text = rutaSeleccionada.duracion;
            litDescripcionLarga.Text = rutaSeleccionada.descripcion;
            litDistancia.Text = rutaSeleccionada.distancia;
            litMunicipios.Text = rutaSeleccionada.municipios;
            litAtractivos.Text = rutaSeleccionada.atractivos;
            litServicios.Text = rutaSeleccionada.servicios;
            imgPrincipal.Src = rutaSeleccionada.imagen;
          //  btnReservar.HRef = $"Contacto.aspx?ruta={rutaSeleccionada.Id}";

            if (rutaSeleccionada.galeria != null && rutaSeleccionada.galeria.Length > 0)
            {
                rptGaleria.DataSource = rutaSeleccionada.galeria;
                rptGaleria.DataBind();
            }


            // Añade esta línea al final del método CargarDatosCircuito(), justo debajo del enlace de la galería:
            if (rutaSeleccionada.operadores != null)
            {
                rptOperadores.DataSource = rutaSeleccionada.operadores;
                rptOperadores.DataBind();
            }



            // Procesamiento físico de los tramos GeoJSON mapeados en el repositorio
            string rootPath = HttpRuntime.AppDomainAppPath;
            GeoJsonFilesOutput = rutaSeleccionada.geoJsonFiles ?? new List<string>();

            foreach (var file in GeoJsonFilesOutput)
            {
                if (string.IsNullOrEmpty(file)) continue;
                string fullPath = Path.Combine(rootPath, "jsonFiles", file);

                if (File.Exists(fullPath))
                {
                    GeoJsonDataOutput.Add(File.ReadAllText(fullPath));
                }
                else
                {
                    GeoJsonDataOutput.Add("{}");
                }
            }

            pnlDetalle.Visible = true;
            pnlError.Visible = false;
        }

        private void MostrarError()
        {
            pnlDetalle.Visible = false;
            pnlError.Visible = true;
        }

        protected string GetGeoJsonDataListAsJson()
        {
            var serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return serializer.Serialize(GeoJsonDataOutput);
        }

        protected string GetGeoJsonFileNamesAsJson()
        {
            var serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return serializer.Serialize(GeoJsonFilesOutput);
        }
    }
}
