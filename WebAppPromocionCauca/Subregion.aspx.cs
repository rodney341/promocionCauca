using System;
using System.Collections.Generic;
using System.Linq;
using WebAppPromocionCauca.Interfaces;
using WebAppPromocionCauca.Models;
using WebAppPromocionCauca.Repositories;

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

            litNombre.Text = subregion.nombre;
            litNombreVertical.Text = subregion.nombre;
            divTituloVertical.Style["background-color"] = subregion.colorTema;
            string contenido =subregion.contenido;

            string[] parrafos =
                    contenido.Split(
                        new[] { "\r\n\r\n", "\n\n" },
                        StringSplitOptions.RemoveEmptyEntries);

            litContenido.Text =
                    string.Join("",
                    parrafos.Select(p =>
                    $"<p>{Server.HtmlEncode(p.Trim())}</p>"));

            imgPrincipal.ImageUrl = ResolveUrl(subregion.imagenPrincipal);
            imgSecundaria.ImageUrl = ResolveUrl(subregion.imagenSecundaria);
            pnlBadgeUnesco.Visible = !string.IsNullOrWhiteSpace(subregion.reconocimientoUnesco);
            if (subregion.destacados?.Any() == true)
            {
                rptDestacados.DataSource = subregion.destacados;
                rptDestacados.DataBind();
            }
            else
            {
                rptDestacados.Visible = false;
            }
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