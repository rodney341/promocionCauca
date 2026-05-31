<%@ Page Title="Lectura de Artículo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Articulo.aspx.cs" Inherits="WebAppPromocionCauca.Articulo" %>

<%-- 1. CONTENEDOR DE ESTILOS (Apunta a la cabecera) --%>
<asp:Content ID="ContentStylesArticulo" ContentPlaceHolderID="Stylesheets" runat="server">
    <style>
        .articulo-contenedor { max-width: 800px; margin: 4rem auto; margin-top:-4px; background-color: #FFFFFF; border-radius: 8px; box-shadow: 0 4px 20px rgba(0,0,0,0.05); overflow: hidden; }
        .articulo-banner { height: 400px; background-size: cover; background-position: center; }
        .articulo-cuerpo { padding: 3rem; line-height: 1.8; font-size: 1.15rem; color: #444444; }
        .btn-regresar { color: var(--terracota); text-decoration: none; font-weight: 600; display: inline-block; margin-bottom: 2rem; }
        .btn-regresar:hover { color: var(--verde-paramo); }
    </style>
</asp:Content>

<%-- 2. CONTENEDOR PRINCIPAL DEL CUERPO (Apunta al MainContent) --%>
<asp:Content ID="ContentBodyArticulo" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-5">
        <a href="Blog.aspx" class="btn-regresar">← Volver al Blog Turístico</a>
        
        <div class="text-center py-5" id="cargador-articulo">
            <div class="spinner-border text-success" role="status"></div>
            <p class="mt-2 text-muted">Abriendo bitácora de viaje...</p>
        </div>

        <article class="articulo-contenedor" id="cuerpo-articulo" style="display: none;">
            <div class="articulo-banner" id="art-imagen"></div>
            <div class="articulo-cuerpo">
                <span class="badge mb-3 py-2 px-3 fw-bold text-uppercase" id="art-categoria" style="background-color: var(--terracota); color: white;"></span>
                <h1 class="fw-bold mb-2" style="color: var(--texto-oscuro); font-size: 2.5rem;" id="art-titulo"></h1>
                <p class="text-muted small mb-4">📅 <span id="art-fecha"></span> | Escritor invitado: <strong id="art-autor" class="text-dark"></strong></p>
                <hr />
                <p class="fs-5 text-secondary mt-4" id="art-contenido-principal" style="line-height: 1.9;"></p>
                <div class="my-4 rounded-3 shadow-sm" id="art-imagen2" style="height: 300px; background-size: cover; background-position: center;"></div>
                <div class="fs-5 text-secondary" id="art-contenido-detallado" style="line-height: 1.9;"></div>
                <h4 class="fw-bold mt-5 mb-3" style="color: var(--verde-paramo);">Galería Fotográfica del Destino</h4>
                <div class="row g-3" id="art-galeria"></div>
            </div>
        </article>
    </div>

    <!-- ⚡ EL SCRIPT DE CORRECCIÓN AHORA QUEDA ADENTRO DEL CONTENT DEL CUERPO -->
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            const urlParams = new URLSearchParams(window.location.search);
            const idArticulo = urlParams.get('id');

            if (!idArticulo) { window.location.href = "Blog.aspx"; return; }

            const urlFirebase = `https://turismocauca-7a4ec-default-rtdb.firebaseio.com/blog/${idArticulo}.json`;

            fetch(urlFirebase)
                .then(response => response.json())
                .then(data => {
                    document.getElementById("cargador-articulo").style.display = "none";
                    if (!data) { alert("Artículo no encontrado."); window.location.href = "Blog.aspx"; return; }

                    const articulo = data.articulo_1 || data;

                    document.getElementById("art-titulo").innerText = articulo.Titulo || "Sin Título";
                    document.getElementById("art-categoria").innerText = articulo.Categoria || "General";
                    document.getElementById("art-autor").innerText = articulo.Autor || "Anónimo";
                    document.getElementById("art-contenido-principal").innerText = articulo.Resumen || "";
                    document.getElementById("art-contenido-detallado").innerHTML = articulo.Contenido || "<p class='text-muted'>No hay contenido extenso.</p>";

                    const fecha = articulo.Fecha ? new Date(articulo.Fecha) : new Date();
                    document.getElementById("art-fecha").innerText = fecha.toLocaleDateString('es-ES', { day: '2-digit', month: 'long', year: 'numeric' });

                    document.getElementById("art-imagen").style.backgroundImage = `url('${articulo.UrlImagen || '/images/Cerro_de_Manzanillo.jpg'}')`;

                    if (articulo.UrlImagen2) {
                        document.getElementById("art-imagen2").style.backgroundImage = `url('${articulo.UrlImagen2}')`;
                        document.getElementById("art-imagen2").style.display = "block";
                    } else {
                        document.getElementById("art-imagen2").style.display = "none";
                    }

                    const contenedorGaleria = document.getElementById("art-galeria");
                    let htmlGaleria = "";

                    if (articulo.Galeria && Array.isArray(articulo.Galeria)) {
                        articulo.Galeria.forEach(urlImg => {
                            htmlGaleria += `
                                <div class="col-6 col-md-4">
                                    <div class="rounded shadow-sm overflow-hidden border" style="height: 160px; background-image: url('${urlImg}'); background-size: cover; background-position: center; transition: transform 0.2s; cursor: pointer;" onmouseover="this.style.transform='scale(1.03)'" onmouseout="this.style.transform='scale(1)'"></div>
                                </div>
                            `;
                        });
                    } else {
                        htmlGaleria = "<p class='text-muted small ms-2'>No hay fotografías en este álbum.</p>";
                    }
                    contenedorGaleria.innerHTML = htmlGaleria;
                    document.getElementById("cuerpo-articulo").style.display = "block";
                })
                .catch(error => {
                    console.error("Error:", error);
                    document.getElementById("cargador-articulo").innerHTML = '<p class="text-danger">⚠️ Error al recuperar la bitácora.</p>';
                });
        });
    </script>
</asp:Content>
