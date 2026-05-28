<%@ Page Title="Blog Turístico del Cauca" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="WebAppPromocionCauca.Blog" %>

<%-- 1. CONTENEDOR DE ESTILOS INYECTADOS AL HEAD (Todos los estilos unificados aquí) --%>
<asp:Content ID="ContentStylesBlog" ContentPlaceHolderID="Stylesheets" runat="server">
    <style>
        .blog-header {
            background: linear-gradient(rgba(45, 90, 39, 0.85), rgba(45, 90, 39, 0.95)), url('/images/Cerro_de_Manzanillo.jpg') center/cover;
            padding: 4rem 2rem; 
            color: #FFFFFF; 
            border-radius: 8px;
        }
        .tarjeta-entrada {
            background-color: #FFFFFF; 
            border-radius: 8px; 
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05); 
            transition: transform 0.3s, box-shadow 0.3s;
            height: 100%; 
            display: flex; 
            flex-direction: column;
        }
        .tarjeta-entrada:hover { 
            transform: translateY(-5px); 
            box-shadow: 0 8px 25px rgba(0,0,0,0.1); 
        }
        .img-entrada { 
            height: 200px; 
            background-size: cover; 
            background-position: center; 
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
        .page-link {
            color: var(--verde-paramo) !important;
            border-color: #dee2e6 !important;
            background-color: #FFFFFF !important;
        }
        .page-link:hover {
            background-color: #e9ecef !important;
            color: var(--terracota) !important;
        }
        /* Color de fondo Verde Páramo para la página activa */
        .active-cauca .page-link {
            background-color: var(--verde-paramo) !important;
            border-color: var(--verde-paramo) !important;
            color: #FFFFFF !important;
            font-weight: bold;
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

        <!-- GRILLA DINÁMICA DE TARJETAS -->
        <div class="row g-4" id="contenedor-blog">
            <div class="text-center text-muted py-5" id="cargador-spinner">
                <div class="spinner-border text-success" role="status"></div>
                <p class="mt-2">Conectando con la base de datos en la nube...</p>
            </div>
        </div>

        <!-- BARRA NUMÉRICA DE PAGINACIÓN -->
        <div class="d-flex justify-content-center mt-5">
            <nav aria-label="Navegación del blog">
                <ul class="pagination shadow-sm" id="control-paginas">
                    <!-- Los botones se inyectan aquí dinámicamente -->
                </ul>
            </nav>
        </div>

    </div>

    <!-- ⚡ MOTOR FRONTEND: CONSUMO REST, LOGICA MATRICIAL Y PAGINADO -->
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            const urlFirebase = "https://turismocauca-7a4ec-default-rtdb.firebaseio.com/blog.json";
            const contenedor = document.getElementById("contenedor-blog");
            const spinner = document.getElementById("cargador-spinner");
            const txtBuscar = document.getElementById("txtBuscarTitulo");
            const ddlCategoria = document.getElementById("ddlFiltrarCategoria");
            const alertaNoResultados = document.getElementById("alerta-no-resultados");
            const contenedorPaginacion = document.getElementById("control-paginas");

            // Configuración del Paginador
            const articulosPorPagina = 3;
            let paginaActual = 1;
            let listadoCompletoArticulos = [];

            // Petición inicial a Firebase
            fetch(urlFirebase)
                .then(response => response.json())
                .then(data => {
                    spinner.style.display = "none";

                    if (!data || data === "null") {
                        contenedor.innerHTML = '<div class="col-12 text-center text-muted"><p>No se encontraron artículos publicados.</p></div>';
                        return;
                    }

                    // Convertimos el JSON estructurado en un Array plano analizando el subnodo 'articulo_1'
                    listadoCompletoArticulos = Object.keys(data).map(key => {
                        const art = data[key].articulo_1 || data[key];
                        return {
                            id: key,
                            titulo: art.Titulo || "Artículo sin título",
                            resumen: art.Resumen || "Sin descripción disponible.",
                            categoria: art.Categoria || "General",
                            autor: art.Autor || "Redacción",
                            fechaRaw: art.Fecha || new Date(),
                            urlImagen: art.UrlImagen && art.UrlImagen !== "https://unsplash.com" ? art.UrlImagen : "https://unsplash.com"
                        };
                    });

                    // Renderizado inicial
                    renderizarGrillaConPaginacion();

                    // Escuchadores de eventos para recalcular los índices al escribir o cambiar filtros
                    txtBuscar.addEventListener("input", function () { paginaActual = 1; renderizarGrillaConPaginacion(); });
                    ddlCategoria.addEventListener("change", function () { paginaActual = 1; renderizarGrillaConPaginacion(); });
                })
                .catch(error => {
                    console.error("Error Firebase:", error);
                    spinner.innerHTML = '<p class="text-danger">⚠️ Error al mapear la base de datos.</p>';
                });

            // Función combinada de Filtrado y Segmentación
            function renderizarGrillaConPaginacion() {
                const textoBusqueda = txtBuscar.value.toLowerCase().trim();
                const categoriaSeleccionada = ddlCategoria.value;

                // 1. Filtrado
                const articulosFiltrados = listadoCompletoArticulos.filter(articulo => {
                    const coincideTexto = articulo.titulo.toLowerCase().includes(textoBusqueda);
                    const coincideCategoria = (categoriaSeleccionada === "TODAS" || articulo.categoria === categoriaSeleccionada);
                    return coincideTexto && coincideCategoria;
                });

                // 2. Control si no hay resultados
                if (articulosFiltrados.length === 0) {
                    contenedor.innerHTML = "";
                    contenedorPaginacion.innerHTML = "";
                    alertaNoResultados.style.display = "block";
                    return;
                }
                alertaNoResultados.style.display = "none";

                // 3. Cálculos de Paginación
                const totalPaginas = Math.ceil(articulosFiltrados.length / articulosPorPagina);
                if (paginaActual > totalPaginas) paginaActual = totalPaginas;
                if (paginaActual < 1) paginaActual = 1;

                const indiceInicial = (paginaActual - 1) * articulosPorPagina;
                const indiceFinal = indiceInicial + articulosPorPagina;
                const articulosDeLaPagina = articulosFiltrados.slice(indiceInicial, indiceFinal);

                // 4. Construcción de Tarjetas de la Página Activa
                let htmlCards = "";
                articulosDeLaPagina.forEach(articulo => {
                    const fechaFormateada = new Date(articulo.fechaRaw).toLocaleDateString('es-ES', {
                        day: '2-digit', month: 'short', year: 'numeric'
                    });
                    // ⚡ CORRECCIÓN: Se envuelve el bloque HTML completo entre comillas invertidas para habilitar las variables ${}
                    htmlCards += `
    <div class="col-md-6 col-lg-4 animate-fade">
        <article class="tarjeta-entrada">
            <div class="img-entrada" style="background-image: url('${articulo.urlImagen}');"></div>
            <div class="p-4 d-flex flex-column flex-grow-1">
                <div>
                    <span class="categoria-badge">${articulo.categoria}</span>
                    <h4 class="fw-bold mb-2" style="color: var(--texto-oscuro);">${articulo.titulo}</h4>
                    <p class="text-muted small mb-3">📅 ${fechaFormateada} | Por: ${articulo.autor}</p>
                    <p class="text-secondary small" style="line-height: 1.6;">${articulo.resumen}</p>
                </div>
                <div class="mt-auto pt-3">
                    <a href="Articulo.aspx?id=${articulo.id}" class="text-cauca-terracota fw-bold text-decoration-none">Leer artículo completo →</a>
                </div>
            </div>
        </article>
    </div>
`;
                });
                contenedor.innerHTML = htmlCards;
                // 5. Renderizar Botones Numéricos
                construirBotonesNavegacion(totalPaginas);
            }
            // Dibuja los componentes numéricos abajo
            function construirBotonesNavegacion(totalPaginas) {
                if (totalPaginas <= 1) {
                    contenedorPaginacion.innerHTML = "";
                    return;
                }
                let htmlPaginador = "";
                for (let i = 1; i <= totalPaginas; i++) {
                    const claseActiva = (i === paginaActual) ? 'active-cauca' : '';
                    // ⚡ CORRECCIÓN: Se añaden las comillas invertidas al inicio y al final de la cadena HTML
                    htmlPaginador += `
    <li class="page-item ${claseActiva}">
        <button class="page-link btn-paginacion" data-pagina="${i}">${i}</button>
    </li>
`;
                }
                contenedorPaginacion.innerHTML = htmlPaginador;
                // Asignar clics asíncronos a la botonera
                document.querySelectorAll(".btn-paginacion").forEach(boton => {
                    boton.addEventListener("click", function (e) {
                        e.preventDefault();
                        paginaActual = parseInt(this.getAttribute("data-pagina"));
                        renderizarGrillaConPaginacion();
                        // Scroll suave de retorno al buscador
                        window.scrollTo({
                            top: document.getElementById("txtBuscarTitulo").getBoundingClientRect().top + window.pageYOffset - 120,
                            behavior: 'smooth'
                        });
                    });
                });
            }
        });
</script>
</asp:Content>