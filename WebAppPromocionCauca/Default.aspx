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

    /* =========================
       HERO SECTION
    ==========================*/

    .hero-section{
        position:relative;
        height:85vh;

        background:
        linear-gradient(
            135deg,
            rgba(0,0,0,0.55),
            rgba(16,74,44,0.45)
        ),
        url('../images/Cerro_de_Manzanillo.jpg')
        no-repeat center center/cover;

        background-attachment:fixed;

        display:flex;
        flex-direction:column;
        justify-content:center;
        align-items:center;

        text-align:center;
        color:#FFFFFF;

        margin-top:-20px;
        padding:0 2rem;
    }

    .hero-section::before{
        content:'';
        position:absolute;
        inset:0;
        background:rgba(0,0,0,0.15);
    }

    .hero-content{
        position:relative;
        z-index:2;
        animation:fadeHero 1.5s ease;
    }

    .hero-section h1{
        font-size:4rem;
        font-weight:800;
        text-shadow:2px 2px 8px rgba(0,0,0,0.5);
        margin-bottom:1rem;
    }

    .hero-section p{
        font-size:1.35rem;
        max-width:750px;
        margin:auto;
        margin-bottom:2rem;
        line-height:1.8;
    }

    @keyframes fadeHero{
        from{
            opacity:0;
            transform:translateY(30px);
        }

        to{
            opacity:1;
            transform:translateY(0);
        }
    }

    /* =========================
       BOTONES
    ==========================*/

    .btn-cauca-principal{

        background:linear-gradient(
            45deg,
            var(--verde-paramo),
            #4CAF50
        );

        border:none;
        color:white;

        padding:0.9rem 2rem;
        border-radius:50px;

        font-weight:600;

        transition:all .3s ease;

        box-shadow:0 6px 18px rgba(0,0,0,0.15);
    }

    .btn-cauca-principal:hover{

        transform:translateY(-3px);

        box-shadow:0 10px 24px rgba(0,0,0,0.25);

        color:white;
    }

    /* =========================
       ESTADÍSTICAS
    ==========================*/

    .estadisticas{
        background:#FFFFFF;
        padding:4rem 0;
    }

    .estadistica-box{
        text-align:center;
        padding:1rem;
    }

    .estadistica-box h2{
        font-size:3rem;
        color:var(--verde-paramo);
        font-weight:800;
    }

    .estadistica-box p{
        color:#666666;
        margin-top:0.5rem;
    }

    /* =========================
       SUBREGIONES
    ==========================*/

    .card-subregion{

        background:rgba(255,255,255,0.88);

        backdrop-filter:blur(10px);

        border:1px solid rgba(0,0,0,0.06);

        border-radius:18px;

        box-shadow:
        0 10px 30px rgba(0,0,0,0.06);

        cursor:pointer;

        transition:
        transform .35s ease,
        box-shadow .35s ease;

        height:100%;
    }

    .card-subregion:hover{

        transform:
        translateY(-8px)
        scale(1.02);

        box-shadow:
        0 18px 35px rgba(45,90,39,0.15);

        border-color:var(--verde-paramo);
    }

    .icon-subregion{
        font-size:2.6rem;
        transition:transform .3s ease;
    }

    .card-subregion:hover .icon-subregion{
        transform:scale(1.15);
    }

    /* =========================
       ANIMACIONES SCROLL
    ==========================*/

    .animar{
        opacity:0;
        transform:translateY(40px);
        transition:all .8s ease;
    }

    .animar.visible{
        opacity:1;
        transform:translateY(0);
    }

    /* =========================
       BLOQUES VERTICALES
    ==========================*/

    .bloque-subregion-seccion{
        padding:6rem 0;
        border-bottom:1px solid rgba(0,0,0,0.05);
        background:#FFFFFF;
    }

    .bloque-subregion-seccion:nth-child(even){
        background:var(--blanco-encalado);
    }

    .subregion-contenedor-flex{
        display:flex;
        align-items:center;
        gap:4rem;
    }

    .orden-invertido{
        flex-direction:row-reverse;
    }

    .subregion-col-texto{
        flex:0 0 50%;
    }

    .subregion-col-multimedia{
        flex:0 0 50%;
    }

    .subregion-titulo-h2{
        font-size:2.5rem;
        font-weight:800;
        color:var(--verde-paramo);
    }

    .subregion-linea-decorativa{
        width:70px;
        height:4px;
        background:var(--terracota);
        margin:1rem 0 1.5rem;
        border-radius:20px;
    }

    .subregion-parrafo-cronica{
        font-size:1.12rem;
        line-height:1.9;
        color:#555555;
        text-align:justify;
        margin-bottom:2rem;
    }

    .subregion-banner-foto{
        height:420px;
        border-radius:18px;

        background-size:cover;
        background-position:center;

        box-shadow:
        0 12px 35px rgba(0,0,0,0.08);

        transition:transform .4s ease;
    }

    .subregion-banner-foto:hover{
        transform:scale(1.02);
    }

    /* =========================
       SPINNER
    ==========================*/

    #spinner-subregiones{
        padding:5rem 0;
    }

    /* =========================
       RESPONSIVE
    ==========================*/

    @media(max-width:991px){

        .subregion-contenedor-flex{
            flex-direction:column !important;
            gap:2rem;
        }

        .subregion-col-texto,
        .subregion-col-multimedia{
            flex:0 0 100%;
            width:100%;
        }

        .subregion-banner-foto{
            height:280px;
        }

        .bloque-subregion-seccion{
            padding:4rem 0;
        }

    }

    @media(max-width:768px){

        .hero-section{
            height:70vh;
            background-attachment:scroll;
        }

        .hero-section h1{
            font-size:2.5rem;
        }

        .hero-section p{
            font-size:1rem;
        }

        .subregion-titulo-h2{
            font-size:2rem;
        }

    }

    .card-subregion{ position: relative; z-index: 10; }

