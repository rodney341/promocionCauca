<%@ Page Title="Subregión del Cauca" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Subregion.aspx.cs" Inherits="WebAppPromocionCauca.DetalleSubregion" %>

<%-- 1. CONTENEDOR DE ESTILOS INYECTADOS AL HEAD --%>
<asp:Content ID="ContentStylesSubregion" ContentPlaceHolderID="Stylesheets" runat="server">
    <style>
        .subregion-hero {
            height: 50vh;
            background-size: cover;
            background-position: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: #FFFFFF;
            position: relative;
            margin-top: -20px;
        }
        .subregion-hero::before {
            content: ''; position: absolute; top: 0; left: 0; width: 100%; height: 100%;
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.7)); z-index: 1;
        }
        .subregion-hero-contenido {
            position: relative; z-index: 2; max-width: 750px; padding: 0 1.5rem;
        }
        .tarjeta-cronica-local {
            background-color: #FFFFFF;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.04);
            transition: transform 0.3s, box-shadow 0.3s;
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        .tarjeta-cronica-local:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(45, 90, 39, 0.15);
        }
        .img-cronica-local { height: 220px; background-size: cover; background-position: center; }
    </style>
</asp:Content>

<%-- 2. CONTENEDOR PRINCIPAL DEL CUERPO --%>
<asp:Content ID="ContentBodySubregion" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- ENCABEZADO MULTIMEDIA DINÁMICO -->
    <div class="subregion-hero shadow-sm" id="sub-hero-bg">
        <div class="subregion-hero-contenido">
            <span class="badge bg-warning text-dark mb-2 px-3 py-2 text-uppercase fw-bold" style="letter-spacing: 1px;">Corredor Territorial</span>
            <h1 class="display-4 fw-bold text-white mb-3" id="sub-titulo-pantalla"></h1>
            <p class="fs-5 opacity-75 m-0" id="sub-descripcion-pantalla"></p>
        </div>
    </div>

    <div class="container my-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="fw-bold m-0" style="color: var(--verde-paramo);">Bitácoras y Experiencias de la Zona</h3>
<a runat="server"
   href="~/Default.aspx#subregiones"
   class="btn btn-cauca-principal rounded-pill px-4">
    ← Volver a Subregiones
