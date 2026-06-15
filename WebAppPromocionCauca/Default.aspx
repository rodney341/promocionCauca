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


<section id="reconocimientos" class="tipos-reconocimiento py-5 animar-entrada">
    <div class="container">

        <!-- Cabecera Animada -->
        <div class="text-center mb-5 ">
            <h2 class="titulo-reconocimientos">El Cauca ante el mundo</h2>
            <p class="descripcion-reconocimientos">
                Organismos internacionales han reconocido el patrimonio
                cultural, arqueológico, gastronómico y natural del departamento.
            </p>
        </div>

        <div class="row g-4">
            <!-- Tarjeta 1 -->
            <div class="col-lg-6 ">
                <div class="tipo-card border-mundial">
                    <div class="tipo-icono icono-mundial">🏛️</div>
                    <h3>Patrimonio Mundial UNESCO</h3>
                    <ul>
                        <li>Parque Arqueológico Nacional de Tierradentro</li>
                    </ul>
                </div>
            </div>

            <!-- Tarjeta 2 -->
            <div class="col-lg-6 ">
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
            <div class="col-lg-6 ">
                <div class="tipo-card destacado border-creativa">
                    <div class="tipo-icono icono-creativa">🍽️</div>
                    <h3>Red de Ciudades Creativas UNESCO</h3>
                    <ul>
                        <li>Popayán - Ciudad Creativa de la Gastronomía</li>
                    </ul>
                </div>
            </div>

            <!-- Tarjeta 4 -->
            <div class="col-lg-6 ">
                <div class="tipo-card border-biosfera">
                    <div class="tipo-icono icono-biosfera">🌿</div>
                    <h3>Reservas de la Biosfera UNESCO</h3>
                    <ul>
                        <li>Macizo Colombiano - Cinturón Andino</li>
                    </ul>
                </div>
            </div>

            <!-- Tarjeta 5 (Ancho completo) -->
            <div class="col-lg-12 ">
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


<section id="mapaDesktop" class="mapa-reconocimientos-section animar-entrada">
    <div class="container">

        <!-- Contenedor del Mapa Interactivo de Ancho Completo -->
        <div class="mapa-wrapper ">
            <div id="map">
                <div id="map-loader" class="map-loader-overlay">
                    <div class="spinner"></div>
                    <p class="mb-0 mt-3 text-muted fw-bold">Cargando mapa del Cauca y rutas...</p>
                </div>
            </div>
        </div>

    </div>
</section>
    <div id="mensajeMovil" style="display:none;">
    <p>🗺️ El mapa interactivo está disponible en tabletas y computadores para una mejor experiencia.</p>
</div>


<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>