.tarjeta-click{
    cursor:pointer;
    position:relative;
    z-index:20;
}



</style>

</asp:Content>

<asp:Content ID="BodyContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <!-- HERO -->
    <header class="hero-section">

        <div class="hero-content">

            <h1>Descubre la Magia del Cauca</h1>

            <p>
                Un territorio de contrastes donde la historia colonial,
                la biodiversidad andina y los saberes ancestrales
                construyen experiencias inolvidables.
            </p>

            <asp:Button
                ID="btnExplorar"
                runat="server"
                Text="Explorar Rutas"
                CssClass="btn btn-lg btn-cauca-principal"
                OnClick="btnExplorar_Click" />

        </div>

    </header>

    <!-- ESTADÍSTICAS -->
    <section class="estadisticas">

        <div class="container">

            <div class="row">

                <div class="col-md-3">
                    <div class="estadistica-box">
                        <h2>42</h2>
                        <p>Municipios Turísticos</p>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="estadistica-box">
                        <h2>7</h2>
                        <p>Subregiones</p>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="estadistica-box">
                        <h2>120+</h2>
                        <p>Experiencias</p>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="estadistica-box">
                        <h2>365</h2>
                        <p>Días de Aventura</p>
                    </div>
                </div>

            </div>

        </div>

    </section>

    <!-- SUBREGIONES -->
    <section class="container my-5">

        <div class="text-center mb-5">

            <h2
                style="
                color:var(--verde-paramo);
                font-weight:800;">

                Explora por Subregiones

            </h2>

            <p class="text-muted">
                Descubre las rutas culturales,
                gastronómicas y naturales del Cauca.
            </p>

            <div
                style="
                width:70px;
                height:4px;
                background:var(--terracota);
                margin:1rem auto;
                border-radius:20px;">
            </div>

        </div>

        <div class="row g-4 justify-content-center">

            <!-- CENTRO -->

<div class="col-6 col-md-4 col-lg-3">

    <div
        class="card card-subregion text-center p-4 animar tarjeta-click"
        data-subregion="Centro">

        <div class="icon-subregion">🏛️</div>

        <h5 class="fw-bold mt-3 mb-1">
            Centro
        </h5>

        <span class="text-muted small">
            Popayán, Silvia, Puracé
        </span>

    </div>

</div>



            <!-- NORTE -->
            <div class="col-6 col-md-4 col-lg-3">
                <div
        class="card card-subregion text-center p-4 animar tarjeta-click"
        data-subregion="Norte">

                    <div class="icon-subregion">🏭</div>

                    <h5 class="fw-bold mt-3 mb-1">
                        Norte
                    </h5>

                    <span class="text-muted small">
                        Quilichao, Caloto
                    </span>

                </div>
            </div>

            <!-- SUR -->
            <div class="col-6 col-md-4 col-lg-3">
                <div
        class="card card-subregion text-center p-4 animar tarjeta-click"
        data-subregion="Sur">

                    <div class="icon-subregion">🏔️</div>

                    <h5 class="fw-bold mt-3 mb-1">
                        Sur
                    </h5>

                    <span class="text-muted small">
                        Patía, Bolívar
                    </span>

                </div>
            </div>

            <!-- ORIENTE -->
            <div class="col-6 col-md-4 col-lg-3">
                <div
        class="card card-subregion text-center p-4 animar tarjeta-click"
        data-subregion="Oriente">

                    <div class="icon-subregion">🗿</div>

                    <h5 class="fw-bold mt-3 mb-1">
                        Oriente
                    </h5>

                    <span class="text-muted small">
                        Tierradentro, Inzá
                    </span>

                </div>
            </div>

            <!-- PACIFICO -->
            <div class="col-6 col-md-4 col-lg-3">
                <div
        class="card card-subregion text-center p-4 animar tarjeta-click"
        data-subregion="Pacifico">

                    <div class="icon-subregion">🌊</div>

                    <h5 class="fw-bold mt-3 mb-1">
                        Pacífico
                    </h5>

                    <span class="text-muted small">
                        Guapi y Timbiquí
                    </span>

                </div>
            </div>

            <!-- MACIZO -->
            <div class="col-6 col-md-4 col-lg-3">
                <div
        class="card card-subregion text-center p-4 animar tarjeta-click"
        data-subregion="Macizo">

                    <div class="icon-subregion">🦅</div>

                    <h5 class="fw-bold mt-3 mb-1">
                        Macizo
                    </h5>

                    <span class="text-muted small">
                        Reserva Hídrica
                    </span>

                </div>
            </div>

            <!-- BOTA -->
            <div class="col-6 col-md-4 col-lg-3">
                <div
        class="card card-subregion text-center p-4 animar tarjeta-click"
        data-subregion="Bota">

                    <div class="icon-subregion">🌳</div>

                    <h5 class="fw-bold mt-3 mb-1">
                        Bota Caucana
                    </h5>

                    <span class="text-muted small">
                        Transición Amazónica
                    </span>

                </div>
            </div>

        </div>

    </section>

    <!-- CONTENEDOR DINÁMICO -->
    <div id="contenedor-subregiones-verticales">

        <div
            class="text-center text-muted"
            id="spinner-subregiones">

            <div
                class="spinner-border text-success"
                role="status">
            </div>

            <p class="mt-3">
                Construyendo corredores turísticos...
            </p>

        </div>

    </div>

    <!-- JAVASCRIPT -->
