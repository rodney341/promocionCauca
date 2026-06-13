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
<link href="/estilos/StyleSheetReconocimientos.css" rel="stylesheet" />
<link href="/estilos/StyleSheetMapa.css" rel="stylesheet" />
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


<section class="tipos-reconocimiento py-5">
    <div class="container">

        <!-- Cabecera Animada -->
        <div class="text-center mb-5 animar-entrada">
            <h2 class="titulo-reconocimientos">El Cauca ante el mundo</h2>
            <p class="descripcion-reconocimientos">
                Organismos internacionales han reconocido el patrimonio
                cultural, arqueológico, gastronómico y natural del departamento.
            </p>
        </div>

        <div class="row g-4">
            <!-- Tarjeta 1 -->
            <div class="col-lg-6 animar-entrada">
                <div class="tipo-card border-mundial">
                    <div class="tipo-icono icono-mundial">🏛️</div>
                    <h3>Patrimonio Mundial UNESCO</h3>
                    <ul>
                        <li>Parque Arqueológico Nacional de Tierradentro</li>
                    </ul>
                </div>
            </div>

            <!-- Tarjeta 2 -->
            <div class="col-lg-6 animar-entrada">
                <div class="tipo-card border-inmaterial">
                    <div class="tipo-icono icono-inmaterial">✨</div>
                    <h3>Patrimonio Cultural Inmaterial</h3>
                    <ul>
                        <li>Procesiones de Semana Santa de Popayán</li>
                        <li>Música de Marimba y Cantos Tradicionales del Pacífico Sur</li>
                    </ul>
                </div>
            </div>

            <!-- Tarjeta 3 -->
            <div class="col-lg-6 animar-entrada">
                <div class="tipo-card destacado border-creativa">
                    <div class="tipo-icono icono-creativa">🍽️</div>
                    <h3>Red de Ciudades Creativas UNESCO</h3>
                    <ul>
                        <li>Popayán - Ciudad Creativa de la Gastronomía</li>
                    </ul>
                </div>
            </div>

            <!-- Tarjeta 4 -->
            <div class="col-lg-6 animar-entrada">
                <div class="tipo-card border-biosfera">
                    <div class="tipo-icono icono-biosfera">🌿</div>
                    <h3>Reservas de la Biosfera UNESCO</h3>
                    <ul>
                        <li>Macizo Colombiano - Cinturón Andino</li>
                    </ul>
                </div>
            </div>

            <!-- Tarjeta 5 (Ancho completo) -->
            <div class="col-lg-12 animar-entrada">
                <div class="tipo-card horizontal border-agua">
                    <div class="tipo-icono icono-agua">💧</div>
                    <div class="flex-grow-1">
                        <h3>Red Global de Museos del Agua</h3>
                        <ul>
                            <li>Museo Vivo del Agua y la Biodiversidad en el Macizo Colombiano</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>


<section class="mapa-reconocimientos-section py-5">
    <div class="container">

        <div class="text-center mb-5 animar-entrada">
            <h2 class="titulo-reconocimientos">El Cauca en el Mapa</h2>
            <p class="descripcion-reconocimientos">
                Explora los epicentros geográficos y culturales que albergan las máximas distinciones internacionales del departamento.
            </p>
        </div>

        <div class="row g-4 align-items-stretch">
            
            <!-- Lista de Puntos de Interés -->
            <div class="col-lg-5 animar-entrada">
                <div class="d-flex flex-column gap-3 h-100 justify-content-center">
                    
                    <div class="punto-mapa-item active" data-lat="" data-lng="">
                        <div class="punto-icon icono-creativa">🍽️</div>
                        <div>
                            <h4>Popayán</h4>
                            <p class="mb-0 text-muted">Ciudad Creativa de la Gastronomía y sede de las Procesiones de Semana Santa.</p>
                        </div>
                    </div>

                    <div class="punto-mapa-item" data-lat="" data-lng="">
                        <div class="punto-icon icono-mundial">🏛️</div>
                        <div>
                            <h4>Tierradentro (Inzá)</h4>
                            <p class="mb-0 text-muted">Parque Arqueológico Nacional y Patrimonio Mundial material de la UNESCO.</p>
                        </div>
                    </div>

                    <div class="punto-mapa-item" data-lat="" data-lng="">
                        <div class="punto-icon icono-biosfera">🌿</div>
                        <div>
                            <h4>Macizo Colombiano</h4>
                            <p class="mb-0 text-muted">Reserva de la Biósfera y hogar del Museo Vivo del Agua y la Biodiversidad.</p>
                        </div>
                    </div>

                    <div class="punto-mapa-item" data-lat="" data-lng="">
                        <div class="punto-icon icono-inmaterial">🌊</div>
                        <div>
                            <h4>Costa Pacífica Caucana (Guapi)</h4>
                            <p class="mb-0 text-muted">Epicentro cultural de las Músicas de Marimba y Cantos Tradicionales.</p>
                        </div>
                    </div>

                </div>
            </div>

            <!-- Contenedor del Mapa Interactivo -->
            <div class="col-lg-7 animar-entrada">
                <div class="mapa-wrapper">
                    <div id="mapa-interactivo" class="mapa-placeholder">
                        <!-- Aquí se renderiza el mapa interactivo -->
                    </div>
                </div>
            </div>

        </div>

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


        const elementos = document.querySelectorAll(".animar-entrada");

        const opciones = {
            root: null, // Usa el viewport del navegador
            rootMargin: "0px",
            threshold: 0.15 // Se activa cuando el 15% del elemento es visible
        };

        const observador = new IntersectionObserver((entradas, observador) => {
            entradas.forEach((entrada, indice) => {
                if (entrada.isIntersecting) {
                    // Añadimos un pequeño retraso secuencial (efecto cascada) si aparecen varios a la vez
                    setTimeout(() => {
                        entrada.target.classList.add("visible");
                    }, indice * 80);

                    // Dejamos de observar el elemento una vez animado
                    observador.unobserve(entrada.target);
                }
            });
        }, opciones);

        elementos.forEach(elemento => observador.observe(elemento));

    });
</script>

</asp:Content>
