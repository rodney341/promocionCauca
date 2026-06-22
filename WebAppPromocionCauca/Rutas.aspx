<%@ Page Title="Rutas Turísticas del Cauca" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rutas.aspx.cs" Inherits="WebAppPromocionCauca.Rutas" %>

<asp:Content ID="ContentRutas" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        :root {
            --verde-paramo: #1E4620;
            --terracota: #C85A32;
            --beige-suave: #F9F6F0;
        }
        .hero-section {
            background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.5)), url('images/rutas/hero-panoramico.webp') center/cover no-repeat;
            min-height: 350px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .filter-btn.active {
            background-color: var(--verde-paramo) !important;
            color: #ffffff !important;
            border-color: var(--verde-paramo) !important;
        }
        #map {
            height: 500px;
            border-radius: 12px;
            z-index: 1;
        }
        .route-item {
            cursor: pointer;
            transition: all 0.2s ease;
        }
        .route-item:hover, .route-item.selected {
            border-left: 5px solid var(--terracota) !important;
            background-color: #f8f9fa;
        }
        .gallery-img {
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
            transition: transform 0.3s ease;
        }
        .gallery-img:hover {
            transform: scale(1.03);
        }
    </style>

    <!-- 1. HERO SECTION -->
    <div class="container my-5">
        <div class="text-center mb-5">
            <h1 class="fw-bold" style="color: var(--verde-paramo);">Circuitos y Rutas de Exploración</h1>
            <p class="text-muted fs-5">Planifica tu viaje a través de los corredores turísticos diseñados para vivir el departamento al máximo.</p>
            <div style="width: 80px; height: 3px; background-color: var(--terracota); margin: 0.5rem auto 0;"></div>
        </div>
    </div>

    <div class="container mb-5">
        <!-- 2. FILTROS -->
        <div class="row mb-4">
            <div class="col-12 text-center">
                <h5 class="text-muted mb-3 text-uppercase fw-bold small">Filtrar experiencias</h5>
                <div class="d-flex flex-wrap justify-content-center gap-2">
                    <button type="button" class="btn btn-outline-secondary filter-btn active" onclick="filterRoutes('all')">Todos</button>
                    <button type="button" class="btn btn-outline-secondary filter-btn" onclick="filterRoutes('naturaleza')">Naturaleza</button>
                    <button type="button" class="btn btn-outline-secondary filter-btn" onclick="filterRoutes('cultura')">Cultura</button>
                    <button type="button" class="btn btn-outline-secondary filter-btn" onclick="filterRoutes('gastronomia')">Gastronomía</button>
                    <button type="button" class="btn btn-outline-secondary filter-btn" onclick="filterRoutes('arqueologia')">Arqueología</button>
                    <button type="button" class="btn btn-outline-secondary filter-btn" onclick="filterRoutes('aventura')">Aventura</button>
                </div>
            </div>
        </div>

        <!-- 3. SECCIÓN PRINCIPAL: LISTADO Y MAPA -->
        <div class="row g-4 mb-5">
            <!-- Listado de Rutas -->
            <div class="col-lg-4">
                <div class="card border-0 shadow-sm p-3 h-100" style="max-height: 500px; overflow-y: auto;">
                    <h4 class="fw-bold mb-3" style="color: var(--verde-paramo);">Corredores</h4>
                    <div id="routes-list" class="d-flex flex-column gap-2">
                        <!-- Renderizado dinámico vía JavaScript -->
                    </div>
                </div>
            </div>
            <!-- Mapa Interactivo -->
            <div class="col-lg-8">
                <div class="card border-0 shadow-sm p-2 h-100">
                    <div id="map"></div>
                </div>
            </div>
        </div>

        <!-- 4. DETALLE DE LA RUTA SELECCIONADA -->
        <div id="route-detail-section" class="card border-0 shadow-sm p-4 mb-5" style="background-color: var(--beige-suave); display: none;">
            <!-- Renderizado dinámico del detalle -->
        </div>

        <!-- 5. GALERÍA -->
        <div class="card border-0 shadow-sm p-4">
            <h4 class="fw-bold mb-4" style="color: var(--verde-paramo);">Galería de Exploración</h4>
            <div class="row g-3" id="gallery-container">
                <!-- Fotos dinámicas según la ruta activa -->
            </div>
        </div>
    </div>

    <!-- Scripts de Leaflet y Control de Datos -->
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <script>
        let routesData = []; // Se llenará con los datos del servidor
        let map;
        let currentGeoJsonGroup = null; 
        let layerControl = null;

        document.addEventListener("DOMContentLoaded", () => {
            // Inicializar el mapa centrado en Popayán, Cauca
            map = L.map('map').setView([2.4419, -76.6063], 9);

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '© OpenStreetMap contributors'
            }).addTo(map);

            // Cargar datos desde el CodeBehind C#
            fetch('Rutas.aspx/ObtenerRutas', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json; charset=utf-8' }
            })
                .then(response => response.json())
                .then(data => {
                    routesData = data.d;
                    if (routesData.length > 0) {
                        renderList(routesData);
                        selectRoute(routesData[0].id); // Selecciona la primera ruta por defecto
                    }
                })
                .catch(error => console.error('Error:', error));
        });


        // Renderizar el listado lateral
        function renderList(data) {
            const listContainer = document.getElementById('routes-list');
            listContainer.innerHTML = '';

            data.forEach(route => {
                const div = document.createElement('div');
                div.className = `card p-3 border-0 shadow-sm route-item text-dark bg-white rounded`;
                div.id = `route-item-${route.id}`;
                div.onclick = () => selectRoute(route.id);
                div.innerHTML = `
                    <span class="text-uppercase fw-bold text-muted small">${route.duration}</span>
                    <h6 class="fw-bold my-1" style="color: var(--verde-paramo);">${route.name}</h6>
                    <p class="small text-muted mb-0">${route.shortDesc}</p>
                `;
                listContainer.appendChild(div);
            });
        }

        // Filtrar Rutas
        function filterRoutes(category) {
            // Cambiar estado visual de botones de filtro
            document.querySelectorAll('.filter-btn').forEach(btn => btn.classList.remove('active'));
            event.target.classList.add('active');

            const filtered = category === 'all'
                ? routesData
                : routesData.filter(r => r.category.includes(category));

            renderList(filtered);
            if (filtered.length > 0) selectRoute(filtered[0].id);
        }

        // Seleccionar y Mostrar Detalle de una Ruta
        function selectRoute(id) {
            const route = routesData.find(r => r.id === id);
            if (!route) return;

            // Actualizar clase seleccionada en la lista
            document.querySelectorAll('.route-item').forEach(item => item.classList.remove('selected'));
            const selectedItem = document.getElementById(`route-item-${id}`);
            if (selectedItem) selectedItem.classList.add('selected');

            // Actualizar Sección Detalle
            const detailSection = document.getElementById('route-detail-section');
            detailSection.style.display = 'block';
            detailSection.innerHTML = `
                <div class="row g-4"> 
                    <div class="col-md-5"> 
                        <img src="${route.image}" class="img-fluid rounded shadow-sm w-100" style="max-height:300px; object-fit:cover;" alt="${route.name}"> 
                    </div> 
                    <div class="col-md-7 d-flex flex-column justify-content-between"> 
                        <div> 
                            <h3 class="fw-bold" style="color: var(--verde-paramo);">${route.name}</h3> 
                            <p class="text-muted">${route.longDesc}</p> 
                            <div class="row g-2 mb-3 text-dark"> 
                                <div class="col-6 col-sm-4"><strong>Distancia:</strong> <br>${route.distance}</div> 
                                <div class="col-6 col-sm-4"><strong>Duración:</strong> <br>${route.duration}</div> 
                                <div class="col-12 col-sm-4"><strong>Municipios:</strong> <br>${route.municipios}</div> 
                            </div> 
                            <p class="mb-1"><strong>Atractivos clave:</strong> ${route.atractivos}</p> 
                            <p class="mb-3"><strong>Servicios incluidos:</strong> ${route.servicios}</p> 
                        </div> 
                        <div> 
                            <a href="Contacto.aspx?ruta=${route.id}" class="btn text-white px-4 shadow-sm" style="background-color: var(--terracota);">Reservar este Circuito</a> 
                        </div> 
                    </div> 
                </div>
            `;

            // Actualizar Galería
            const galleryContainer = document.getElementById('gallery-container');
            galleryContainer.innerHTML = '';
            route.gallery.forEach(imgUrl => {
                galleryContainer.innerHTML += `
                    <div class="col-6 col-md-4"> 
                        <img src="${imgUrl}" class="w-100 gallery-img shadow-sm" alt="Galería ${route.name}"> 
                    </div>
                `;
            });

            // --- MANEJO DE MULTIPLES CAPAS GEOJSON ---

            // 1. Limpiar el grupo de capas anterior si ya existe en el mapa
            if (currentGeoJsonGroup) {
                map.removeLayer(currentGeoJsonGroup);
            }
            if (layerControl) {
                map.removeControl(layerControl);
            }

            // 2. Instanciar un nuevo contenedor de capas vacío y agregarlo al mapa
            currentGeoJsonGroup = L.featureGroup().addTo(map);
            const overlayMaps = {};
            // 3. Recorrer de forma iterativa el arreglo enviado por C#
            if (route.geoJsonDataList && route.geoJsonDataList.length > 0) {
                route.geoJsonDataList.forEach((geoJsonString, index) => {
                    try {
                        const geoJsonObject = JSON.parse(geoJsonString);
                        if (Object.keys(geoJsonObject).length === 0) return;

                        // Paleta de colores para identificar visualmente cada tramo
                        const colors = ['#C85A32', '#1E4620', '#2B579A', '#744210'];
                        const layerColor = colors[index % colors.length];

                        // Definir el nombre legible que aparecerá en la leyenda de checkboxes
                        // Si tu archivo GeoJSON tiene una propiedad interna de nombre, la usa. Si no, usa un genérico.
                        let tramoName = `Tramo ${index + 1}`;
                        if (geoJsonObject.features && geoJsonObject.features[0]?.properties?.name) {
                            tramoName = geoJsonObject.features[0].properties.name;
                        } else if (route.geoJsonFiles && route.geoJsonFiles[index]) {
                            // Alternativa: Usar el nombre del archivo sin la extensión .geojson
                            tramoName = route.geoJsonFiles[index].replace('.geojson', '').replace('_', ' ');
                        }

                        // Crear la subcapa Leaflet GeoJSON
                        const subLayer = L.geoJSON(geoJsonObject, {
                            style: function (feature) {
                                return {
                                    color: layerColor,
                                    weight: 5,
                                    opacity: 0.85
                                };
                            },
                            pointToLayer: function (feature, latlng) {
                                return L.circleMarker(latlng, {
                                    radius: 7,
                                    fillColor: layerColor,
                                    color: '#FFFFFF',
                                    weight: 2,
                                    fillOpacity: 0.9
                                });
                            },
                            onEachFeature: function (feature, layer) {
                                if (feature.properties && feature.properties.name) {
                                    layer.bindPopup(`<strong>${feature.properties.name}</strong><br>${feature.properties.description || ''}`);
                                }
                            }
                        });

                        // A) Añadir la subcapa al FeatureGroup principal para que se pinte de inmediato
                        currentGeoJsonGroup.addLayer(subLayer);

                        // B) Registrar la subcapa en nuestro objeto de leyenda con su respectivo nombre estructurado
                        // Usamos un pequeño bloque HTML para meter un cuadro de color representativo al lado del texto
                        overlayMaps[`<span style="border-bottom: 3px solid ${layerColor}; padding-bottom: 2px;">${tramoName}</span>`] = subLayer;

                    } catch (e) {
                        console.error(`Error procesando GeoJSON índice ${index}:`, e);
                    }
                });

                // 3. Crear e inyectar el control de leyenda oficial de Leaflet en el mapa
                // El parámetro 'collapsed: false' mantiene la leyenda siempre desplegada y visible
                layerControl = L.control.layers(null, overlayMaps, {
                    collapsed: false,
                    position: 'topright'
                }).addTo(map);

                // 4. Calcular el encuadre automático de zoom basado en las capas visibles iniciales
                try {
                    const bounds = currentGeoJsonGroup.getBounds();
                    if (bounds.isValid()) {
                        map.fitBounds(bounds, { padding: [30, 30] });
                    }
                } catch (err) {
                    console.error("Error al encuadrar mapa:", err);
                }
            }


        }
</script>

</asp:Content>