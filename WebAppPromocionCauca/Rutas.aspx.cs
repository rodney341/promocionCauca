using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using WebAppPromocionCauca.Models;
using WebAppPromocionCauca.Repositories;

namespace WebAppPromocionCauca
{
    public partial class Rutas : System.Web.UI.Page
    {
        private readonly RutasLocalRepository _repository = new RutasLocalRepository();
        private const int ELEMENTOS_POR_PAGINA = 2; // ◄ Ajuste para ver el corte de páginas

        // Propiedades de estado vinculadas a ViewState
        private string CategoriaActiva
        {
            get { return ViewState["CategoriaActiva"] != null ? ViewState["CategoriaActiva"].ToString() : "all"; }
            set { ViewState["CategoriaActiva"] = value; }
        }

        private int PaginaActual
        {
            get { return ViewState["PaginaActual"] != null ? Convert.ToInt32(ViewState["PaginaActual"]) : 1; }
            set { ViewState["PaginaActual"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ActualizarCatalogo();
            }
        }

        private void ActualizarCatalogo()
        {
            // 1. Obtener datos crudos del repositorio unificado
            var todasLasRutas = _repository.ObtenerTodas();

            // 2. Aplicar Filtro lógico por categoría
            var rutasFiltradas = CategoriaActiva == "all"
                ? todasLasRutas
                : todasLasRutas.Where(r => r.categoria.Contains(CategoriaActiva)).ToList();

            // 3. Calcular métricas de paginación
            int totalElementos = rutasFiltradas.Count;
            int totalPaginas = (int)Math.Ceiling((double)totalElementos / ELEMENTOS_POR_PAGINA);

            // Evitar desborde si el filtro reduce drásticamente las páginas
            if (PaginaActual > totalPaginas && totalPaginas > 0) PaginaActual = totalPaginas;
            if (PaginaActual < 1) PaginaActual = 1;

            // 4. Segmentar la lista usando LINQ (Skip y Take)
            var rutasSegmentadas = rutasFiltradas
                .Skip((PaginaActual - 1) * ELEMENTOS_POR_PAGINA)
                .Take(ELEMENTOS_POR_PAGINA)
                .ToList();

            // 5. Enlazar datos al listado
            rptRutas.DataSource = rutasSegmentadas;
            rptRutas.DataBind();

            // 6. Construir botones numéricos de paginación
            ConstruirPaginador(totalPaginas);
            ResaltarBotonFiltro();
        }

        private void ConstruirPaginador(int totalPaginas)
        {
            var paginas = new List<object>();
            for (int i = 1; i <= totalPaginas; i++)
            {
                paginas.Add(new { Texto = i.ToString(), Indice = i, Activa = (i == PaginaActual) });
            }

            rptPaginacion.DataSource = paginas;
            rptPaginacion.DataBind();
        }

        protected void FiltrarCategoria_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            CategoriaActiva = btn.CommandArgument;
            PaginaActual = 1; // Reiniciar siempre a la primera página al filtrar
            ActualizarCatalogo();
        }

        protected void rptPaginacion_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "CambiarPagina")
            {
                PaginaActual = Convert.ToInt32(e.CommandArgument);
                ActualizarCatalogo();
            }
        }

        private void ResaltarBotonFiltro()
        {
            // Limpiar clases activas en los botones de filtro
            btnFiltroAll.CssClass = "btn btn-outline-secondary btn-sm px-3";
            btnFiltroNaturaleza.CssClass = "btn btn-outline-secondary btn-sm px-3";
            btnFiltroCultura.CssClass = "btn btn-outline-secondary btn-sm px-3";
            btnFiltroGastronomia.CssClass = "btn btn-outline-secondary btn-sm px-3";
            btnFiltroArqueologia.CssClass = "btn btn-outline-secondary btn-sm px-3";

            // Inyectar clase de Bootstrap activa al botón seleccionado actual
            switch (CategoriaActiva)
            {
                case "all": btnFiltroAll.CssClass += " active bg-secondary text-white"; break;
                case "naturaleza": btnFiltroNaturaleza.CssClass += " active bg-secondary text-white"; break;
                case "cultura": btnFiltroCultura.CssClass += " active bg-secondary text-white"; break;
                case "gastronomia": btnFiltroGastronomia.CssClass += " active bg-secondary text-white"; break;
                case "arqueologia": btnFiltroArqueologia.CssClass += " active bg-secondary text-white"; break;
            }
        }
    }
}
