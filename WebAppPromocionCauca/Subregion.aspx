<%@ Page Title="Subregión"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Subregion.aspx.cs"
Inherits="WebAppPromocionCauca.Subregion" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<section class="subregion-hero">

    <asp:Image
        ID="imgHero"
        runat="server"
        CssClass="hero-image" />

    <div class="hero-overlay">

        <h1>

            <asp:Label
                ID="lblNombre"
                runat="server" />

        </h1>

    </div>

</section>

<div class="container py-5">

    <asp:Label
        ID="lblDescripcion"
        runat="server"
        CssClass="lead" />

    <hr />

    <asp:Literal
        ID="litContenido"
        runat="server" />
    <hr />

<h3 class="mb-4">
    Galería Fotográfica
</h3>

<div class="row g-4">

    <asp:Repeater
        ID="rptGaleria"
        runat="server">

        <ItemTemplate>

            <div class="col-lg-4 col-md-6">

                <img
                    src='<%# Container.DataItem %>'
                    class="galeria-img img-fluid rounded shadow-sm" />

            </div>

        </ItemTemplate>

    </asp:Repeater>

</div>

    <div id="lightbox" class="lightbox">

    <span class="cerrar">&times;</span>

    <img id="lightbox-img">

</div>

    <div class="mt-5">

        <a href="/Default.aspx#subregiones"
           class="btn btn-cauca-principal">

            ← Volver

        </a>

    </div>

</div>
    <script>

        document.addEventListener("DOMContentLoaded", function () {

            const imgs =
                document.querySelectorAll(".galeria-img");

            const lightbox =
                document.getElementById("lightbox");

            const img =
                document.getElementById("lightbox-img");

            imgs.forEach(function (foto) {

                foto.addEventListener("click", function () {

                    lightbox.style.display = "block";
                    img.src = this.src;

                });

            });

            document.querySelector(".cerrar")
                .addEventListener("click", function () {

                    lightbox.style.display = "none";

                });

        });

</script>

</asp:Content>