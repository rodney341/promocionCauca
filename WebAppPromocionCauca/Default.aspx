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
</style>
<link href="/estilos/StyleSheetHero.css" rel="stylesheet" />
<link href="/estilos/StyleSheetSubregiones.css" rel="stylesheet" />
<link href="/estilos/StyleSheetReconocimientos.css" rel="stylesheet" />
<link href="/estilos/StyleSheetMapa.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="BodyContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <!-- HERO -->
    <section class="hero-slider">

        <div class="slide active"
            style="background-image: linear-gradient(
         135deg,
         rgba(0,0,0,0.55),
         rgba(16,74,44,0.45)),
         url('/images/Macizo-AdrianaCollazos.jpg')">

            <div class="hero-content">

                <h1>Descubre el Cauca</h1>

                <p>
                    Un destino diverso y sostenible
                </p>

            </div>

        </div>

        <div class="slide"
            style="background-image: linear-gradient(
         135deg,
         rgba(0,0,0,0.55),
         rgba(16,74,44,0.45)),
         url('/images/EL_ORIGEN_PERVIVENCIA_NASA.jpg')">

            <div class="hero-content">

                <h1>Un refugio de paz </h1>

                <p>
                    Crece entre montañas majestuosas y ríos de vida
                </p>

            </div>

        </div>

        <div class="slide"
            style="background-image: linear-gradient(
         135deg,
         rgba(0,0,0,0.55),
         rgba(16,74,44,0.45)),
         url('/images/Colibri-AdrianaCollazos.jpg')">

            <div class="hero-content">

                <h1>Donde las aves cantan  </h1>

                <p>
                    Se pinta el cielo de colores y florece la paz
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

  <section id="subregiones" class="container py-5">

    <div class="text-center mb-5">
        <h2 class="fw-bold" style="color:var(--verde-paramo);">
            Subregiones Turísticas del Cauca
        </h2>

        <p class="text-muted">
            Descubre la diversidad cultural, natural y patrimonial de cada territorio.
        </p>
    </div>

    <div class="row g-4 justify-content-center">

        <asp:Repeater ID="rptSubregiones" runat="server">

            <ItemTemplate>

                <div class="col-xl-3 col-lg-3 col-md-4" >

                    <div class="card subregion-card h-100">
                        <a href='/Subregion.aspx?id=<%# Eval("slug") %>'>
                        <img src='<%# Eval("imagenPrincipal") %>'
                             alt='<%# Eval("nombre") %>'
                             class="card-img-top" />
                               </a>
                        <div class="card-body">

                            <h4 class="card-title">
                            <a href='/Subregion.aspx?id=<%# Eval("slug") %>'
                               class="titulo-subregion">
                                <%# Eval("nombre") %>
                             </a>
                            </h4>

                            <p class="card-text">
                                <%# Eval("descripcion") %>
                            </p>

                            <a href='/Subregion.aspx?id=<%# Eval("slug") %>'
                               class="btn btn-cauca-principal">

                                Explorar

                            </a>

                        </div>

                    </div>

                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

</section>


