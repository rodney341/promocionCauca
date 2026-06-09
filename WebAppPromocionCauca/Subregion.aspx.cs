using System;
using System.Collections.Generic;
using System.Linq;
using WebAppPromocionCauca.Interfaz;
using WebAppPromocionCauca.Models;
using WebAppPromocionCauca.Repository;

namespace WebAppPromocionCauca
{
    public partial class Subregion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarSubregion();
            }
        }

        private void CargarSubregion()
        {
            string slug = Request.QueryString["id"];

            if (string.IsNullOrWhiteSpace(slug))
            {
                Response.Redirect("~/Default.aspx");
                return;
            }

            ISubregionRepository repo =
                RepositoryFactory.CrearSubregionRepository();

            List<SubregionModel> subregiones =
                repo.ObtenerSubregiones();

            SubregionModel subregion =
                subregiones.FirstOrDefault(x => x.slug == slug);

            if (subregion == null)
            {
                Response.Redirect("~/Default.aspx");
                return;
            }

            lblNombre.Text = subregion.nombre;
            lblDescripcion.Text = subregion.descripcion;
            litContenido.Text = subregion.contenido;

            subHeroBg.Attributes["style"] =
                $"background-image:url('{subregion.imagen}')";

            if (subregion.galeria?.Any() == true)
            {
                rptGaleria.DataSource = subregion.galeria;
                rptGaleria.DataBind();
            }
            else
            {
                rptGaleria.Visible = false;
            }

            CargarNavegacion(
                subregiones,
                subregion.orden);
        }

        private void CargarNavegacion(
          List<SubregionModel> lista,
          int ordenActual)
        {
            lista = lista
                .OrderBy(x => x.orden)
                .ToList();

            int indice =
                lista.FindIndex(x => x.orden == ordenActual);

            if (indice < 0)
                return;

            int indiceAnterior =
                indice == 0
                ? lista.Count - 1
                : indice - 1;

            int indiceSiguiente =
                indice == lista.Count - 1
                ? 0
                : indice + 1;

            lnkAnterior.Text =
                "← " + lista[indiceAnterior].nombre;

            lnkAnterior.NavigateUrl =
                "~/Subregion.aspx?id=" +
                lista[indiceAnterior].slug;

            lnkAnterior.Visible = true;

            lnkSiguiente.Text =
                lista[indiceSiguiente].nombre + " →";

            lnkSiguiente.NavigateUrl =
                "~/Subregion.aspx?id=" +
                lista[indiceSiguiente].slug;

            lnkSiguiente.Visible = true;
        }

    }
}