<script>

    document.addEventListener("DOMContentLoaded", function () {

        const contenedorMaestro =
            document.getElementById(
                "contenedor-subregiones-verticales"
            );

        const spinner =
            document.getElementById(
                "spinner-subregiones"
            );

        /* =========================
           DATOS
        ==========================*/

        const descripcionesSubregiones = {

            "Centro":
                "El corazón histórico del departamento. Popayán y Puracé reúnen arquitectura colonial, gastronomía patrimonial y volcanes andinos.",

            "Norte":
                "Una región multicultural donde convergen tradiciones afrodescendientes y corredores agroindustriales.",

            "Sur":
                "Paisajes cafeteros y agrícolas acompañados por montañas y clima cálido.",

            "Oriente":
                "Territorio arqueológico y espiritual donde Tierradentro revela hipogeos ancestrales.",

            "Pacifico":
                "Selva húmeda tropical, marimbas ancestrales y conexión con Gorgona.",

            "Macizo":
                "La estrella hídrica de Colombia y santuario natural de páramos.",

            "Bota":
                "Transición amazónica con biodiversidad extrema y naturaleza virgen."

        };

        const imagenesSubregiones = {

            "Centro": "/images/Cerro_de_Manzanillo.jpg",
            "Norte": "/images/Cerro_de_Manzanillo.jpg",
            "Sur": "/images/Cerro_de_Manzanillo.jpg",
            "Oriente": "/images/Cerro_de_Manzanillo.jpg",
            "Pacifico": "/images/Cerro_de_Manzanillo.jpg",
            "Macizo": "/images/Cerro_de_Manzanillo.jpg",
            "Bota": "/images/Cerro_de_Manzanillo.jpg"

        };

        /* =========================
           CREAR BLOQUES
        ==========================*/

        Object.keys(descripcionesSubregiones)
            .forEach((subregion, index) => {

                const bloque = `

        <section
            id="subregion-${subregion}"
            class="bloque-subregion-seccion animar">

            <div class="container">

                <div class="
                    subregion-contenedor-flex
                    ${index % 2 !== 0
                        ? 'orden-invertido'
                        : ''}">

                    <div class="subregion-col-texto">

                        <h2 class="subregion-titulo-h2">
                            ${subregion}
                        </h2>

                        <div class="subregion-linea-decorativa"></div>

                        <p class="subregion-parrafo-cronica">
                            ${descripcionesSubregiones[subregion]}
                        </p>

                        <a
                            href="DetalleSubregion.aspx?region=${subregion}"
                            class="btn btn-cauca-principal">

                            Explorar Subregión

                        </a>

                    </div>

                    <div class="subregion-col-multimedia">

                        <div
                            class="subregion-banner-foto"

                            style="
                            background-image:
                            url('${imagenesSubregiones[subregion]}')">

                        </div>

                    </div>

                </div>

            </div>

        </section>

        `;

                contenedorMaestro.insertAdjacentHTML(
                    "beforeend",
                    bloque
                );

            });

        spinner.style.display = "none";

        /* =========================
           ANIMACIONES
        ==========================*/

        const elementos =
            document.querySelectorAll(".animar");

        const observer =
            new IntersectionObserver(entries => {

                entries.forEach(entry => {

                    if (entry.isIntersecting) {

                        entry.target.classList.add(
                            "visible"
                        );

                    }

                });

            });

        elementos.forEach(el => {
            observer.observe(el);
        });

        /* =========================
           CLICK TARJETAS
        ==========================*/

        document.addEventListener("click", function (e) {

            const tarjeta =
                e.target.closest(".tarjeta-click");

            if (!tarjeta) return;

            const subregion =
                tarjeta.dataset.subregion;

            const destino =
                document.getElementById(
                    `subregion-${subregion}`
                );

            if (destino) {

                destino.scrollIntoView({
                    behavior: "smooth",
                    block: "start"
                });

            }

        });

    });

</script>

</asp:Content>
