<%@ Page Title="Rutas Turísticas del Cauca" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rutas.aspx.cs" Inherits="WebAppPromocionCauca.Rutas" %>

<asp:Content ID="ContentRutas" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-5">
        <!-- Título Principal -->
        <div class="text-center mb-5">
            <h1 class="fw-bold" style="color: var(--verde-paramo);">Circuitos y Rutas de Exploración</h1>
            <p class="text-muted fs-5">Planifica tu viaje a través de los corredores turísticos diseñados para vivir el departamento al máximo.</p>
            <div style="width: 80px; height: 3px; background-color: var(--terracota); margin: 0.5rem auto 0;"></div>
        </div>

        <!-- Listado Dinámico con Repeater -->
        <div class="row g-4">
            <asp:Repeater ID="rptRutas" runat="server">
                <ItemTemplate>
                    <div class="col-12">
                        <div class="card border-0 shadow-sm overflow-hidden mb-4" style="background-color: #FFFFFF;">
                            <div class="row g-0">
                                <%-- Lógica para alternar el orden de la imagen (Izquierda/Derecha) según el índice --%>
                                <div class='<%# (Container.ItemIndex % 2 == 1) ? "col-md-4 order-md-last" : "col-md-4" %>' 
                                     style='background: url(<%# Eval("image") %>) center/cover; min-height: 220px;'>
                                </div>
                                
                                <div class="col-md-8 p-4 d-flex flex-column justify-content-center">
                                    <div class="d-flex justify-content-between align-items-start mb-1">
                                        <span class="text-uppercase fw-bold small" style="color: var(--terracota);"><%# Eval("duration") %></span>
                                    </div>
                                    <h3 class="fw-bold h4 mb-2" style="color: var(--verde-paramo);">
                                        <%# Container.ItemIndex + 1 %>. <%# Eval("name") %>
                                    </h3>
                                <p class="text-muted small"><%# Eval("shortDesc") %></p>

                                    
                                    <div class="mt-2 d-flex flex-wrap justify-content-between align-items-center gap-3">
                                        <%-- Renderizado dinámico de los Badges separados por comas --%>
                                        <div>
                                            <asp:Repeater ID="rptTags" runat="server" DataSource='<%# Eval("tags") %>'>
                                                <ItemTemplate>
                                                    <span class="badge bg-light text-dark border me-1"><%# Container.DataItem %></span>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <a href='Rutas_Detalle.aspx?id=<%# Eval("id") %>' class="btn text-white btn-sm px-4 shadow-sm" style="background-color: var(--verde-paramo);">Ver Detalles y Mapa →</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- Botón de Retorno Centralizado -->
        <div class="text-center mt-5">
            <asp:HyperLink ID="lnkRegresarInicio" runat="server" NavigateUrl="~/Default.aspx" CssClass="btn btn-outline-secondary px-4 py-2">
                ← Regresar a la Portada Principal
            </asp:HyperLink>
        </div>
    </div>
</asp:Content>
