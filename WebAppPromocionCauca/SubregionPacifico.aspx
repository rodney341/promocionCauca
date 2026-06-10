<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubregionPacifico.aspx.cs" Inherits="WebAppPromocionCauca.SubregionPacifico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
<style>
/* ===================================
   SUBREGIÓN PACÍFICO
=================================== */

.pacifico-section {
    padding: 80px 0;
    background: #f7f7f7;
}

.pacifico-container {
    max-width: 1400px;
    margin: auto;
    display: grid;
    grid-template-columns: 80px 1fr 450px;
    gap: 40px;
    align-items: start;
}

/* TÍTULO VERTICAL */

.titulo-vertical {
    background: #64c7d0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 650px;
}

.titulo-vertical span {
    writing-mode: vertical-rl;
    transform: rotate(180deg);
    color: white;
    font-size: 2rem;
    font-weight: 700;
}

/* TEXTO */

.contenido-texto h2 {
    color: #12344d;
    margin-bottom: 25px;
    font-size: 2.5rem;
}

.contenido-texto p {
    text-align: justify;
    line-height: 1.8;
    color: #444;
    font-size: 1.1rem;
}

.destacados {
    margin-top: 30px;
    display: grid;
    gap: 12px;
}

.destacados div {
    background: white;
    padding: 15px;
    border-radius: 12px;
    box-shadow: 0 5px 15px rgba(0,0,0,.08);
}

/* IMAGEN PRINCIPAL */

.imagen-principal{
    position:relative;
    display:flex;
    flex-direction:column;
    gap:20px;
}

.imagen-principal img {
    width: 100%;
    border-radius: 25px;
    box-shadow: 0 15px 30px rgba(0,0,0,.15);
}
.img-destacada{
    width:100%;
    height:450px;
    object-fit:cover;
    border-radius:25px;
    box-shadow:0 15px 30px rgba(0,0,0,.15);
}
.img-secundaria{
    width:100%;
    height:180px;
    object-fit:cover;
    border-radius:20px;
    box-shadow:0 10px 20px rgba(0,0,0,.10);
}

.unesco-badge{
    position:absolute;
    top:20px;
    left:20px;
    background:#fff;
    padding:10px 20px;
    border-radius:50px;
    font-weight:700;
    box-shadow:0 5px 15px rgba(0,0,0,.15);
}

/* GALERÍA */

.galeria-pacifico {

    max-width: 1400px;
    margin: 60px auto 0;

    display: grid;

    grid-template-columns:
        2fr
        1fr
        1fr;

    gap: 20px;
}

.galeria-pacifico img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 20px;

    transition: .4s;
}

.galeria-pacifico img:hover {
    transform: scale(1.04);
}

.img-large {
    grid-row: span 2;
}

/* RESPONSIVE */

@media(max-width:992px){

    .pacifico-container{
        grid-template-columns:1fr;
    }

    .titulo-vertical{
        min-height:80px;
    }

    .titulo-vertical span{
        writing-mode:horizontal-tb;
        transform:none;
    }

    .galeria-pacifico{
        grid-template-columns:1fr 1fr;
    }

    .img-large{
        grid-row:auto;
        grid-column:span 2;
    }
}

@media(max-width:768px){

    .galeria-pacifico{
        grid-template-columns:1fr;
    }

    .img-large{
        grid-column:auto;
    }

    .contenido-texto h2{
        font-size:2rem;
    }
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<section class="pacifico-section">

    <div class="pacifico-container">

        <!-- TÍTULO VERTICAL -->
        <div class="titulo-vertical">
            <span>Subregión Pacífico</span>
        </div>

        <!-- TEXTO -->
        <div class="contenido-texto"
             data-aos="fade-right">

            <h2>Subregión Pacífico</h2>

            <p>
                La subregión Pacífico del Cauca está conformada por los municipios
                de Guapi, López de Micay y Timbiquí, territorios reconocidos por
                su riqueza cultural, biodiversidad y tradiciones ancestrales.
            </p>

            <p>
                Esta región cuenta con el reconocimiento de la UNESCO por las
                Músicas de Marimba y Cantos Tradicionales del Pacífico Sur Colombiano,
                una expresión cultural que representa la identidad de las comunidades afrodescendientes.

                Esta región cuenta con el reconocimiento de la UNESCO por las
Músicas de Marimba y Cantos Tradicionales del Pacífico Sur Colombiano,
una expresión cultural que representa la identidad de las comunidades afrodescendientes.

                Esta región cuenta con el reconocimiento de la UNESCO por las
Músicas de Marimba y Cantos Tradicionales del Pacífico Sur Colombiano,
una expresión cultural que representa la identidad de las comunidades afrodescendientes.

                Esta región cuenta con el reconocimiento de la UNESCO por las
Músicas de Marimba y Cantos Tradicionales del Pacífico Sur Colombiano,
una expresión cultural que representa la identidad de las comunidades afrodescendientes.
            </p>

            <div class="destacados">

                <div>
                    🎵 Patrimonio UNESCO
                </div>              <div>
                    🐋 Avistamiento de Ballenas
                </div>

                <div>
                    🌿 Ecoturismo
                </div>

                <div>
                    🏝️ Playas y Manglares
                </div>

            </div>

        </div>

        <!-- IMAGEN PRINCIPAL -->
        <div class="imagen-principal" data-aos="fade-left">

            <img class="img-destacada"
                 src="Images/Colibri-AdrianaCollazos.jpg"
                 alt="Colibrí del Cauca">

            <div class="unesco-badge">
                UNESCO
            </div>

            <img class="img-secundaria"
                 src="Images/Colibri-AdrianaCollazos.jpg"
                 alt="Colibrí del Cauca">

        </div>

    </div>

    <!-- GALERÍA -->
    <div class="galeria-pacifico">

        <div class="img-large"
             data-aos="zoom-in">
            <img src="Images/Colibri-AdrianaCollazos.jpg">
        </div>

        <div data-aos="zoom-in">
            <img src="Images/Colibri-AdrianaCollazos.jpg">
        </div>

        <div data-aos="zoom-in">
            <img src="Images/Colibri-AdrianaCollazos.jpg">
        </div>

        <div data-aos="zoom-in">
            <img src="Images/Colibri-AdrianaCollazos.jpg">
        </div>

        <div data-aos="zoom-in">
            <img src="Images/Colibri-AdrianaCollazos.jpg">
        </div>

    </div>

</section>

</asp:Content>
