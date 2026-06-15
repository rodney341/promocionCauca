<%@ Page Title="Subregión"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Subregion.aspx.cs"
    Inherits="WebAppPromocionCauca.Subregion" %>

<asp:Content ID="ContentStylesSubregion" ContentPlaceHolderID="Stylesheets" runat="server">
    <style>

/*navegacion*/
.navegacion-subregion{
    margin-top:3rem;
    margin-bottom:1rem;
}

.navegacion-subregion .contenido-subregion{
    max-width:900px;
    margin:0 auto;
}

.navegacion-subregion .btn{
    border-radius:12px;
    padding:10px 18px;
    font-weight:600;
}
/*pacifico*/
/* ===================================
   SUBREGIÓN
=================================== */

.subregion-section {
    padding: 80px 0;
    background: #f8f9fa;
}

.subregion-container {
    max-width: 1400px;
    margin-bottom: 80px;
    display: grid;
    grid-template-columns: 80px 1.2fr 0.9fr;
    gap: 40px;

    align-items: stretch; /* importante */
}

/* ======================
   TITULO VERTICAL
====================== */

.titulo-vertical {
    background: #64c7d0;
    display: flex;
    justify-content: center;
    align-items: start;
    min-height: 650px;

}

.titulo-vertical span {
    writing-mode: vertical-rl;
    transform: rotate(180deg);
    color: white;
    font-size: 2rem;
    font-weight: 700;
    margin-top:73px;
    display: flex;
    gap: 12px;
}
.texto-subregion {
    font-style: italic;
    font-family: Georgia, serif;
    font-weight: 400;
    letter-spacing: 1px;
}

/* ======================
   CONTENIDO
====================== */

.contenido-texto {
    padding-right: 20px;
}

.contenido-texto h2 {
    font-size: 3rem;
    color: #12344d;
    margin-bottom: 25px;
    line-height: 1.1;
}

.contenido-texto p {
    text-align: justify;
    color: #555;
    line-height: 1.9;
    font-size: 1.05rem;
    margin-bottom: 18px;
}

/* ======================
   UNESCO
====================== */

.unesco-info {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    background: #f8f9fa;
    border-left: 4px solid #0d6efd;
    padding: 0.75rem 1rem;
    border-radius: 8px;
    margin-top: 1rem;
    font-size: 0.95rem;
    color: #495057;
    gap: 12px;
}

.unesco-info strong {
    color: #0d6efd;
}

.unesco-icon {
    font-size: 1.5rem;
    flex-shrink: 0;
}

/* ======================
   DESTACADOS
====================== */

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

/* ======================
   IMAGEN PRINCIPAL
====================== */

.imagen-principal {
    position: relative;

    display: flex;
    flex-direction: column;

    height: 100%;
    min-height: 100%;

    gap: 20px;
}

.imagen-principal img {
    width: 100%;
    border-radius: 25px;
    box-shadow: 0 15px 30px rgba(0,0,0,.15);
}

.img-destacada {
    flex: 4;

    width: 100%;
    min-height: 0;

    object-fit: cover;

    border-radius: 25px;

    box-shadow: 0 15px 30px rgba(0,0,0,.15);
}
.img-secundaria {
    flex: 3;

    width: 100%;
    min-height: 120px;

    object-fit: cover;

    border-radius: 20px;

    box-shadow: 0 10px 20px rgba(0,0,0,.10);
}

.unesco-badge {
    position: absolute;

    top: 20px;
    left: 20px;

    background: white;

    padding: 12px 24px;

    border-radius: 50px;

    font-weight: 700;
    color: #12344d;

    box-shadow: 0 8px 20px rgba(0,0,0,.15);
}

/* ======================
   GALERIA
====================== */

/* ======================
   GALERIA SWIPER
====================== */

.galeria-section {
    margin-top: 80px;
    margin-bottom: 40px;
}

.galeria-header {
    text-align: center;
    margin-bottom: 35px;
}

.galeria-header h3 {
    color: #12344d;
    font-size: 2rem;
    font-weight: 700;
}

.galeria-header p {
    color: #6c757d;
}

.galeriaSwiper {
    padding-bottom: 50px;
}

.swiper-slide {
    overflow: hidden;
    border-radius: 20px;

}

.swiper-img {
    width: 100%;
    height: 350px;

    object-fit: cover;

    border-radius: 20px;

    transition: .5s ease;

    box-shadow:
        0 10px 25px rgba(0,0,0,.10);
}

.swiper-img:hover {
    transform: scale(1.05);
}

.swiper-button-next,
.swiper-button-prev {
    color: #12344d;
}

.swiper-pagination-bullet-active {
    background: #12344d;
}

/* ======================
   RESPONSIVE
====================== */

