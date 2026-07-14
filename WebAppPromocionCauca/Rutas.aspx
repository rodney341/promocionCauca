<%@ Page Title="Rutas Turísticas del Cauca" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rutas.aspx.cs" Inherits="WebAppPromocionCauca.Rutas" %>

<asp:Content ID="ContentRutas" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-5">
        <!-- Título Principal -->
        <div class="text-center mb-5">
            <h1 class="fw-bold" style="color: var(--verde-paramo);">Circuitos y Rutas de Exploración</h1>
            <p class="text-muted fs-5">Planifica tu viaje a través de los corredores turísticos diseñados para vivir el departamento al máximo.</p>
            <div style="width: 80px; height: 3px; background-color: var(--terracota); margin: 0.5rem auto 0;"></div>
        </div>

        <!-- SECCIÓN DE FILTROS (Manejada por Servidor para compatibilidad de paginación) -->
        <div class="row mb-5">
            <div class="col-12 text-center">
                <h5 class="text-muted mb-3 text-uppercase fw-bold small">Filtrar por Experiencia</h5>
                <div class="d-flex flex-wrap justify-content-center gap-2">
                    <asp:LinkButton ID="btnFiltroAll" runat="server" CssClass="btn btn-outline-secondary btn-sm px-3" OnClick="FiltrarCategoria_Click" CommandArgument="all">Todos</asp:LinkButton>
                    <asp:LinkButton ID="btnFiltroNaturaleza" runat="server" CssClass="btn btn-outline-secondary btn-sm px-3" OnClick="FiltrarCategoria_Click" CommandArgument="naturaleza">Naturaleza & Aventura</asp:LinkButton>
                    <asp:LinkButton ID="btnFiltroCultura" runat="server" CssClass="btn btn-outline-secondary btn-sm px-3" OnClick="FiltrarCategoria_Click" CommandArgument="cultura">Cultura & Historia</asp:LinkButton>
                    <asp:LinkButton ID="btnFiltroGastronomia" runat="server" CssClass="btn btn-outline-secondary btn-sm px-3" OnClick="FiltrarCategoria_Click" CommandArgument="gastronomia">Gastronomía</asp:LinkButton>
                    <asp:LinkButton ID="btnFiltroArqueologia" runat="server" CssClass="btn btn-outline-secondary btn-sm px-3" OnClick="FiltrarCategoria_Click" CommandArgument="arqueologia">Arqueología</asp:LinkButton>
                </div>
            </div>
        </div>

        <!-- Listado Dinámico con Repeater -->
        <div class="row g-4">
            <asp:Repeater ID="rptRutas" runat="server">
                <ItemTemplate>
                    <div class="col-12">
                        <div class="card border-0 shadow-sm overflow-hidden mb-4" style="background-color: #FFFFFF;">
                            <div class="row g-0">
                                <div class='<%# (Container.ItemIndex % 2 == 1) ? "col-md-4 order-md-last" : "col-md-4" %>' 
                                     style='background: url(<%# Eval("Imagen") %>) center/cover; min-height: 220px;'>
                                </div>
                                <div class="col-md-8 p-4 d-flex flex-column justify-content-center">
                                    <div class="d-flex justify-content-between align-items-start mb-1">
                                        <span class="text-uppercase fw-bold small" style="color: var(--terracota);"><%# Eval("Duracion") %></span>
                                    </div>
                                    <h3 class="fw-bold h4 mb-2" style="color: var(--verde-paramo);">
                                        <%# Eval("Nombre") %>
                                    </h3>
                                    <p class="text-muted small"><%# Eval("Descripcion") %></p>
                                    
                                    <div class="mt-2 d-flex flex-wrap justify-content-between align-items-center gap-3">
                                        <div>
                                            <asp:Repeater ID="rptTags" runat="server" DataSource='<%# Eval("Tags") %>'>
                                                <ItemTemplate>
                                                    <span class="badge bg-light text-dark border me-1"><%# Container.DataItem %></span>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <a href='Rutas_Detalle.aspx?id=<%# Eval("Id") %>' class="btn text-white btn-sm px-4 shadow-sm" style="background-color: var(--verde-paramo);">Ver Detalles y Mapa →</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="lblVacio" runat="server" Visible='<%# rptRutas.Items.Count == 0 %>' 
                               CssClass="text-center text-muted d-block py-5 fs-6" 
                               Text="No se encontraron circuitos turísticos en esta categoría." />
                </FooterTemplate>
            </asp:Repeater>
        </div>

        <!-- COMPONENTE DE PAGINACIÓN -->
        <div class="d-flex justify-content-center mt-5">
            <nav aria-label="Navegación de rutas">
                <asp:Repeater ID="rptPaginacion" runat="server" OnItemCommand="rptPaginacion_ItemCommand">
                    <HeaderTemplate><ul class="pagination pagination-sm gap-1"></HeaderTemplate>
                    <ItemTemplate>
                        <li class='<%# Convert.ToBoolean(Eval("Activa")) ? "page-item active" : "page-item" %>'>
                            <asp:LinkButton ID="btnPagina" runat="server" CssClass="page-link shadow-sm border-0" 
                                            CommandName="CambiarPagina" CommandArgument='<%# Eval("Indice") %>'
                                            style='<%# Convert.ToBoolean(Eval("Activa")) ? "background-color: var(--verde-paramo);" : "color: var(--verde-paramo);" %>'>
                                <%# Eval("Texto") %>
                            </asp:LinkButton>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate></ul></FooterTemplate>
                </asp:Repeater>
            </nav>
        </div>

        <!-- Botón de Retorno Centralizado -->
        <div class="text-center mt-4">
            <asp:HyperLink ID="lnkRegresarInicio" runat="server" NavigateUrl="~/Default.aspx" CssClass="btn btn-outline-secondary px-4 py-2 btn-sm">
                ← Regresar a la Portada Principal
            </asp:HyperLink>
        </div>
    </div>
</asp:Content>
