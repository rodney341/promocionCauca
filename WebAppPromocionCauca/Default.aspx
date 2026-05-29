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

   width:calc(100vw - 40px);

    min-height:100vh;

    background:
    linear-gradient(
        135deg,
        rgba(0,0,0,0.55),
        rgba(16,74,44,0.45)
    ),
    url('/images/Cerro_de_Manzanillo.jpg')
    no-repeat center center/cover;

    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;

    text-align:center;
    color:#FFFFFF;

    margin:20px auto;

    padding:0 2rem;

    overflow:hidden;

    box-shadow:0 10px 30px rgba(0,0,0,.25);
    margin-bottom:5rem;
}
@media(max-width:768px){

    .hero-section{
        background-attachment:scroll;
        height:70vh;
        border-radius:20px;
    }

}

    .hero-section::before{
        content:'';
        position:absolute;
        inset:0;
        background:rgba(0,0,0,0.15);
    }

.hero-content{

    z-index:2;

    max-width:800px;
}

.hero-content h1{

    font-size:4rem;

    font-weight:bold;

    margin-bottom:20px;
}

.hero-content p{

    font-size:1.4rem;
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
    .hero-slider{

    position:relative;

    height:85vh;

    margin:20px;

    border-radius:35px;

    overflow:hidden;

    box-shadow:0 10px 30px rgba(0,0,0,.25);
}
    .slide{

    position:absolute;

    inset:0;

    background-size:cover;

    background-position:center;

    opacity:0;

    transition:opacity 1s ease-in-out;

    display:flex;

    justify-content:center;

    align-items:center;

    text-align:center;

    padding:2rem;

    color:white;
}
    .slide.active{
    opacity:1;
    z-index:1;
}


.indicadores{

    position:absolute;

    bottom:25px;

    left:50%;

    transform:translateX(-50%);

    display:flex;

    gap:12px;

    z-index:10;
}
.dot{

    width:14px;

    height:14px;

    border-radius:50%;

    background:rgba(255,255,255,.45);

    cursor:pointer;

    transition:.3s;
}

.dot.active{

    background:white;

    transform:scale(1.2);
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

    position:absolute;

    bottom:60px;

    left:50%;

    transform:translateX(-50%);

    width:90%;

    display:flex;

    justify-content:space-around;

    gap:20px;

    padding:20px;

    background:rgba(255,255,255,.12);

    backdrop-filter:blur(10px);

    border-radius:25px;

    z-index:5;
}

.stat{
    flex:1;
}

.stat h2{

    font-size:2rem;

    font-weight:bold;
}

.stat span{

    font-size:1rem;

    opacity:.9;
}

@media(max-width:768px){

    .hero-content h1{
        font-size:2.5rem;
    }

    .estadisticas{

        position:relative;

        bottom:auto;
        left:auto;

        transform:none;

        width:100%;

        margin-top:2rem;

        padding:1rem;

        flex-wrap:wrap;

        gap:1rem;

        justify-content:center;

        border-radius:20px;

    }
        .stat{

        flex:0 0 calc(50% - 1rem);

        text-align:center;

    }

    .stat h2{

        font-size:1.5rem;

    }

    .stat span{

        font-size:.9rem;

    }

    .hero-slider{

        height:100vh;
    }
}


@media(max-width:480px){

    .estadisticas{

        padding:.8rem;

    }

    .stat{

        flex:0 0 100%;

    }

    .stat h2{

        font-size:1.3rem;

    }

    .stat span{

        font-size:.85rem;

    }

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
 background:transparent !important;
    }

    .bloque-subregion-seccion:nth-child(even){
         background:transparent !important;
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

.oculta-region{
    display:none;
}

.visible-region{
    display:block;
    animation:fadeRegion .5s ease;
}

@keyframes fadeRegion{

    from{
        opacity:0;
        transform:translateY(20px);
    }

    to{
        opacity:1;
        transform:translateY(0);
    }

}

/* =========================
   CONTENEDOR PRINCIPAL
=========================*/

.contenedor-regiones-principal{
    position:relative;
}

/* =========================
   BOTONES FLOTANTES (ABAJO IZQUIERDA)
=========================*/

.contenedor-botones-superior{

    position:absolute;
    bottom:80px;
    left:70px;

    display:flex;
    gap:1rem;

    z-index:20;
}

/* =========================
   BOTONES
=========================*/

.btn-subregion-nav{

    width:auto;
    min-width:140px;

    height:48px;

    padding:0 18px;

    border-radius:50px;

    border:none;

    background:#ffffff;

    color:var(--verde-paramo);

    font-size:1rem;
    font-weight:600;

    display:flex;
    align-items:center;
    justify-content:center;

    gap:8px;

    box-shadow:0 10px 25px rgba(0,0,0,.18);

    transition:all .25s ease;

    white-space:nowrap;
}

.btn-subregion-nav:hover{

    background:var(--verde-paramo);
    color:#ffffff;

    transform:translateY(-2px);

}

/* =========================
   TARJETA
=========================*/

#contenedor-subregiones-verticales{
    padding-top:0rem;
}
.arrow{
    font-size:1.2rem;
    font-weight:700;
}

</style>

</asp:Content>

<asp:Content ID="BodyContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <!-- HERO -->
<section class="hero-slider">

    <div class="slide active"
         style="background-image:
         linear-gradient(
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
         style="background-image:
         linear-gradient(
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
         style="background-image:
         linear-gradient(
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

    <!-- SUBREGIONES -->


            <!-- CONTENEDOR DINÁMICO -->
<div class="contenedor-regiones-principal">
            <div class="text-center mb-2">

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
    <!-- BOTONES -->
    <div class="contenedor-botones-superior">

<button type="button" id="btnAnterior" class="btn btn-subregion-nav">
    <span class="arrow">←</span>
    <span>Anterior</span>
</button>

<button type="button" id="btnSiguiente" class="btn btn-subregion-nav">
    <span>Siguiente</span>
    <span class="arrow">→</span>
</button>

    </div>

    <!-- REGIONES -->
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
                "El corazón histórico del departamdfgdfgdfg dgdgf dfgd gsdgf sdfg dfg dfg dfg dfg dsgf ento.",

            "Norte":
                "Una región multicultural.",

            "Sur":
                "Paisajes cafeteros y agrícolas.",

            "Oriente":
                "Territorio arqueológico y espiritual.",

            "Pacifico":
                "Selva húmeda tropical.",

            "Macizo":
                "La estrella hídrica de Colombia.",

            "Bota":
                "Transición amazónica."

        };

        const imagenesSubregiones = {

            "Centro": "/images/Cerro_de_Manzanillo.jpg",
            "Norte": "/images/Cerro_de_Manzanillo.jpg",
            "Sur": "/images/Cerro_de_Manzanillo.jpg",
            "Oriente": "/images/Cerro_de_Manzanillo.jpg",
            "Pacifico": "/images/Cerro_de_Manzanillo.jpg",
            "Macizo": "/images/Cerro_de_Manzanillo.jpg",
            "Bota": "/images/Patia.jpg"

        };

        const listaSubregiones =
            Object.keys(descripcionesSubregiones);

        /* =========================
           CREAR REGIONES
        ==========================*/

        listaSubregiones.forEach(subregion => {

            const idSeguro =
                subregion
                    .toLowerCase()
                    .replace(/\s+/g, "-");

            const bloque = `

<section
    id="subregion-${idSeguro}"
    class="bloque-subregion-seccion">

    <div class="container">

        <div class="subregion-contenedor-flex">

            <div class="subregion-col-texto">

                <h2 class="subregion-titulo-h2">
                    ${subregion}
                </h2>

                <div class="subregion-linea-decorativa"></div>

                <p class="subregion-parrafo-cronica">
                    ${descripcionesSubregiones[subregion]}
                </p>

                <a
                    href="DetalleSubregion.aspx?region=${encodeURIComponent(subregion)}"
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

        if (spinner) {
            spinner.style.display = "none";
        }

        /* =========================
           CONTROL REGIONES
        ==========================*/

        let regionActual = 0;

        const regiones =
            document.querySelectorAll(
                ".bloque-subregion-seccion"
            );

        function mostrarRegion(index) {

            regiones.forEach((region, i) => {

                region.style.display =
                    i === index
                        ? "block"
                        : "none";

            });

        }

        mostrarRegion(regionActual);

        /* =========================
           BOTONES
        ==========================*/

        const btnAnterior =
            document.getElementById(
                "btnAnterior"
            );

        const btnSiguiente =
            document.getElementById(
                "btnSiguiente"
            );

        btnSiguiente.addEventListener(
            "click",
            function () {

                if (
                    regionActual <
                    regiones.length - 1
                ) {

                    regionActual++;

                    mostrarRegion(regionActual);

                }

            }
        );

        btnAnterior.addEventListener(
            "click",
            function () {

                if (regionActual > 0) {

                    regionActual--;

                    mostrarRegion(regionActual);

                }

            }
        );

    });





        const slides =
        document.querySelectorAll('.slide');

        const dots =
        document.querySelectorAll('.dot');

        let current = 0;

        function mostrarSlide(index){

            slides.forEach(slide =>
                slide.classList.remove('active')
            );

    dots.forEach(dot =>
        dot.classList.remove('active')
        );

        slides[index].classList.add('active');

        dots[index].classList.add('active');

        current = index;
}

        function siguiente(){

            current++;

    if(current >= slides.length){
            current = 0;
    }

        mostrarSlide(current);
}

        function anterior(){

            current--;

        if(current < 0){
            current = slides.length - 1;
    }

        mostrarSlide(current);
}


dots.forEach((dot, index)=>{

            dot.addEventListener('click', () => {

                mostrarSlide(index);

            });

});

        setInterval(siguiente, 5000);


</script>

</asp:Content>