@media (max-width:1200px){

    .subregion-container{
        grid-template-columns:
            70px
            1fr
            450px;
    }

    .img-destacada{
        height:500px;
    }

}

@media (max-width:992px){

    .subregion-container{
        grid-template-columns:1fr;
    }

    .titulo-vertical{
        min-height:80px;
    }

    .titulo-vertical span{
        writing-mode: horizontal-tb;
        transform: none;
        justify-content: center;

    }
        .texto-subregion{
        margin-right: 8px;
    }

.contenido-texto {
    display: flex;
    flex-direction: column;
    height: 100%;
}

    .img-destacada{
        height:500px;
    }

    .galeria-pacifico{
        grid-template-columns:
            repeat(2,1fr);
    }
}

@media (max-width:768px){

    .contenido-texto h2{
        font-size:2.2rem;
    }

    .img-destacada{
        height:350px;
    }

    .galeria-pacifico{
        grid-template-columns:1fr;
    }

    .galeria-pacifico img{
        height:250px;
    }
}

</style>
</asp:Content>


<asp:Content ID="Content1"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <section class="navegacion-subregion">

        <div class="contenido-subregion">

            <div class="d-flex justify-content-end gap-2">

                <asp:HyperLink
                    ID="lnkAnterior"
                    runat="server"
                    CssClass="btn btn-outline-success"
                    Visible="false" />

                <asp:HyperLink
                    ID="lnkSiguiente"
                    runat="server"
                    CssClass="btn btn-cauca-principal"
                    Visible="false" />

            </div>

        </div>

    </section>

    <div class="subregion-container">

        <!-- BARRA VERTICAL -->

        <div class="titulo-vertical"
             runat="server"
             id="divTituloVertical">

            <span>
                <em class="texto-subregion">Subregión</em>

                <asp:Literal
                    ID="litNombreVertical"
                    runat="server" />
            </span>

        </div>

        <!-- DESCRIPCIÓN -->

            <div class="contenido-texto"
                data-aos="fade-right">

                <h2>Subregión 
                <asp:Literal
                    ID="litNombre"
                    runat="server" />
                </h2>

                <p>
                    <asp:Literal
                        ID="litContenido"
                        runat="server" />
                </p>


               <asp:Panel ID="pnlUnesco" runat="server" CssClass="unesco-info" Visible="false">
                    <span class="unesco-icon">🏛️</span>
                    <asp:Literal ID="litUnesco" runat="server"></asp:Literal>
               </asp:Panel>

                <asp:Repeater
                    ID="rptDestacados"
                    runat="server">

                    <HeaderTemplate>
                        <div class="destacados">
                    </HeaderTemplate>

                    <ItemTemplate>

                        <div>
                            <%# Container.DataItem %>
                        </div>

                    </ItemTemplate>

                    <FooterTemplate>
                        </div>
                    </FooterTemplate>

                </asp:Repeater>
            </div>

            <!-- IMAGEN PRINCIPAL -->
            <div class="imagen-principal" data-aos="fade-left">

                <asp:Image
                    ID="imgPrincipal"
                    runat="server"
                    CssClass="img-destacada" />

                <asp:Panel
                    ID="pnlBadgeUnesco"
                    runat="server"
                    CssClass="unesco-badge">
                    UNESCO

           
                </asp:Panel>

                <asp:Image
                    ID="imgSecundaria"
                    runat="server"
                    CssClass="img-secundaria" />

            </div>

        </div>



<section class="galeria-section" id="galeriaSection" runat="server">

    <div class="galeria-header">
        <h3>Galería Fotográfica</h3>
        <p>Descubre los paisajes, la cultura y los atractivos de la subregión.</p>
    </div>

    <div class="swiper galeriaSwiper">

        <div class="swiper-wrapper">

            <asp:Repeater ID="rptGaleria" runat="server">

                <ItemTemplate>

                    <div class="swiper-slide">

                        <img src='<%# Container.DataItem %>'
                             alt="Imagen de la subregión"
                             class="swiper-img" />

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>

        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>

    </div>

</section>

    <!-- VOLVER -->
    <div class="container text-center pb-5">

        <a href="/Default.aspx#subregiones"
           class="btn btn-outline-secondary">

            ← Volver a Subregiones

        </a>

    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function () {

            new Swiper(".galeriaSwiper", {

                slidesPerView: 1,
                spaceBetween: 20,

                loop: true,

                autoplay: {
                    delay: 3500,
                    disableOnInteraction: false
                },

                pagination: {
                    el: ".swiper-pagination",
                    clickable: true
                },

                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev"
                },

                breakpoints: {

                    576: {
                        slidesPerView: 2
                    },

                    992: {
                        slidesPerView: 3
                    },

                    1400: {
                        slidesPerView: 4
                    }

                }

            });

        });
</script>
</asp:Content>