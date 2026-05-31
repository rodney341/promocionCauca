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

    <div class="mt-5">

        <a href="/Default.aspx#subregiones"
           class="btn btn-cauca-principal">

            ← Volver

        </a>

    </div>

</div>

</asp:Content>