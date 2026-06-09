<%@ Page Title="Lectura de Artículo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Articulo.aspx.cs" Inherits="WebAppPromocionCauca.Articulo" %>

<%-- 1. CONTENEDOR DE ESTILOS (Apunta a la cabecera) --%>
<asp:Content ID="ContentStylesArticulo" ContentPlaceHolderID="Stylesheets" runat="server">
    <style>
        .hero-articulo{
    position:relative;
    height:60vh;
    background-size:cover;
    background-position:center;
    display:flex;
    align-items:center;
}

.hero-articulo .overlay{
    position:absolute;
    inset:0;
    background:rgba(0,0,0,.45);
}

.hero-contenido{
    position:relative;
    z-index:2;
    color:white;
    max-width:800px;
    margin:auto;
    padding:0 20px;
}

.hero-contenido h1{
    font-size:clamp(2rem,5vw,4rem);
    font-weight:800;
}

.contenido-blog{
    font-size:1.1rem;
    line-height:1.9;
}

.contenido-blog p{
    margin-bottom:1.5rem;
}
.imagen-articulo{
    width:100%;
    max-height:500px;
    object-fit:cover;
    border-radius:20px;
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
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- HERO -->
    <section id="heroArticulo" runat="server" class="hero-articulo">
        <div class="overlay"></div>

        <div class="hero-contenido">

            <span class="badge bg-success mb-3">
                <asp:Label ID="lblCategoria" runat="server" />
            </span>

            <h1>
                <asp:Label ID="lblTitulo" runat="server" />
            </h1>

            <p class="meta-articulo">
                Por
                <strong>
                    <asp:Label ID="lblAutor" runat="server" />
                </strong>
                ·
                <asp:Label ID="lblFecha" runat="server" />
            </p>

        </div>
    </section>

    <!-- CONTENIDO -->
    <div class="container py-5">

        <div class="row justify-content-center">

            <div class="col-lg-8">

                <p class="lead mb-4">
                    <asp:Label ID="lblResumen" runat="server" />
                </p>
                        <div class="text-center mb-5">
                            <asp:Image ID="imgSecundaria"
                                runat="server"
                                CssClass="img-fluid rounded shadow-sm imagen-articulo"
                                AlternateText="Imagen del artículo" />
                        </div>
                <div class="contenido-blog">
                    <asp:Literal ID="litContenido" runat="server" />
                </div>

            </div>

        </div>

        <!-- GALERÍA -->
        <div class="text-center mb-4 mt-5">
            <h2 class="fw-bold">Galería fotográfica</h2>
            <p class="text-muted">
                Imágenes que complementan esta experiencia en el Cauca.
            </p>
        </div>
        <div class="row g-4 mt-5">

            <asp:Repeater ID="rptGaleria" runat="server">

                <ItemTemplate>

                    <div class="col-lg-4 col-md-6 col-12">

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
