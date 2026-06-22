<%@ Page Title="Rutas Turísticas del Cauca" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rutas.aspx.cs" Inherits="WebAppPromocionCauca.Rutas" %>

<asp:Content ID="ContentRutas" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-5">
        <!-- Título Principal -->
        <div class="text-center mb-5">
            <h1 class="fw-bold" style="color: var(--verde-paramo);">Circuitos y Rutas de Exploración</h1>
            <p class="text-muted fs-5">Planifica tu viaje a través de los corredores turísticos diseñados para vivir el departamento al máximo.</p>
            <div style="width: 80px; height: 3px; background-color: var(--terracota); margin: 0.5rem auto 0;"></div>
        </div>

        <!-- Listado de Circuitos (Diseño Alternado) -->
        <div class="row g-4">
            
            <!-- Ruta 1: Circuito Patrimonial y Gastronómico -->
            <div class="col-12">
                <div class="card border-0 shadow-sm overflow-hidden mb-4" style="background-color: #FFFFFF;">
                    <div class="row g-0">
                        <div class="col-md-4" style="background: url('images/rutas/Patrimonio-MiguelVarona.webp') center/cover; min-height: 200px;"></div>
                        <div class="col-md-8 p-4 d-flex flex-column justify-content-center">
                            <span class="text-uppercase fw-bold text-cauca-terracota small mb-1">Duración: 2 Días / 1 Noche</span>
                            <h3 class="fw-bold" style="color: var(--verde-paramo);">1. Ruta de la "Ciudad Blanca" y los Saberes Gastronómicos</h3>
                            <p class="text-muted">Un recorrido urbano y cultural por el Centro Histórico de Popayán. Incluye catas de café de alta montaña del Cauca, talleres de cocina tradicional (pipián y carantanta) y recorridos guiados nocturnos por las iglesias coloniales.</p>
                            <div class="mt-2">
                                <span class="badge bg-light text-dark border me-1">Popayán</span>
                                <span class="badge bg-light text-dark border me-1">Gastronomía</span>
                                <span class="badge bg-light text-dark border">Cultura</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Ruta 2: Ruta del Fuego y el Agua -->
            <div class="col-12">
                <div class="card border-0 shadow-sm overflow-hidden mb-4" style="background-color: #FFFFFF;">
                    <div class="row g-0">
                        <div class="col-md-4 order-md-last" style="background: url('images/rutas/guardianes_de_puracé_AR.webp') center/cover; min-height: 200px;"></div>
                        <div class="col-md-8 p-4 d-flex flex-column justify-content-center">
                            <span class="text-uppercase fw-bold text-cauca-terracota small mb-1">Duración: 3 Días / 2 Noches</span>
                            <h3 class="fw-bold" style="color: var(--verde-paramo);">2. Travesía del Cóndor: El Sendero Volcánico</h3>
                            <p class="text-muted">Un circuito de naturaleza exigente que inicia en Popayán, asciende al municipio de Puracé, visita la cascada del Bedón, los Termales de San Juan y finaliza con el avistamiento del Cóndor de los Andes y senderismo guiado en el Parque Natural.</p>
                            <div class="mt-2">
                                <span class="badge bg-light text-dark border me-1">Ecoturismo</span>
                                <span class="badge bg-light text-dark border me-1">PNN Puracé</span>
                                <span class="badge bg-light text-dark border">Termales</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Ruta 3: Ruta Étnica y Arqueológica -->
            <div class="col-12">
                <div class="card border-0 shadow-sm overflow-hidden mb-4" style="background-color: #FFFFFF;">
                    <div class="row g-0">
                        <div class="col-md-4" style="background: url('images/rutas/tierradentro-FotoMiguelVarona-3.webp') center/cover; min-height: 200px;"></div>
                        <div class="col-md-8 p-4 d-flex flex-column justify-content-center">
                            <span class="text-uppercase fw-bold text-cauca-terracota small mb-1">Duración: 4 Días / 3 Noches</span>
                            <h3 class="fw-bold" style="color: var(--verde-paramo);">3. Circuito Intercultural de los Andes y Tierradentro</h3>
                            <p class="text-muted">Conecta el colorido mercado indígena de Silvia de los días martes (comunidad Misak) con el misticismo arqueológico del Oriente caucano en Inzá. Diseñado para explorar los hipogeos prehispánicos tallados bajo tierra.</p>
                            <div class="mt-2">
                                <span class="badge bg-light text-dark border me-1">Silvia</span>
                                <span class="badge bg-light text-dark border me-1">Tierradentro</span>
                                <span class="badge bg-light text-dark border">Etnoturismo</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Botón de Retorno Centralizado -->
        <div class="text-center mt-5">
            <asp:HyperLink ID="lnkRegresarInicio" runat="server" NavigateUrl="~/Default.aspx" CssClass="btn btn-outline-secondary px-4 py-2">
                ← Regresar a la Portada Principal
            </asp:HyperLink>
        </div>
    </div>
</asp:Content>