<script>
    const esMovil =
        window.innerWidth <= 768 ||
        /Android|iPhone|iPad|iPod/i.test(navigator.userAgent);
    if (esMovil) {
        document.getElementById("mapaDesktop").style.display = "none";
        document.getElementById("mensajeMovil").style.display = "block";
    } else {
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

    // ==================================================================

    document.getElementById('map-loader').classList.remove('map-loader-hidden');

    fetch('Default.aspx/ObtenerDatosJson', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=utf-8',
            'Accept': 'application/json'
        }
    }).then(res => res.json())
        .then(data => {

            const datosServidor = JSON.parse(data.d);

            if (datosServidor.error) {
                console.error("❌ Error reportado por el servidor C#:", datosServidor.error);
                alert("Error del servidor: " + datosServidor.error);
                return;
            }
            const dataRegiones = datosServidor.regiones;
            const dataMapa = datosServidor.cauca;
            const dataAledanos = datosServidor.limites;

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

            // CAPA DE DEPARTAMENTOS VECINOS
            var vecinosLayer = L.geoJSON(dataAledanos, {
                pane: 'vecinosPane',
                style: {
                    color: "#555",
                    weight: 1,
                    fillColor: "#dcdcdc",
                    fillOpacity: 0.9,
                },
            }).addTo(map);

            // POLÍGONO DEL OCÉANO PACÍFICO
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

            const textoOceanoIcon = L.divIcon({
                html: '<div class="mapa-texto-maritimo">OCÉANO PACÍFICO</div>',
                className: 'custom-ocean-label',
                iconSize: [200, 30]
            });

            L.marker([2.50, -79.20], {
                icon: textoOceanoIcon,
                pane: 'oceanoPane', 
                interactive: false
            }).addTo(map);
            // =================================================

            // POLÍGONO DE LA TIERRA CONTINENTAL
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

            departamentosVecinos.forEach(dept => {
                const labelIcon = L.divIcon({
                    html: `<div class="mapa-texto-continental">${dept.nombre}</div>`,
                    className: 'custom-land-label',
                    iconSize: 2
            });

                L.marker(dept.coor, {
                    icon: labelIcon,
                    pane: 'patrimonioPane', 
                    interactive: false
                }).addTo(map);
            });


            // =======================
            // LEYENDAS
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

            const puntosPatrimonio = [
                {
                    nombre: "Popayán",
                    tituloLeyenda: "Patrimonio Cultural Inmaterial",
                    coor: [2.4448, -76.6147],
                    emoji: "✨",
                    zoom: 12,
                    desc: "Sede de las Procesiones de Semana Santa de Popayán, declaradas Patrimonio de la Humanidad."
                },
                {
                    nombre: "Popayán",
                    tituloLeyenda: "Ciudades Creativas (Gastronomía)",
                    coor: [2.5, -76.69],
                    emoji: "🍽️",
                    zoom: 12,
                    desc: "Primera ciudad de Latinoamérica declarada Ciudad Creativa de la Gastronomía por la UNESCO."
                },
                {
                    nombre: "Parque Arqueológico nacional de Tierradentro",
                    tituloLeyenda: "Parque Arqueológico nacional de Tierradentro",
                    coor: [2.5828, -76.0414],
                    emoji: "🏛️",
                    zoom: 11,
                    desc: "Inscrito en la lista de Patrimonio Mundial material de la UNESCO (Inzá)."
                },
                {
                    nombre: "Macizo Colombiano",
                    tituloLeyenda: "Masizo Colombiano Reservas de la Biosfera Mundial",
                    coor: [1.9167, -76.5833],
                    emoji: "🌿",
                    zoom: 10,
                    desc: "Reserva de la Biósfera Mundial."
                },
                {
                    nombre: "Costa Pacífica",
                    tituloLeyenda: "Música de marimba, cantos y bailes tradicionales de la región colombiana del Pacífico Sur",
                    coor: [2.5694, -77.8856],
                    emoji: "🌊",
                    zoom: 10,
                    desc: "Música de marimba, cantos y bailes tradicionales de la región colombiana del Pacífico Sur e integración al Museo Vivo del Agua."
                }
            ];

            const mapaMarcadores = {};

            puntosPatrimonio.forEach((punto, index) => {

                const llaveCoordenada = `${punto.coor[0]},${punto.coor[1]}`;

                if (!mapaMarcadores[llaveCoordenada]) {
                    const customIcon = L.divIcon({
                        html: `<div style="font-size: 28px; text-shadow: 0 2px 6px rgba(0,0,0,0.4); display: flex; justify-content: center; align-items: center; cursor: pointer;">${punto.emoji}</div>`,
                        className: 'custom-marker-icon'
                    });

                    const marker = L.marker(punto.coor, {
                        icon: customIcon,
                        pane: 'patrimonioPane'
                    }).addTo(map);

                    let descripcionPopup = `
                           <div style="font-family: system-ui, sans-serif; padding: 2px; min-width: 200px;">
                               <h5 style="margin: 0 0 6px 0; font-size: 14px; font-weight: 700; color: #1a1d20;">${punto.nombre}</h5>
                               <p style="margin: 0; font-size: 12px; color: #5f666d; line-height: 1.4;">${punto.desc}</p>
                           </div>
                       `;

                    marker.bindPopup(descripcionPopup);
                    mapaMarcadores[llaveCoordenada] = marker;
                } else {
                    const markerExistente = mapaMarcadores[llaveCoordenada];
                    const popupContenidoAnterior = markerExistente.getPopup().getContent();

                    markerExistente.setPopupContent(
                        popupContenidoAnterior + `
                       <div style="font-family: system-ui, sans-serif; padding: 2px; min-width: 200px; border-top: 1px dashed #dee2e6; margin-top: 8px; padding-top: 8px;">
                           <p style="margin: 0; font-size: 12px; color: #5f666d; line-height: 1.4;">${punto.desc}</p>
                       </div>`
                            );
                        }
                mapaMarcadores[`index_${index}`] = mapaMarcadores[llaveCoordenada];
            });

            const leyenda = L.control({ position: 'bottomright' });

            leyenda.onAdd = function (map) {
                const div = L.DomUtil.create('div', 'info leyenda');

                let htmlContenido = `<h4>Reconocimientos UNESCO 🏛️</h4>`;

                puntosPatrimonio.forEach((punto, index) => {
                    htmlContenido += `
                       <div class="leyenda-item-btn" data-index="index_${index}" data-lat="${punto.coor[0]}" data-lng="${punto.coor[1]}" data-zoom="${punto.zoom}">
                           <span class="leyenda-emoji">${punto.emoji}</span>
                           <span class="leyenda-texto">${punto.tituloLeyenda}</span>
                       </div>
                   `;
                });

                div.innerHTML = htmlContenido;
                L.DomEvent.disableClickPropagation(div);
                L.DomEvent.disableScrollPropagation(div);

                setTimeout(() => {
                    const botonesLeyenda = div.querySelectorAll('.leyenda-item-btn');
                    botonesLeyenda.forEach(btn => {
                        btn.addEventListener('click', () => {
                            const lat = parseFloat(btn.getAttribute('data-lat'));
                            const lng = parseFloat(btn.getAttribute('data-lng'));
                            const zoom = parseInt(btn.getAttribute('data-zoom'));
                            const indexAsociado = btn.getAttribute('data-index');

                            if (!isNaN(lat) && !isNaN(lng)) {
                                map.flyTo([lat, lng], zoom, {
                                    animate: true,
                                    duration: 1.5
                                });

                                map.once('moveend', () => {
                                    if (mapaMarcadores[indexAsociado]) {
                                        mapaMarcadores[indexAsociado].openPopup();
                                    }
                                });
                            }
                        });
                    });
                }, 100);

                return div;
            };

            leyenda.addTo(map);

            const caucaBounds = L.latLngBounds(
                [0.7, -80.0], // SW
                [3.8, -74.0]); // NE
            console.log("bonund:", caucaBounds);

            map.setMaxBounds(caucaBounds);

            document.getElementById('map-loader').classList.add('map-loader-hidden');
        })
        .catch(err => {
            console.error("Error cargando los archivos:", err);
            document.getElementById('map-loader').innerHTML = `
           <p style="color: #e74c3c; font-weight: bold;">🚨 Error al cargar el mapa. Revisa la consola.</p>
         `;
        });

    }

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
            root: null, 
            rootMargin: "0px",
            threshold: 0.15 
        };

        const observador = new IntersectionObserver((entradas, observador) => {
            entradas.forEach((entrada, indice) => {
                if (entrada.isIntersecting) {
                    setTimeout(() => {
                        entrada.target.classList.add("visible");
                    }, indice * 80);
                    observador.unobserve(entrada.target);
                }
            });
        }, opciones);

        elementos.forEach(elemento => observador.observe(elemento));

    });
</script>

</asp:Content>
