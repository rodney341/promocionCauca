<%@ Page Title="Lectura de Artículo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Articulo.aspx.cs" Inherits="WebAppPromocionCauca.Articulo" %>

<%-- 1. CONTENEDOR DE ESTILOS (Apunta a la cabecera) --%>
<asp:Content ID="ContentStylesArticulo" ContentPlaceHolderID="Stylesheets" runat="server">
    <style>
.titulo-articulo {
    font-size: clamp(2.2rem, 4vw, 3.8rem);
    font-weight: 800;
    line-height: 1.15;
    color: #1f2937;
}

.meta-articulo {
    color: #6b7280;
    font-size: .95rem;
    border-bottom: 1px solid #e5e7eb;
    padding-bottom: 1rem;
}

.imagen-principal-articulo {
    width: 100%;
    height: 600px;
    object-fit: cover;
    border-radius: 24px;
    display: block;
}

.imagen-secundaria-articulo {
    width: 85%;
    max-width: 900px;
    height: 420px;
    object-fit: cover;
    border-radius: 20px;
    display: inline-block;
    box-shadow: 0 10px 30px rgba(0,0,0,.12);
}

.resumen-articulo {
    font-size: 1.3rem;
    line-height: 1.9;
    color: #374151;
    font-weight: 300;
    border-left: 5px solid #198754;
    padding-left: 1.5rem;
}

.contenido-blog {
    font-size: 1.12rem;
    line-height: 2;
    color: #374151;
}

.contenido-blog p {
    margin-bottom: 1.8rem;
}

.galeria-card {
    overflow: hidden;
    border-radius: 18px;
    box-shadow: 0 8px 20px rgba(0,0,0,.08);
    height: 280px;
}

.galeria-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform .4s ease;
}

.galeria-card:hover .galeria-img {
    transform: scale(1.08);
}
.btn-regresar { color: var(--terracota); text-decoration: none; font-weight: 600; display: inline-block; margin-bottom: 2rem; }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- VOLVER -->
    <div class="container my-5">
        <a href="Blog.aspx" class="btn btn-outline-secondary">
            ← Volver al Blog Turístico
        </a>
    </div>

    <!-- ARTÍCULO -->
    <div class="container">

        <div class="row justify-content-center">

            <div class="col-lg-9">

                <div class="mb-3">
                    <span class="badge bg-success">
                        <asp:Label ID="lblCategoria" runat="server" />
                    </span>
                </div>

                <h1 class="titulo-articulo mb-3">
                    <asp:Label ID="lblTitulo" runat="server" />
                </h1>

                <div class="meta-articulo mb-4">
                    <span>
                        Por <strong>
                            <asp:Label ID="lblAutor" runat="server" />
                        </strong>
                    </span>

                    <span class="mx-2">•</span>

                    <span>
                        <asp:Label ID="lblFecha" runat="server" />
                    </span>
                </div>

                <div class="mb-5">
                    <asp:Image ID="imgPrincipal"
                        runat="server"
                        CssClass="imagen-principal-articulo"
                        AlternateText="Imagen principal" />
                </div>

                <div class="resumen-articulo mb-5">
                    <asp:Label ID="lblResumen" runat="server" />
                </div>

                <div class="text-center mb-5">
                    <asp:Image ID="imgSecundaria"
                        runat="server"
                        CssClass="imagen-secundaria-articulo"
                        AlternateText="Imagen complementaria" />
                </div>

                <div class="contenido-blog">
                    <asp:Literal ID="litContenido" runat="server" />
                </div>

            </div>

        </div>

    </div>

    <!-- GALERÍA -->
<div id="pnlGaleria" runat="server" class="container py-5">

    <div class="text-center mb-4">
        <h2 class="fw-bold">Galería fotográfica</h2>
        <p class="text-muted">
            Imágenes que complementan esta experiencia en el Cauca.
        </p>
    </div>

    <div class="row g-4">

        <asp:Repeater ID="rptGaleria" runat="server">

            <ItemTemplate>

                <div class="col-lg-4 col-md-6">
                    <div class="galeria-card">
                        <img src='<%# Container.DataItem %>'
                             class="galeria-img"
                             loading="lazy"
                             alt="Galería del artículo" />
                    </div>
                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

</div>

</asp:Content>
