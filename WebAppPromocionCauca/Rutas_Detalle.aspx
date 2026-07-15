<%@ Page Title="Detalle del Circuito" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rutas_Detalle.aspx.cs" Inherits="WebAppPromocionCauca.Rutas_Detalle" %>

<asp:Content ID="ContentDetalle" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        :root {
            --verde-paramo: #1E4620;
            --terracota: #C85A32;
            --beige-suave: #F9F6F0;
        }
        #map-detalle {
            height: 550px;
            border-radius: 12px;
            z-index: 1;
        }
        .meta-box {
            background-color: var(--beige-suave);
            border-left: 4px solid var(--verde-paramo);
        }
        .gallery-thumb {
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.2s ease;
        }
        .gallery-thumb:hover {
            transform: scale(1.02);
        }

        #seccion-operadores {
            scroll-margin-top: 100px; 
        }

    </style>

    <div class="container my-5">
        <!-- Contenedor para mensajes de error si la ruta no existe -->
        <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="alert alert-warning text-center my-5">
            <h4 class="fw-bold">Circuito no encontrado</h4>
            <p class="mb-3">El corredor turístico que intentas consultar no está disponible o ha cambiado de código.</p>
            <a href="Rutas.aspx" class="btn text-white" style="background-color: var(--verde-paramo);">Ver todas las rutas</a>
        </asp:Panel>

        <!-- Panel Principal del Detalle -->
        <asp:Panel ID="pnlDetalle" runat="server">
            <!-- Botón volver arriba -->
            <div class="mb-4">
                <a href="Rutas.aspx" class="text-decoration-none text-muted small fw-bold">← Volver al mapa general de rutas</a>
            </div>

            <!-- Encabezado Principal -->
            <div class="row g-4 mb-5">
                <div class="col-lg-7">
                    <span class="text-uppercase fw-bold small d-block mb-1" style="color: var(--terracota);">
                        <asp:Literal ID="litDuracionHeader" runat="server" />
                    </span>
                    <h1 class="fw-bold display-5 mb-3" style="color: var(--verde-paramo);">
                        <asp:Literal ID="litNombreRuta" runat="server" />
                    </h1>
                    <p class="lead text-muted">
                        <asp:Literal ID="litDescripcionLarga" runat="server" />
                    </p>
                </div>
                <div class="col-lg-5">
                    <img id="imgPrincipal" runat="server" class="img-fluid rounded shadow w-100" style="max-height: 350px; object-fit: cover;" alt="Imagen del destino" />
                </div>
            </div>

            <!-- Ficha Técnica Avanzada -->
            <div class="row g-4 mb-5">
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm p-4 h-100 meta-box">
                        <h5 class="fw-bold mb-3" style="color: var(--verde-paramo);">Especificaciones</h5>
                        <div class="mb-3">
                            <label class="text-muted d-block small">Duración estimada</label>
                            <strong class="fs-5 text-dark"><asp:Literal ID="litDuracionFicha" runat="server" /></strong>
                        </div>
                        <div class="mb-3">
                            <label class="text-muted d-block small">Distancia del trayecto</label>
                            <strong class="fs-5 text-dark"><asp:Literal ID="litDistancia" runat="server" /></strong>
                        </div>
                        <div>
                            <label class="text-muted d-block small">Municipios que conecta</label>
                            <strong class="fs-6 text-dark"><asp:Literal ID="litMunicipios" runat="server" /></strong>
                        </div>
                    </div>
                </div>

                <!-- Detalles Logísticos -->
                <div class="col-md-8">
                    <div class="card border-0 shadow-sm p-4 h-100 bg-white">
                        <h5 class="fw-bold mb-3" style="color: var(--verde-paramo);">Experiencia de Viaje</h5>
                        <p class="mb-3">
                            <strong style="color: var(--terracota);">Atractivos Clave:</strong><br />
                            <span class="text-muted"><asp:Literal ID="litAtractivos" runat="server" /></span>
                        </p>
                        <p class="mb-4">
                            <strong style="color: var(--terracota);">Servicios Incluidos de Operación Local:</strong><br />
                            <span class="text-muted"><asp:Literal ID="litServicios" runat="server" /></span>
                        </p>
                        <div>
                            <a href="#seccion-operadores" class="btn text-white px-5 py-2 shadow-sm fw-bold" style="background-color: var(--verde-paramo);">
                                🔍 Ver Operadores Autorizados
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Trazado de Capas de Georreferenciación -->
            <div class="row g-4 mb-5">
                <div class="col-12">
                    <div class="card border-0 shadow-sm p-3">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h4 class="fw-bold mb-0" style="color: var(--verde-paramo);">Mapa Topográfico del Circuito</h4>
                            <span class="badge bg-light text-dark border small">Usa la leyenda para aislar tramos</span>
                        </div>
                        <div id="map-detalle"></div>
                    </div>
                </div>
            </div>


            <!-- OPERADORES TURÍSTICOS AUTORIZADOS -->
            <div id="seccion-operadores" class="card border-0 shadow-sm p-4 mb-5 bg-white">
                <div class="d-flex align-items-center mb-4">
                    <div style="width: 4px; height: 24px; background-color: var(--terracota); class='me-2 d-inline-block'"></div>
                    <h4 class="fw-bold mb-0 ps-2" style="color: var(--verde-paramo);">Operadores y Agencias Locales Autorizadas</h4>
                </div>
    
                <p class="text-muted small mb-4">Para tu seguridad y la preservación del patrimonio del Cauca, contrata servicios únicamente con empresas registradas ante el Viceministerio de Turismo.</p>

                <div class="row g-3">
                    <asp:Repeater ID="rptOperadores" runat="server">
                        <ItemTemplate>
                            <div class="col-md-6 col-lg-4">
                                <div class="card h-100 border border-light shadow-sm p-3 position-relative">
                                    <!-- Badge de Sostenibilidad -->
                                    <%# Convert.ToBoolean(Eval("CertificadoSostenibilidad")) ? "<span class='badge bg-success position-absolute top-0 end-0 m-2 small'><i class='bi bi-shield-check'></i> Sostenible</span>" : "" %>
                        
                                    <div class="card-body p-2 d-flex flex-column justify-content-between">
                                        <div>
                                            <h5 class="fw-bold card-title mb-1" style="color: var(--verde-paramo);"><%# Eval("Nombre") %></h5>
                                            <span class="text-muted d-block small mb-3 fw-mono"><%# Eval("RegistroTurismo") %></span>
                                
                                            <div class="small text-muted mb-2">
                                                <strong>Teléfono:</strong> <br /><%# Eval("Telefono") %>
                                            </div>
                                            <div class="small text-muted mb-3">
                                                <strong>E-mail:</strong> <br /><%# Eval("Correo") %>
                                            </div>
                                        </div>
                            
                                        <div class="pt-2 border-top">
                                            <a href='<%# Eval("SitioWeb") %>' target="_blank" class="btn btn-outline-secondary btn-sm w-100 fw-bold">
                                                Visitar Sitio Web →
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="lblNoData" runat="server" Visible='<%# rptOperadores.Items.Count == 0 %>' 
                                       CssClass="text-center text-muted py-4 d-block small" 
                                       Text="No hay agencias registradas para este trayecto específico en este momento." />
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>



            <!-- Galería de Fotos del Corredor -->
            <div class="card border-0 shadow-sm p-4">
                <h4 class="fw-bold mb-4" style="color: var(--verde-paramo);">Registro Fotográfico Regional</h4>
                <div class="row g-3">
                    <asp:Repeater ID="rptGaleria" runat="server">
                        <ItemTemplate>
                            <div class="col-6 col-md-4 col-lg-3">
                                <img src='<%# Container.DataItem %>' class="w-100 gallery-thumb shadow-sm" alt="Fotografía del Cauca" />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </asp:Panel>
    </div>

    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <script>
        const geoJsonDataList = <%= GetGeoJsonDataListAsJson() %>;
        const fileNamesList = <%= GetGeoJsonFileNamesAsJson() %>;

        document.addEventListener("DOMContentLoaded", () => {
            if (!geoJsonDataList || geoJsonDataList.length === 0) return;

            const map = L.map('map-detalle', {
                scrollWheelZoom: false
            }).setView([2.4419, -76.6063], 9);
            
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '© OpenStreetMap contributors'
            }).addTo(map);
            map.on('focus', () => { map.scrollWheelZoom.enable(); });
            map.on('blur', () => { map.scrollWheelZoom.disable(); });


            const geoJsonGroup = L.featureGroup().addTo(map);
            const overlayMaps = {};
            const routeLayers = [];

            geoJsonDataList.forEach((geoJsonString, index) => {
                try {
                    const geoJsonObject = JSON.parse(geoJsonString);
                    if (Object.keys(geoJsonObject).length === 0) return;

                    const colors = ['#C85A32', '#1E4620', '#2B579A', '#744210'];
                    const layerColor = colors[index % colors.length];
                    
                    let tramoName = `Tramo ${index + 1}`;
                    if (geoJsonObject.features && geoJsonObject.features[0]?.properties?.name) {
                        tramoName = geoJsonObject.features[0].properties.name;
                    } else if (route.geoJsonFiles && route.geoJsonFiles[index]) {
                        tramoName = route.geoJsonFiles[index].replace('.json', '').replace('_', ' ');
                    }

                    const subLayer = L.geoJSON(geoJsonObject, {
                        style: () => ({ color: layerColor, weight: 5, opacity: 0.88, lineCap: 'round', lineJoin: 'round', dashArray: null }),
                        pointToLayer: (feature, latlng) => L.circleMarker(latlng, {
                            radius: 8,
                            fillColor: layerColor,
                            color: '#FFFFFF',
                            weight: 2,
                            opacity: 1,
                            fillOpacity: 0.9
                        }),
                        onEachFeature: (feature, layer) => {
                            if (feature.properties && feature.properties.name) {
                                layer.bindPopup(`<strong>${feature.properties.name}</strong><br>${feature.properties.description || ''}`);
                            }

                            layer.on({

                                mouseover: function (e) {
                                    const l = e.target;
                                    if (layer.setStyle) {
                                        layer.setStyle({
                                            weight: 8,
                                            opacity: 1,
                                            color: '#FF9800'
                                        });
                                    }
                                    l.openPopup();

                                },

                                mouseout: function (e) {
                                    const l = e.target;
                                    if (layer.setStyle) {
                                        layer.setStyle({
                                            weight: 5,
                                            opacity: 0.88,
                                            color: layerColor
                                        });
                                    }
                                    l.closePopup();

                                }

                            });



                        }
                    });

                    geoJsonGroup.addLayer(subLayer);
                    overlayMaps[`<span style="border-bottom: 3px solid ${layerColor}; padding-bottom:1px;">${tramoName}</span>`] = subLayer;
                } catch (e) {
                    console.error("Error interpretando capa GeoJSON en índice " + index, e);
                }
            });

            L.control.layers(null, overlayMaps, { collapsed: false, position: 'topright' }).addTo(map);

            if (geoJsonGroup.getLayers().length > 0) {
                map.fitBounds(geoJsonGroup.getBounds(), { padding: [70, 70] });
            }
        });
    </script>
</asp:Content>
