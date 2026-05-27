<%@ Page Title="Popayán Colonial" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Popayan.aspx.cs" Inherits="WebAppPromocionCauca.Destinos.Popayan" %>

<asp:Content ID="ContentPopayan" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-5">
        <!-- Encabezado con Imagen Inmersiva -->
        <div class="p-5 text-white rounded-3 shadow-sm" style="background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://unsplash.com') center/cover; min-height: 350px; display: flex; flex-direction: column; justify-content: flex-end;">
            <span class="badge bg-warning text-dark mb-2 px-3 py-2 align-self-start fw-bold text-uppercase">Patrimonio Cultural</span>
            <h1 class="display-4 fw-bold">Popayán, la Ciudad Blanca</h1>
            <p class="fs-5 max-width-600">Un epicentro de historia colonial, templos imponentes y gastronomía única en el mundo.</p>
        </div>

        <!-- Bloque de Información de Alta Resolución -->
        <div class="row mt-5 g-4">
            <div class="col-lg-8">
                <h3 class="fw-bold mb-3" style="color: var(--verde-paramo);">Legado Histórico y Saberes</h3>
                <p class="fs-5 text-secondary" style="line-height: 1.8;">
                    Fundada en 1537, Popayán conserva uno de los centros históricos coloniales más grandes e íntegros de América Latina. Sus fachadas encaladas guardan museos, plazoletas empedradas y joyas arquitectónicas como la <strong>Torre del Reloj</strong> y el <strong>Puente del Humilladero</strong>.
                </p>
                <div class="card border-0 p-4 shadow-sm my-4" style="background-color: #FFFFFF; border-left: 4px solid var(--terracota) !important;">
                    <h5 class="fw-bold" style="color: var(--terracota);">✨ Ciudad de la Gastronomía UNESCO</h5>
                    <p class="mb-0 text-muted">Es el primer sitio de Latinoamérica en recibir este título. Deleita tu paladar con el icónico plato de empanadas de pipián, las carantantas, el salpicón de Payán y los tradicionales aplanchados.</p>
                </div>
            </div>
            
            <div class="col-lg-4">
                <div class="card p-4 border-0 shadow-sm" style="background-color: #FFFFFF;">
                    <h5 class="fw-bold mb-3" style="color: var(--verde-paramo);">Ficha del Destino</h5>
                    <ul class="list-unstyled lh-lg">
                        <li>☀️ <strong>Clima:</strong> Templado (18°C a 22°C)</li>
                        <li>👟 <strong>Ropa:</strong> Cómoda para caminar, abrigo ligero</li>
                        <li>📅 <strong>Temporada Clave:</strong> Semana Santa y Congreso Gastronómico</li>
                    </ul>
                    <hr />
                    <asp:HyperLink ID="lnkVolver1" runat="server" NavigateUrl="~/Default.aspx" CssClass="btn btn-outline-secondary w-100">← Volver al Inicio</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