</a>
        </div>
        <hr />

        <!-- Spinner de carga -->
        <div class="text-center py-5" id="spinner-sub-detalles">
            <div class="spinner-border text-success" role="status"></div>
            <p class="mt-2 text-muted small">Descargando bitácoras oficiales desde la nube...</p>
        </div>

        <!-- Alerta si la zona no tiene contenido aún -->
        <div class="alert alert-light text-center py-5 shadow-sm border border-warning" id="alerta-sin-datos" style="display: none; background-color: #FFFFFF;">
            <p class="mb-0 text-muted fs-5">🍂 Actualmente no hay crónicas ni operarios locales publicados para esta subregión.</p>
            <a href="AdminBlog.aspx" class="btn btn-sm btn-cauca-principal mt-3 text-white text-decoration-none">Sé el primero en aportar</a>
        </div>

        <!-- Grilla de contenidos específicos de la subregión -->
        <div class="row g-4" id="grilla-cronicas-subregion">
            <!-- Las tarjetas filtradas se inyectarán aquí dinámicamente -->
        </div>
    </div>

    <!-- ⚡ MOTOR FRONTEND REST: INTERCEPTA LA URL Y FILTRA LA NUBE -->
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            // 1. Extraer el nombre de la subregión de la URL (ej: ?region=Pacifico)
            const urlParams = new URLSearchParams(window.location.search);
            const subregionSeleccionada = urlParams.get('id') || "Centro";

            // Base de datos estática para la cabecera multimedia de las 7 subregiones
            const infoSubregiones = {
                "Centro": { desc: "El núcleo histórico y religioso del departamento. Explora las fachadas coloniales de Popayán, las tradiciones de Silvia y la fuerza andina del Puracé.", img: "https://unsplash.com" },
                "Norte": { desc: "Fusión cultural y desarrollo industrial. Conéctate con los violines de cauca y los deportes náuticos en la imponente Represa de Salvajina.", img: "https://unsplash.com" },
                "Sur": { desc: "Despensa cafetera y agrícola andina. Sorpréndete con los microclimas del cálido Valle del Patía y los miradores espectaculares de Balboa.", img: "https://unsplash.com" },
                "Oriente": { desc: "Epicentro místico y prehispánico. Desciende a los enigmáticos hipogeos subterráneos tallados en el Parque Arqueológico de Tierradentro.", img: "https://unsplash.com" },
                "Pacifico": { desc: "Selva húmeda tropical y folclor afrodescendiente. Escucha el cantar de las marimbas en Guapi y explora los corales marinos en la Isla Gorgona.", img: "https://unsplash.com" },
                "Macizo": { desc: "La estrella hídrica más grande de Colombia. Senderismo ecológico de alta montaña entre páramos y el nacimiento de nuestros grandes ríos.", img: "https://unsplash.com" },
                "Bota": { desc: "Santuario natural de transición amazónica en Piamonte. Destino virgen ideal para el avistamiento de aves exóticas y ríos cristalinos.", img: "https://unsplash.com" }
            };

            // 2. Pintar inmediatamente el Header con los datos correspondientes
            const infoZona = infoSubregiones[subregionSeleccionada] || infoSubregiones["Centro"];
            document.getElementById("sub-titulo-pantalla").innerText = `Subregión ${subregionSeleccionada}`;
            document.getElementById("sub-descripcion-pantalla").innerText = infoZona.desc;
            document.getElementById("sub-hero-bg").style.backgroundImage = `url('${infoZona.img}')`;

            // 3. Descargar y filtrar las crónicas correspondientes desde Firebase
            const urlFirebase = "https://turismocauca-7a4ec-default-rtdb.firebaseio.com/blog.json";
            const grilla = document.getElementById("grilla-cronicas-subregion");
            const spinner = document.getElementById("spinner-sub-detalles");
            const alertaSinDatos = document.getElementById("alerta-sin-datos");

            fetch(urlFirebase)
                .then(response => response.json())
                .then(data => {
                    spinner.style.display = "none";

                    if (!data || data === "null") {
                        alertaSinDatos.style.display = "block";
                        return;
                    }

                    let htmlTarjetas = "";
                    let contadorCoincidencias = 0;

                    Object.keys(data).reverse().forEach(key => {
                        const art = data[key].articulo_1 || data[key];
                        const subregionArticulo = art.Subregion || "Centro";

                        // ⚡ FILTRADO EXACTO: Evaluamos si pertenece a la subregión de la URL
                        if (subregionArticulo === subregionSeleccionada) {
                            contadorCoincidencias++;

                            const titulo = art.Titulo || "Sin Título";
                            const resumen = art.Resumen || "Sin descripción.";
                            const categoria = art.Categoria || "General";
                            const autor = art.Autor || "Redacción";
                            const imgUrl = art.UrlImagen && art.UrlImagen !== "https://unsplash.com" ? art.UrlImagen : infoZona.img;

                            htmlTarjetas += `
                                <div class="col-md-6 col-lg-4">
                                    <article class="tarjeta-cronica-local">
                                        <div class="img-cronica-local" style="background-image: url('${imgUrl}');"></div>
                                        <div class="p-4 d-flex flex-column flex-grow-1 justify-content-between">
                                            <div>
                                                <span class="badge mb-2" style="background-color: var(--verde-paramo);">${categoria}</span>
                                                <h4 class="fw-bold h5 mb-2" style="color: var(--texto-oscuro);">${titulo}</h4>
                                                <p class="text-muted small mb-3">Por: ${autor}</p>
                                                <p class="text-secondary small line-clamp" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden; line-height: 1.5;">${resumen}</p>
                                            </div>
                                            <div class="pt-3 mt-3 border-top">
                                                <a href="Articulo.aspx?id=${key}" class="text-cauca-terracota fw-bold text-decoration-none small">Conocer crónica completa →</a>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            `;
                        }
                    });

                    if (contadorCoincidencias === 0) {
                        alertaSinDatos.style.display = "block";
                    } else {
                        grilla.innerHTML = htmlTarjetas;
                    }
                })
                .catch(error => {
                    console.error("Error filtrando subregión:", error);
                    spinner.innerHTML = '⚠️ Error de comunicación con la base de datos.';
                });
        });
</script>
</asp:Content>