<section class="tipos-reconocimiento py-5">
    <div class="container">

        <!-- Cabecera Animada -->
        <div class="text-center mb-5 animar-entrada">
            <h2 class="titulo-reconocimientos">El Cauca ante el mundo</h2>
            <p class="descripcion-reconocimientos">
                Organismos internacionales han reconocido el patrimonio
                cultural, arqueológico, gastronómico y natural del departamento.
            </p>
        </div>

        <div class="row g-4">
            <!-- Tarjeta 1 -->
            <div class="col-lg-6 animar-entrada">
                <div class="tipo-card border-mundial">
                    <div class="tipo-icono icono-mundial">🏛️</div>
                    <h3>Patrimonio Mundial UNESCO</h3>
                    <ul>
                        <li>Parque Arqueológico Nacional de Tierradentro</li>
                    </ul>
                </div>
            </div>

            <!-- Tarjeta 2 -->
            <div class="col-lg-6 animar-entrada">
                <div class="tipo-card border-inmaterial">
                    <div class="tipo-icono icono-inmaterial">✨</div>
                    <h3>Patrimonio Cultural Inmaterial</h3>
                    <ul>
                        <li>Procesiones de Semana Santa de Popayán</li>
                        <li>Música de Marimba y Cantos Tradicionales del Pacífico Sur</li>
                    </ul>
                </div>
            </div>

            <!-- Tarjeta 3 -->
            <div class="col-lg-6 animar-entrada">
                <div class="tipo-card destacado border-creativa">
                    <div class="tipo-icono icono-creativa">🍽️</div>
                    <h3>Red de Ciudades Creativas UNESCO</h3>
                    <ul>
                        <li>Popayán - Ciudad Creativa de la Gastronomía</li>
                    </ul>
                </div>
            </div>

            <!-- Tarjeta 4 -->
            <div class="col-lg-6 animar-entrada">
                <div class="tipo-card border-biosfera">
                    <div class="tipo-icono icono-biosfera">🌿</div>
                    <h3>Reservas de la Biosfera UNESCO</h3>
                    <ul>
                        <li>Macizo Colombiano - Cinturón Andino</li>
                    </ul>
                </div>
            </div>

            <!-- Tarjeta 5 (Ancho completo) -->
            <div class="col-lg-12 animar-entrada">
                <div class="tipo-card horizontal border-agua">
                    <div class="tipo-icono icono-agua">💧</div>
                    <div class="flex-grow-1">
                        <h3>Red Global de Museos del Agua</h3>
                        <ul>
                            <li>Museo Vivo del Agua y la Biodiversidad en el Macizo Colombiano</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>


<section class="mapa-reconocimientos-section py-5">
    <div class="container">

        <div class="text-center mb-5 animar-entrada">
            <h2 class="titulo-reconocimientos">El Cauca en el Mapa</h2>
            <p class="descripcion-reconocimientos">
                Explora los epicentros geográficos y culturales que albergan las máximas distinciones internacionales del departamento.
            </p>
        </div>

        <!-- Contenedor del Mapa Interactivo de Ancho Completo -->
        <div class="mapa-wrapper animar-entrada">
            <div id="map">
                <div id="map-loader" class="map-loader-overlay">
                    <div class="spinner"></div>
                    <p class="mb-0 mt-3 text-muted fw-bold">Cargando mapa del Cauca y rutas...</p>
                </div>
            </div>
        </div>

    </div>
</section>


<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>

