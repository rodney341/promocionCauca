<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="WebAppPromocionCauca.Blog" %>
<asp:Content ID="ContentStylesBlog" ContentPlaceHolderID="Stylesheets" runat="server">
    <style>
        .blog-header {
            background: linear-gradient(rgba(45, 90, 39, 0.85), rgba(45, 90, 39, 0.95)), url('/images/Cerro_de_Manzanillo.jpg') center/cover;
            padding: 4rem 2rem; 
            color: #FFFFFF; 
            border-radius: 8px;
        }
        .categoria-badge {
            background-color: var(--terracota); 
            color: #FFFFFF; 
            font-size: 0.8rem;
            font-weight: 600; 
            padding: 0.3rem 0.8rem; 
            border-radius: 4px; 
            display: inline-block; 
            margin-bottom: 0.8rem;
        }

        .blog-card{
            border-radius:20px;
            transition:.3s ease;
        }

        .blog-card:hover{
            transform:translateY(-8px);
            box-shadow:0 15px 35px rgba(0,0,0,.15) !important;
        }

        .blog-card img{
            transition:.4s ease;
        }

        .blog-card:hover img{
            transform:scale(1.05);
        }

        .blog-card .badge{
            background:var(--verde-paramo);
        }

        /*paginacion*/
        .pagination .page-link {
            color: var(--verde-paramo);
            border: none;
            margin: 0 3px;
            border-radius: 10px;
        }

        .pagination .page-item.active .page-link {
            background: var(--verde-paramo);
            color: white;
        }

        .pagination .page-link:hover {
            background: #f1f1f1;
        }

        .animate-fade {
            animation: fadeIn 0.4s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</asp:Content>

<%-- 2. CONTENEDOR PRINCIPAL DEL CUERPO --%>
<asp:Content ID="ContentBodyBlog" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-5">
        
        <!-- Encabezado del Blog -->
        <header class="blog-header text-center mb-5 shadow-sm">
            <h1 class="fw-bold display-5">Crónicas de Nuestra Tierra</h1>
            <p class="fs-5 max-width-600 mx-auto opacity-75">Historias, guías de viaje y secretos gastronómicos del Cauca en tiempo real.</p>
        </header>

        <!-- CONTENEDOR DE FILTROS DINÁMICOS -->
        <div class="row g-3 card shadow-sm p-4 border-0 mb-5 mx-0" style="background-color: #FFFFFF; border-left: 4px solid var(--verde-paramo) !important;">
            <div class="col-12 mb-2">
                <h5 class="fw-bold m-0 text-secondary">Filtrar bitácoras de viaje</h5>
            </div>
            <div class="row g-3">
                <div class="col-md-7">
                    <div class="input-group">
                        <span class="input-group-text bg-light text-muted border-end-0">🔍</span>
                        <input type="text" id="txtBuscarTitulo" class="form-control border-start-0" placeholder="Escribe el título que deseas buscar..." autocomplete="off" />
                    </div>
                </div>
                <div class="col-md-5">
                    <select id="ddlFiltrarCategoria" class="form-select">
                        <option value="TODAS">📁 Todas las categorías</option>
                        <option value="Gastronomía">Gastronomía</option>
                        <option value="Ecoturismo">Ecoturismo</option>
                        <option value="Cultura">Cultura y Saberes</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Mensaje de no resultados (Manejado por JS) -->
        <div class="alert alert-light text-center py-4 shadow-sm border border-warning" id="alerta-no-resultados" style="display: none; background-color: #FFFFFF;">
            <p class="mb-0 text-muted fs-5">🍂 No encontramos crónicas que coincidan con los filtros aplicados. Intenta con otra combinación.</p>
        </div>

<!-- GRILLA DE ARTÍCULOS -->
<div class="row g-4">

    <asp:Repeater ID="rptBlog" runat="server">
        <ItemTemplate>

            <div class="col-lg-4 col-md-6 col-12 articulo-blog"
                 data-categoria='<%# Eval("categoria") %>'
                 data-titulo='<%# Eval("titulo") %>'>

                <div class="card h-100 shadow-sm border-0 overflow-hidden blog-card">

                    <img src='<%# Eval("urlImagen") %>'
                         alt='<%# Eval("titulo") %>'
                         class="card-img-top"
                         style="height:250px; object-fit:cover;" />

                    <div class="card-body d-flex flex-column">

                        <span class="badge bg-success mb-2 align-self-start">
                            <%# Eval("categoria") %>
                        </span>

                        <h5 class="card-title fw-bold">
                            <%# Eval("titulo") %>
                        </h5>

                        <p class="card-text text-muted flex-grow-1">
                            <%# Eval("resumen") %>
                        </p>

                        <div class="d-flex justify-content-between align-items-center mt-3">

                            <small class="text-muted">
                                <%# Convert.ToDateTime(Eval("fecha")).ToString("dd/MM/yyyy") %>
                            </small>

                            <a href='Articulo.aspx?slug=<%# Eval("slug") %>'
                               class="btn btn-outline-success btn-sm">
                                Leer más
                            </a>

                        </div>

                    </div>

                </div>

            </div>

        </ItemTemplate>
    </asp:Repeater>

</div>

        <!-- BARRA NUMÉRICA DE PAGINACIÓN -->
        <div class="d-flex justify-content-center mt-5">
            <nav aria-label="Navegación del blog">
<ul class="pagination shadow-sm" id="control-paginas">
    <%= HtmlPaginacion %>
</ul>
            </nav>
        </div>

    </div>

    <!-- ⚡ MOTOR FRONTEND: CONSUMO REST, LOGICA MATRICIAL Y PAGINADO -->
<script>
    document.addEventListener("DOMContentLoaded", function () {

        const txtBuscar =
            document.getElementById("txtBuscarTitulo");

        const ddlCategoria =
            document.getElementById("ddlFiltrarCategoria");

        function filtrar() {

            const texto =
                txtBuscar.value.toLowerCase();

            const categoria =
                ddlCategoria.value;

            const tarjetas =
                document.querySelectorAll(".articulo-blog");

            let visibles = 0;

            tarjetas.forEach(card => {

                const titulo =
                    card.dataset.titulo.toLowerCase();

                const cat =
                    card.dataset.categoria;

                const coincideTitulo =
                    titulo.includes(texto);

                const coincideCategoria =
                    categoria === "TODAS" ||
                    categoria === cat;

                if (coincideTitulo && coincideCategoria) {
                    card.style.display = "";
                    visibles++;
                }
                else {
                    card.style.display = "none";
                }
            });

            document.getElementById("alerta-no-resultados")
                .style.display =
                visibles === 0 ? "block" : "none";
        }

        txtBuscar.addEventListener("keyup", filtrar);
        ddlCategoria.addEventListener("change", filtrar);
    });
</script>
</asp:Content>
