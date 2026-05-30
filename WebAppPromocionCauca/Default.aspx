<%@ Page Title="Turismo Cauca" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="WebAppPromocionCauca._Default" %>

<asp:Content ID="ContentStyles" ContentPlaceHolderID="Stylesheets" runat="server">

<style>

    :root{
        --verde-paramo:#2D5A27;
        --terracota:#C96B3B;
        --blanco-encalado:#F8F6F2;
    }

    html{
        scroll-behavior:smooth;
    }

    body{
        overflow-x:hidden;
    }
</style>
<link href="/estilos/StyleSheetHero.css" rel="stylesheet" />
<link href="/estilos/StyleSheetSubregiones.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="BodyContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <!-- HERO -->
    <section class="hero-slider">

        <div class="slide active"
            style="background-image: linear-gradient(
         135deg,
         rgba(0,0,0,0.55),
         rgba(16,74,44,0.45)),
         url('/images/Cerro_de_Manzanillo.jpg')">

            <div class="hero-content">

                <h1>Descubre la Magia del Cauca</h1>

                <p>
                    Cultura, naturaleza y tradición ancestral
                </p>

            </div>

        </div>

        <div class="slide"
            style="background-image: linear-gradient(
         135deg,
         rgba(0,0,0,0.55),
         rgba(16,74,44,0.45)),
         url('/images/purace.jpg')">

            <div class="hero-content">

                <h1>Volcán Puracé</h1>

                <p>
                    Naturaleza, termales y paisajes andinos
                </p>

            </div>

        </div>

        <div class="slide"
            style="background-image: linear-gradient(
         135deg,
         rgba(0,0,0,0.55),
         rgba(16,74,44,0.45)),
         url('/images/silvia.jpg')">

            <div class="hero-content">

                <h1>Silvia y Cultura Misak</h1>

                <p>
                    Tradición indígena y mercados ancestrales
                </p>

            </div>

        </div>


        <div class="estadisticas">

            <div class="stat">
                <h2>42</h2>
                <span>Municipios</span>
            </div>

            <div class="stat">
                <h2>150+</h2>
                <span>Destinos</span>
            </div>

            <div class="stat">
                <h2>25</h2>
                <span>Rutas</span>
            </div>

            <div class="stat">
                <h2>100%</h2>
                <span>Cultura</span>
            </div>

        </div>
        <div class="indicadores">

            <span class="dot active"></span>

            <span class="dot"></span>

            <span class="dot"></span>

        </div>

    </section>

    <section id="subregiones" class="container py-5">

    <div class="text-center mb-5">
        <h2 class="fw-bold" style="color:var(--verde-paramo);">
            Subregiones Turísticas del Cauca
        </h2>

        <p class="text-muted">
            Descubre la diversidad cultural, natural y patrimonial de cada territorio.
        </p>
    </div>

<div class="row g-4 justify-content-center">

        <asp:Repeater ID="rptSubregiones" runat="server">

            <ItemTemplate>

<div 
     class="col-xl-3 col-lg-3 col-md-4" >

                    <div class="card subregion-card h-100">

                        <img src='<%# Eval("Imagen") %>'
                             alt='<%# Eval("Nombre") %>'
                             class="card-img-top">

                        <div class="card-body">

                            <h4 class="card-title">
                                <%# Eval("Nombre") %>
                            </h4>

                            <p class="card-text">
                                <%# Eval("Descripcion") %>
                            </p>

                            <a href='<%# Eval("Url") %>'
                               class="btn btn-cauca-principal">
                                Explorar
                            </a>

                        </div>

                    </div>

                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

</section>

<script>
    document.addEventListener("DOMContentLoaded", function () {

        const slides = document.querySelectorAll(".slide");
        const dots = document.querySelectorAll(".dot");

        let actual = 0;

        function mostrarSlide(indice) {

            slides.forEach(slide =>
                slide.classList.remove("active")
            );

            dots.forEach(dot =>
                dot.classList.remove("active")
            );

            slides[indice].classList.add("active");
            dots[indice].classList.add("active");
        }

        setInterval(function () {

            actual++;

            if (actual >= slides.length) {
                actual = 0;
            }

            mostrarSlide(actual);

        }, 5000);

        dots.forEach((dot, indice) => {

            dot.addEventListener("click", function () {

                actual = indice;
                mostrarSlide(actual);

            });

        });

    });
</script>

</asp:Content>