<script>
    const centroCauca = [2.35, -76.80];
    const zoomInicial = 8;
    const map = L.map('map', {
        minZoom: zoomInicial,
        maxZoom: 15,
        renderer: L.canvas(),
        maxBoundsViscosity: 1.0,
        tap: true,
        tapTolerance: 15,
        keyboard: true,
        zoomControl: true,
        attributionControl: false,
        worldCopyJump: false,
        scrollWheelZoom: false 
    }).setView(centroCauca, zoomInicial);

    var etiquetasVecinos = L.layerGroup();

    // =======================
    // CONTROL ZOOM (labels)
    // =======================
    map.on('zoomend', function () {
        const container = map.getContainer();

        if (map.getZoom() < 9) {
            L.DomUtil.addClass(container, 'labels-hidden');
        } else {
            L.DomUtil.removeClass(container, 'labels-hidden');
        }

    });

    if (map.getZoom() < 9) {
        L.DomUtil.addClass(map.getContainer(), 'labels-hidden');
    }
    // =======================
    // UTILIDADES
    // =======================

    const municipioRegion = {};
    const regionesLayers = {};
    const cacheMunicipios = {};
    let cargando = false;
    let regionActivaAnterior = null;

    function normalizar(texto) {
        return texto
            .trim()
            .toLowerCase()
            .normalize("NFD")
            .replace(/[\u0300-\u036f]/g, "");
    }

    function asignarRegion(municipio) {
        return municipioRegion[normalizar(municipio)] || "sin_region";
    }

    function getRegionColor(region) {

        return {

            norte: "#f1c40f",
            centro: "#3498db",
            sur: "#e67e22",
            pacifico: "#8e5c2c",
            oriente: "#2ecc71",
            macizo: "#27ae60",
            amazonico: "#82e0aa"

        }[region] || "#bdc3c7";
    }

    function getColor(municipio) {

        const region = asignarRegion(municipio);

        return getRegionColor(region);
    }

    function aclararColor(hex, porcentaje = 25) {

        hex = hex.replace('#', '');

        let r = parseInt(hex.substring(0, 2), 16);
        let g = parseInt(hex.substring(2, 4), 16);
        let b = parseInt(hex.substring(4, 6), 16);

        r = Math.min(255, Math.floor(r + (255 - r) * (porcentaje / 100)));
        g = Math.min(255, Math.floor(g + (255 - g) * (porcentaje / 100)));
        b = Math.min(255, Math.floor(b + (255 - b) * (porcentaje / 100)));

        return `rgb(${r}, ${g}, ${b})`;
    }
    const nombresRegiones = {

        norte: "Norte",
        centro: "Centro",
        sur: "Sur",
        pacifico: "Pacífico",
        oriente: "Oriente",
        macizo: "Macizo",
        amazonico: "Piedemonte amazónico"
    };

    // =======================
    // ZOOM A REGIÓN
    // =======================

    function zoomToRegion(id) {
        const capasRegion = [];

        caucaLayer.eachLayer(function (layer) {
            if (layer.regionId === id) {
                capasRegion.push(layer);
                layer.setStyle({ weight: 4, color: '#333', fillOpacity: 0.9 });
            }
        });

        if (capasRegion.length > 0) {

            const featureGroup = L.featureGroup(capasRegion);
            map.fitBounds(featureGroup.getBounds(), {
                padding: [30, 30],
                animate: true,
                duration: 0.8
            });

            setTimeout(() => {
                capasRegion.forEach(l => caucaLayer.resetStyle(l));
            }, 2000);
        }
    }
    function escapeHTML(text = "") {
        return String(text)
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;");
    }

    // =======================
    // LEYENDA
    // =======================

    var legend = L.control({ position: 'bottomleft' });

    legend.onAdd = function () {

        var div = L.DomUtil.create('div', 'info leyenda');

        div.innerHTML = "<h4>Subregiones</h4>";

        Object.entries(nombresRegiones).forEach(([key, nombre]) => {

            div.innerHTML += `
            <div onclick="zoomToRegion('${key}')" class="leyenda-item-btn">
             <span class="subregion-color" style="background:${getRegionColor(key)};"></span>
             <span class="leyenda-texto">${nombre}</span>

            </div>`;
        });

        return div;
    };

    legend.addTo(map);

    // ================= AGREGAR LEYENDA DEL PATRIMONIO INTERACTIVA =================
    const leyenda = L.control({ position: 'bottomright' });

    leyenda.onAdd = function (map) {
        const div = L.DomUtil.create('div', 'info leyenda');

        // Estructura HTML con coordenadas específicas para cada tipo de patrimonio
        div.innerHTML = `
                <h4>Reconocimiento UNESCO 🏛️</h4>
                <div class="leyenda-item-btn" data-lat="2.5828" data-lng="-76.0414" data-zoom="11">
                    <span class="leyenda-emoji">🏛️</span>
                    <span class="leyenda-texto">Patrimonio Mundial Material</span>
                </div>
                <div class="leyenda-item-btn" data-lat="2.4448" data-lng="-76.6147" data-zoom="12">
                    <span class="leyenda-emoji">✨</span>
                    <span class="leyenda-texto">Patrimonio Inmaterial</span>
                </div>
                <div class="leyenda-item-btn" data-lat="2.4448" data-lng="-76.6147" data-zoom="12">
                    <span class="leyenda-emoji">🍽️</span>
                    <span class="leyenda-texto">Ciudades Creativas (Gastronomía)</span>
                </div>
                <div class="leyenda-item-btn" data-lat="1.9167" data-lng="-76.5833" data-zoom="10">
                    <span class="leyenda-emoji">🌿</span>
                    <span class="leyenda-texto">Reservas de la Biosfera</span>
                </div>
                <div class="leyenda-item-btn" data-lat="2.1500" data-lng="-77.1000" data-zoom="9">
                    <span class="leyenda-emoji">🌊</span> / <span class="leyenda-emoji">💧</span>
                    <span class="leyenda-texto">Cultura y Museos del Agua</span>
                </div>
            `;

        // Evitar que el mapa se mueva o haga zoom al interactuar con el contenedor de la leyenda
        L.DomEvent.disableClickPropagation(div);
        L.DomEvent.disableScrollPropagation(div);

        // Añadir el evento de clic a cada fila de la leyenda
        setTimeout(() => {
            const botonesLeyenda = div.querySelectorAll('.leyenda-item-btn');
            botonesLeyenda.forEach(btn => {
                btn.addEventListener('click', () => {
                    const lat = parseFloat(btn.getAttribute('data-lat'));
                    const lng = parseFloat(btn.getAttribute('data-lng'));
                    const zoom = parseInt(btn.getAttribute('data-zoom'));

                    if (!isNaN(lat) && !isNaN(lng)) {
                        // Viajar suavemente a la zona de interés patrimonial
                        map.flyTo([lat, lng], zoom, {
                            animate: true,
                            duration: 1.5
                        });
                    }
                });
            });
        }, 100);

        return div;
    };

    leyenda.addTo(map);
    // ==================================================================




    document.getElementById('map-loader').classList.remove('map-loader-hidden');

    Promise.all([
        fetch('/jsonFiles/regiones.json').then(res => res.json()),
        fetch('/jsonFiles/cauca.json').then(res => res.json()),
        fetch('/jsonFiles/limites_aledanos.json').then(res => res.json()),
    ])
        .then(([dataRegiones, dataMapa, dataAledanos]) => {

            // 1. CONFIGURACIÓN DE PANES (Z-INDEX ESTRICTO)
            map.createPane('oceanoPane');
            map.getPane('oceanoPane').style.zIndex = 390; // Fondo absoluto

            map.createPane('vecinosPane');
            map.getPane('vecinosPane').style.zIndex = 395; // Continente de fondo

            map.createPane('caucaPane');
            map.getPane('caucaPane').style.zIndex = 400;  // Capa de municipios

            map.createPane('patrimonioPane');
            map.getPane('patrimonioPane').style.zIndex = 600; // Al frente de todo (encima de tooltips)

            // Mapear regiones
            Object.entries(dataRegiones.regiones).forEach(([region, municipios]) => {
                municipios.forEach(m => {
                    municipioRegion[normalizar(m)] = region;
                });
            });

            // 2. CREAR MAPA PRINCIPAL (CAUCA)
            caucaLayer = L.geoJSON(dataMapa, {
                pane: 'caucaPane',
                style: (feature) => ({
                    color: "#ffffff",
                    weight: 1.5,
                    fillColor: getColor(feature.properties.MpNombre),
                    fillOpacity: 0.7
                }),
                onEachFeature: function (feature, layer) {
                    layer.regionId = asignarRegion(feature.properties.MpNombre);

                    if (!regionesLayers[layer.regionId]) {
                        regionesLayers[layer.regionId] = [];
                    }
                    regionesLayers[layer.regionId].push(layer);

                    // Tooltips / Labels de municipios
                    layer.bindTooltip(
                        `<div class="tooltip-municipio">
                        <strong>${feature.properties.MpNombre}</strong>
                     </div>`,
                        {
                            permanent: true,
                            direction: "center",
                            className: "label-municipio"
                        }
                    );

                    // Eventos de interacción (Mouseover / Mouseout)
                    layer.on({
                        mouseover: function (e) {
                            const layerHover = e.target;
                            const regionActiva = layerHover.regionId;

                            if (regionActivaAnterior === regionActiva) return;
                            regionActivaAnterior = regionActiva;

                            caucaLayer.eachLayer(l => {
                                l.setStyle({
                                    fillOpacity: 0.2,
                                    opacity: 0.4,
                                    weight: 1,
                                    color: "#ffffff"
                                });
                            });

                            regionesLayers[regionActiva].forEach(l => {
                                l.setStyle({
                                    fillOpacity: 0.8,
                                    opacity: 1,
                                    weight: 2,
                                    color: "#222"
                                });
                            });

                            const colorOriginal = getColor(layerHover.feature.properties.MpNombre);
                            layerHover.setStyle({
                                fillColor: aclararColor(colorOriginal, 50),
                                fillOpacity: 1,
                                opacity: 1,
                                weight: 3,
                                color: "#111"
                            });

                            layerHover.bringToFront();
                            if (typeof grupoVia !== 'undefined' && grupoVia.eachLayer) {
                                grupoVia.eachLayer(l => l.bringToFront());
                            }
                        },
                        mouseout: function () {
                            regionActivaAnterior = null;
                            caucaLayer.eachLayer(l => {
                                l.setStyle({
                                    fillColor: getColor(l.feature.properties.MpNombre),
                                    fillOpacity: 0.7,
                                    opacity: 1,
                                    weight: 1.5,
                                    color: "#ffffff"
                                });
                            });
                        }
                    });
                }
            }).addTo(map);

            // 3. CAPA DE DEPARTAMENTOS VECINOS (Sin bordes)
            var vecinosLayer = L.geoJSON(dataAledanos, {
                pane: 'vecinosPane',
                style: {
                    color: "#555",
                    weight: 1,
                    fillColor: "#dcdcdc",
                    fillOpacity: 0.9,
                },
            }).addTo(map);

            // 4. POLÍGONO DEL OCÉANO PACÍFICO (Izquierda, Sin bordes)
            const coordenadasOceano = [
                [4.00, -84.00], [4.00, -72.35], [2.61, -77.91], [1.40, -78.80], [1.00, -84.00]
            ];
            L.polygon(coordenadasOceano, {
                pane: 'oceanoPane',
                stroke: false,
                fillColor: '#b3d1ff',
                fillOpacity: 0.65,
                interactive: false
            }).addTo(map);

            // NUEVO: Letrero flotante del Océano Pacífico alineado al flanco izquierdo
            const textoOceanoIcon = L.divIcon({
                html: '<div class="mapa-texto-maritimo">OCÉANO PACÍFICO</div>',
                className: 'custom-ocean-label',
                iconSize: [200, 30]
            });

            // Coordenada marítima estratégica alejada de la costa para no tapar los municipios
            L.marker([2.50, -79.20], {
                icon: textoOceanoIcon,
                pane: 'oceanoPane', // Mantiene las letras debajo de capas superiores interactivos
                interactive: false
            }).addTo(map);
            // =================================================

            // 5. POLÍGONO DE LA TIERRA CONTINENTAL (Derecha, Sin bordes)
            const coordenadasTierraMasa = [
                [3.80, -76.35], [3.80, -72.00], [0.70, -72.00], [0.70, -78.80], [1.40, -78.80], [2.61, -77.91], [3.80, -76.35]
            ];
            L.polygon(coordenadasTierraMasa, {
                pane: 'vecinosPane',
                stroke: false,
                fillColor: '#dcdcdc',
                fillOpacity: 1,
                interactive: false
            }).addTo(map);
            // CONFIGURACIÓN DE ETIQUETAS CONTINENTALES FRONTERIZAS
            const departamentosVecinos = [
                { nombre: "HUILA", coor: [2.2, -76.1] },
                { nombre: "VALLE DEL CAUCA", coor: [3.5, -77.0] },
                { nombre: "NARIÑO", coor: [1.6, -78.0] },
                { nombre: "TOLIMA", coor: [3.2, -75.8] },
                { nombre: "PUTUMAYO", coor: [0.9, -76.60] },
                { nombre: "CAQUETÁ", coor: [1.30, -76.1] }
            ];

            // Crear e inyectar cada etiqueta de manera automática
            departamentosVecinos.forEach(dept => {
                const labelIcon = L.divIcon({
                    html: `<div class="mapa-texto-continental">${dept.nombre}</div>`,
                    className: 'custom-land-label',
                    iconSize: 2
            });

                L.marker(dept.coor, {
                    icon: labelIcon,
                    pane: 'patrimonioPane', // Forzado al fondo por debajo del Cauca
                    interactive: false
                }).addTo(map);
            });
            // ================= AGREGAR PUNTOS PATRIMONIO (MARCADORES AL FRENTE) =================
            const puntosPatrimonio = [
                {
                    nombre: "Popayán",
                    coor: [2.4448, -76.6147],
                    emoji: "🍽️",
                    desc: "Ciudad Creativa de la Gastronomía y sede de las Procesiones de Semana Santa de Popayán."
                },
                {
                    nombre: "Parque Arqueológico de Tierradentro",
                    coor: [2.5828, -76.0414],
                    emoji: "🏛️",
                    desc: "Inscrito en la lista de Patrimonio Mundial material de la UNESCO (Inzá)."
                },
                {
                    nombre: "Macizo Colombiano",
                    coor: [1.9167, -76.5833],
                    emoji: "🌿",
                    desc: "Reserva de la Biósfera de la UNESCO y hogar del Museo Vivo del Agua."
                },
                {
                    nombre: "Costa Pacífica Caucana (Guapi)",
                    coor: [2.5694, -77.8856],
                    emoji: "🌊",
                    desc: "Epicentro cultural de las Músicas de Marimba y Cantos Tradicionales del Pacífico."
                }
            ];

            puntosPatrimonio.forEach(punto => {
                const customIcon = L.divIcon({
                    html: `<div style="font-size: 28px; text-shadow: 0 2px 6px rgba(0,0,0,0.4); display: flex; justify-content: center; align-items: center; cursor: pointer;">${punto.emoji}</div>`,
                    className: 'custom-marker-icon'
                });

                // Se fuerza el marcador dentro de 'patrimonioPane' para asegurar que flote arriba
                const marker = L.marker(punto.coor, {
                    icon: customIcon,
                    pane: 'patrimonioPane'
                }).addTo(map);

                marker.bindPopup(`
                <div style="font-family: system-ui, sans-serif; padding: 2px; min-width: 200px;">
                    <h5 style="margin: 0 0 6px 0; font-size: 14px; font-weight: 700; color: #1a1d20;">${punto.nombre}</h5>
                    <p style="margin: 0; font-size: 12px; color: #5f666d; line-height: 1.4;">${punto.desc}</p>
                </div>
            `);
            });
            // ===================================================================================

            etiquetasVecinos.addTo(map);

            map.fitBounds(caucaLayer.getBounds());
            var northEast = L.latLng(3.5, -75);
            var southWest = L.latLng(0.6, -79);
            var bounds = L.latLngBounds(southWest, northEast);
            map.setMaxBounds(bounds);

            document.getElementById('map-loader').classList.add('map-loader-hidden');
        })
        .catch(err => {
            console.error("Error cargando los archivos:", err);
            document.getElementById('map-loader').innerHTML = `
           <p style="color: #e74c3c; font-weight: bold;">🚨 Error al cargar el mapa. Revisa la consola.</p>
         `;
        });



    document.addEventListener("DOMContentLoaded", function () {

        const slides = document.querySelectorAll(".slide");
        const dots = document.querySelectorAll(".dot");

        let actual = 0;

        function mostrarSlide(indice) {

            slides.forEach(slide =>
                slide.classList.remove("active")
            );

            dots.forEach(dot =>
                dot.classList.remove("active")
            );

            slides[indice].classList.add("active");
            dots[indice].classList.add("active");
        }

        setInterval(function () {

            actual++;

            if (actual >= slides.length) {
                actual = 0;
            }

            mostrarSlide(actual);

        }, 5000);

        dots.forEach((dot, indice) => {

            dot.addEventListener("click", function () {

                actual = indice;
                mostrarSlide(actual);

            });

        });


        const elementos = document.querySelectorAll(".animar-entrada");

        const opciones = {
            root: null, // Usa el viewport del navegador
            rootMargin: "0px",
            threshold: 0.15 // Se activa cuando el 15% del elemento es visible
        };

        const observador = new IntersectionObserver((entradas, observador) => {
            entradas.forEach((entrada, indice) => {
                if (entrada.isIntersecting) {
                    // Añadimos un pequeño retraso secuencial (efecto cascada) si aparecen varios a la vez
                    setTimeout(() => {
                        entrada.target.classList.add("visible");
                    }, indice * 80);

                    // Dejamos de observar el elemento una vez animado
                    observador.unobserve(entrada.target);
                }
            });
        }, opciones);

        elementos.forEach(elemento => observador.observe(elemento));


        /**mapa---------------------------*************** */


    });
</script>

</asp:Content>
