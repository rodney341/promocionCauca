<%@ Page Title="Subregión"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Subregion.aspx.cs"
    Inherits="WebAppPromocionCauca.Subregion" %>

<asp:Content ID="ContentStylesSubregion" ContentPlaceHolderID="Stylesheets" runat="server">
    <style>
/* =========================
   HERO SUBREGIÓN
========================= */

        .subregion-hero {
            height: 50vh;
            background-size: cover;
            background-position: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: #FFFFFF;
            position: relative;
            margin-top: -20px;
        }
        .subregion-hero::before {
            content: ''; position: absolute; top: 0; left: 0; width: 100%; height: 100%;
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.7)); z-index: 1;
        }
        .subregion-hero-contenido {
            position: relative; z-index: 2; max-width: 750px; padding: 0 1.5rem;
        }

.subregion-hero h1{
    text-shadow:
        0 4px 15px
        rgba(0,0,0,.4);
}

.subregion-hero p{
    max-width:700px;
}

@media (max-width:768px){

    .subregion-hero{
        min-height:55vh;
    }

    .subregion-hero-contenido{
        padding:100px 30px 80px;
        text-align:center;
    }

    .subregion-hero p{
        margin:auto;
    }
}

/* =========================
   GALERÍA
========================= */

.galeria-img{
    width:100%;
    height:280px;

    object-fit:cover;

    border-radius:20px;

    cursor:pointer;

    transition:.4s;
}

.galeria-img:hover{
    transform:scale(1.04);
}

/* =========================
   LIGHTBOX
========================= */

.lightbox{
    display:none;

    position:fixed;
    inset:0;

    background:
        rgba(0,0,0,.92);

    z-index:9999;
}

.lightbox img{
    position:absolute;

    top:50%;
    left:50%;

    transform:
        translate(-50%,-50%);

    max-width:90%;
    max-height:90%;
}

.cerrar{
    position:absolute;

    top:20px;
    right:30px;

    color:white;

    font-size:45px;

    cursor:pointer;
}
    </style>
</asp:Content>


<asp:Content ID="Content1"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <!-- HERO -->
    <div runat="server"
         id="subHeroBg"
         class="subregion-hero shadow-sm">

        <div class="subregion-hero-contenido">

            <span class="badge bg-warning text-dark mb-3 px-3 py-2 text-uppercase fw-bold">
                Corredor Territorial
            </span>

            <h1 class="display-4 fw-bold text-white mb-3">

                <asp:Label ID="lblNombre"
                    runat="server" />

            </h1>

            <p class="fs-5 text-white opacity-75 m-0">

                <asp:Label ID="lblDescripcion"
                    runat="server" />

            </p>

        </div>

    </div>

    <!-- CONTENIDO -->
    <section class="container py-5">

        <asp:Literal
            ID="litContenido"
            runat="server" />

    </section>

    <!-- GALERÍA -->
    <section class="container pb-5">

        <div class="text-center mb-5">

            <h2 class="fw-bold"
                style="color:var(--verde-paramo);">

                Galería Fotográfica

            </h2>

            <div style="
                width:80px;
                height:4px;
                background:var(--terracota);
                margin:auto;">
            </div>

        </div>

        <div class="row g-4">

            <asp:Repeater
                ID="rptGaleria"
                runat="server">

                <ItemTemplate>

                    <div class="col-lg-4 col-md-6">

                        <img src='<%# Container.DataItem %>'
                             class="galeria-img img-fluid shadow-sm"
                             alt="Imagen de la subregión" />

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>

    </section>

    <!-- VOLVER -->
    <div class="container text-center pb-5">

        <a href="/Default.aspx#subregiones"
           class="btn btn-outline-secondary">

            ← Volver a Subregiones

        </a>

    </div>

    <!-- LIGHTBOX -->
    <div id="lightbox" class="lightbox">

        <span class="cerrar">&times;</span>

        <img id="lightbox-img" />

    </div>
    <script>

        document.addEventListener("DOMContentLoaded", function () {

            const imagenes =
                document.querySelectorAll(".galeria-img");

            const lightbox =
                document.getElementById("lightbox");

            const imagenGrande =
                document.getElementById("lightbox-img");

            imagenes.forEach(function (img) {

                img.addEventListener("click", function () {

                    lightbox.style.display = "block";

                    imagenGrande.src = this.src;

                });

            });

            document.querySelector(".cerrar")
                .addEventListener("click", function () {

                    lightbox.style.display = "none";

                });

        });

</script>
</asp:Content>