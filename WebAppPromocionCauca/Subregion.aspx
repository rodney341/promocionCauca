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
    margin-right: -3rem;

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
    margin: 0 auto;
    display: grid;
    grid-template-columns: 80px 1.2fr 0.9fr;
    gap: 40px;
    align-items: start;
}

/* ======================
   TITULO VERTICAL
====================== */

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
    background: linear-gradient(135deg,#12344d,#1b557d);
    color: white;

    padding: 18px 25px;
    border-radius: 15px;

    margin: 25px 0;

    font-size: .95rem;
    line-height: 1.7;

    box-shadow: 0 8px 20px rgba(0,0,0,.12);
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

.img-destacada {
    width: 100%;
    height: 580px;

    object-fit: cover;

    border-radius: 30px;

    box-shadow:
        0 20px 40px rgba(0,0,0,.15);
}
.img-secundaria{
    width:100%;
    height:180px;
    object-fit:cover;
    border-radius:20px;
    box-shadow:0 10px 20px rgba(0,0,0,.10);
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

.galeria-pacifico {
    max-width: 1400px;
    margin: 50px;

    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 25px;
}

.galeria-item img {
    width: 100%;
    height: 280px;
    object-fit: cover;

    border-radius: 20px;

    transition: .4s ease;

    box-shadow: 0 10px 25px rgba(0,0,0,.10);
}

.galeria-item img:hover {
    transform: scale(1.03);
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
        writing-mode:horizontal-tb;
        transform:none;
    }

    .contenido-texto{
        padding-right:0;
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
            <span> Subregión 
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



<section class="galeria-section">

    <asp:Repeater ID="rptGaleria" runat="server">

        <HeaderTemplate>
            <div class="galeria-pacifico">
        </HeaderTemplate>

        <ItemTemplate>

            <div class="galeria-item" data-aos="zoom-in">

                <img src='<%# Container.DataItem %>'
                    alt="Imagen de la subregión" />

            </div>

        </ItemTemplate>

        <FooterTemplate>
            </div>
        </FooterTemplate>

    </asp:Repeater>

</section>

    <!-- VOLVER -->
    <div class="container text-center pb-5">

        <a href="/Default.aspx#subregiones"
           class="btn btn-outline-secondary">

            ← Volver a Subregiones

        </a>

    </div>
</asp:Content>