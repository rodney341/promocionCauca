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
         url('/images/Macizo-AdrianaCollazos.jpg')">

            <div class="hero-content">

                <h1>Descubre el Cauca</h1>

                <p>
                    Un destino diverso y sostenible
                </p>

            </div>

        </div>

        <div class="slide"
            style="background-image: linear-gradient(
         135deg,
         rgba(0,0,0,0.55),
         rgba(16,74,44,0.45)),
         url('/images/EL_ORIGEN_PERVIVENCIA_NASA.jpg')">

            <div class="hero-content">

                <h1>Un refugio de paz </h1>

                <p>
                    Crece entre montañas majestuosas y ríos de vida
                </p>

            </div>

        </div>

        <div class="slide"
            style="background-image: linear-gradient(
         135deg,
         rgba(0,0,0,0.55),
         rgba(16,74,44,0.45)),
         url('/images/Colibri-AdrianaCollazos.jpg')">

            <div class="hero-content">

                <h1>Donde las aves cantan  </h1>

                <p>
                    Se pinta el cielo de colores y florece la paz
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

                <div class="col-xl-3 col-lg-3 col-md-4" >

                    <div class="card subregion-card h-100">
                        <a href='/Subregion.aspx?id=<%# Eval("slug") %>'>
                        <img src='<%# Eval("imagenPrincipal") %>'
                             alt='<%# Eval("nombre") %>'
                             class="card-img-top" />
                               </a>
                        <div class="card-body">

                            <h4 class="card-title">
                            <a href='/Subregion.aspx?id=<%# Eval("slug") %>'
                               class="titulo-subregion">
                                <%# Eval("nombre") %>
                             </a>
                            </h4>

                            <p class="card-text">
                                <%# Eval("descripcion") %>
                            </p>

                            <a href='/Subregion.aspx?id=<%# Eval("slug") %>'
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
