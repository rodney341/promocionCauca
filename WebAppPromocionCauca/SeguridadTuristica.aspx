<%@ Page Title="Seguridad Turística - Cauca" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SeguridadTuristica.aspx.cs" Inherits="WebAppPromocionCauca.SeguridadTuristica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
     <style>
        body {
            background: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Banner minimalista moderno */
        .hero-banner {
            background: #ffffff;
            border-bottom: 1px solid #e3e6f0;
            padding: 50px 0 30px 0;
        }

        .badge-seguridad {
            background-color: rgba(13, 110, 253, 0.1);
            color: #0d6efd;
            font-weight: 600;
            padding: 8px 16px;
            border-radius: 50px;
            display: inline-block;
        }

        /* Navegación por pestañas personalizada */
        .nav-tabs-custom {
            border-bottom: none;
            gap: 10px;
        }

        .nav-tabs-custom .nav-link {
            border: 1px solid #e3e6f0;
            border-radius: 30px;
            color: #4e73df;
            font-weight: 600;
            padding: 10px 20px;
            background: #fff;
            transition: all 0.3s ease;
        }

        .nav-tabs-custom .nav-link.active {
            background: #0d6efd;
            color: white;
            border-color: #0d6efd;
            box-shadow: 0 4px 12px rgba(13, 110, 253, 0.25);
        }

        /* Tarjetas minimalistas limpias */
        .contact-card {
            background: #ffffff;
            border: 1px solid #e3e6f0;
            border-left: 4px solid #0d6efd; /* Indicador de color dinámico */
            border-radius: 12px;
            padding: 20px;
            height: 100%;
            transition: all 0.3s ease;
        }

        .contact-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.05);
        }

        .border-emergencia { border-left-color: #dc3545; }
        .border-vias { border-left-color: #198754; }
        .border-municipios { border-left-color: #fd7e14; }

        .btn-call {
            background-color: #f1f3f9;
            color: #0d6efd;
            border-radius: 50%;
            width: 45px;
            height: 45px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            transition: all 0.2s ease;
            text-decoration: none;
        }

        .btn-call:hover {
            background-color: #0d6efd;
            color: white;
        }

        .footer-clean {
            background: #ffffff;
            border-top: 1px solid #e3e6f0;
            padding: 25px 0;
            margin-top: 80px;
            color: #6e707e;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<!-- Cabecera Limpia -->
<div class="hero-banner mb-5">
    <div class="container text-center text-md-start">
        <div class="row align-items-center">
            <div class="col-md-8">
                <span class="badge-seguridad mb-3">
                    <i class="bi bi-shield-fill-check me-2"></i>Zona de Turismo Seguro
                </span>
                <h1 class="fw-bold text-dark display-5">Asistencia al Visitante</h1>
                <p class="text-muted lead mb-0">Directorio oficial de respuesta inmediata y líneas de atención en el Cauca.</p>
            </div>
            <div class="col-md-4 text-center text-md-end d-none d-md-block">
                <i class="bi bi-telephone-outbound text-muted" style="font-size: 4.5rem; opacity: 0.3;"></i>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <!-- Navegación de Categorías -->
    <ul class="nav nav-tabs nav-tabs-custom justify-content-center mb-5" id="securityTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="principales-tab" data-bs-toggle="tab" data-bs-target="#principales" type="button" role="tab"><i class="bi bi-star-fill me-2"></i>Líneas Principales</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="vias-tab" data-bs-toggle="tab" data-bs-target="#vias" type="button" role="tab"><i class="bi bi-cone-striped me-2"></i>Vías y Entorno</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="municipios-tab" data-bs-toggle="tab" data-bs-target="#municipios" type="button" role="tab"><i class="bi bi-geo-alt-fill me-2"></i>Patrullas Municipales</button>
        </li>
    </ul>

    <!-- Contenido de las Pestañas -->
    <div class="tab-content" id="securityTabsContent">
        
        <!-- PESTAÑA 1: LÍNEAS PRINCIPALES -->
        <div class="tab-pane fade show active" id="principales" role="tabpanel">
            <div class="row g-4">
                
                <!-- Policía Nacional -->
                <div class="col-md-6 col-lg-4">
                    <div class="contact-card border-emergencia">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <small class="text-danger fw-bold uppercase">Nacional</small>
                                <h5 class="fw-bold mb-2 text-dark">Policía Nacional</h5>
                                <p class="text-muted small mb-3">Atención de emergencies 24/7</p>
                                <div class="mb-2">
                                    <span class="d-block text-muted small">Línea Única:</span>
                                    <a href="tel:123" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-shield-fill text-danger me-1"></i>123</a>
                                </div>
                            </div>
                            <a href="tel:123" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
                        </div>
                    </div>
                </div>

                <!-- Gaula Policía -->
                <div class="col-md-6 col-lg-4">
                    <div class="contact-card border-emergencia">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <small class="text-danger fw-bold">Antisecuestro</small>
                                <h5 class="fw-bold mb-2 text-dark">Gaula Policía</h5>
                                <p class="text-muted small mb-3">Línea directa o celular</p>
                                <div class="mb-2">
                                    <span class="d-block text-muted small">Celular Directo:</span>
                                    <a href="tel:3178965495" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-phone text-danger me-1"></i>317 896 5495</a>
                                </div>
                            </div>
                            <a href="tel:3178965495" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
                        </div>
                        <div class="mt-2 pt-2 border-top text-center">
                            <a href="tel:165" class="badge bg-danger text-decoration-none fw-bold p-2 w-100"><i class="bi bi-hash me-1"></i>Línea Nacional: 165</a>
                        </div>
                    </div>
                </div>

                <!-- Comandante Distrito Dos -->
                <div class="col-md-6 col-lg-4">
                    <div class="contact-card">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <small class="text-primary fw-bold">Distrito</small>
                                <h5 class="fw-bold mb-2 text-dark">Comandante D2</h5>
                                <p class="text-muted small mb-3">Policía Metropolitana</p>
                                <div class="mb-2">
                                    <span class="d-block text-muted small">Celular Oficial:</span>
                                    <a href="tel:3214245777" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-person-badge text-primary me-1"></i>321 424 5777</a>
                                </div>
                            </div>
                            <a href="tel:3214245777" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
                        </div>
                    </div>
                </div>

                <!-- Cruz Roja Cauca -->
                <div class="col-md-6 col-lg-4">
                    <div class="contact-card border-emergencia">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <small class="text-danger fw-bold">Socorro</small>
                                <h5 class="fw-bold mb-2 text-dark">Cruz Roja Cauca</h5>
                                <p class="text-muted small mb-3">Primeros auxilios y desastres</p>
                                <div class="mb-2">
                                    <span class="d-block text-muted small">Teléfono Fijo Sede:</span>
                                    <a href="tel:+576028209800" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-telephone text-danger me-1"></i>(602) 820 9800</a>
                                </div>
                            </div>
                            <a href="tel:+576028209800" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
                        </div>
                        <div class="mt-2 pt-2 border-top text-center">
                            <a href="tel:132" class="badge bg-danger text-decoration-none fw-bold p-2 w-100"><i class="bi bi-heart-pulse-fill me-1"></i>Línea de Emergencia Corta: 132</a>
                        </div>
                    </div>
                </div>


                <!-- Bomberos Popayán -->
                <div class="col-md-6 col-lg-4">
                    <div class="contact-card border-emergencia">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <small class="text-danger fw-bold">Socorro</small>
                                <h5 class="fw-bold mb-2 text-dark">Bomberos Popayán</h5>
                                <p class="text-muted small mb-3">Línea de respuesta a incendios</p>
                                <div class="mb-2">
                                    <span class="d-block text-muted small">Celular Estación:</span>
                                    <a href="tel:3217705505" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-fire text-danger me-1"></i>321 770 5505</a>
                                </div>
                            </div>
                            <a href="tel:3217705505" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
                        </div>
                        <div class="mt-2 pt-2 border-top text-center">
                            <a href="tel:119" class="badge bg-danger text-decoration-none fw-bold p-2 w-100"><i class="bi bi-telephone me-1"></i>Línea Corta: 119</a>
                        </div>
                    </div>
                </div>

                <!-- SIJIN -->
                <div class="col-md-6 col-lg-4">
                    <div class="contact-card">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <small class="text-primary fw-bold">SIJIN</small>
                                <h5 class="fw-bold mb-2 text-dark">Policía Judicial</h5>
                                <p class="text-muted small mb-3">Investigación y denuncias</p>
                                <div class="mb-2">
                                    <span class="d-block text-muted small">Celular Guardia:</span>
                                    <a href="tel:3213947610" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-search text-primary me-1"></i>321 394 7610</a>
                                </div>
                            </div>
                            <a href="tel:3213947610" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
                        </div>
                    </div>
                </div>
                <!-- Policía Infancia y Adolescencia -->
                <div class="col-md-6 col-lg-4">
                    <div class="contact-card border-emergencia">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <small class="text-danger fw-bold">Protección de Menores</small>
                                <h5 class="fw-bold mb-2 text-dark">Policía Infancia y Adolescencia</h5>
                                <p class="text-muted small mb-3">Garantía de derechos de niños, niñas y adolescentes.</p>
                                <div class="mb-2">
                                    <span class="d-block text-muted small">Celular de Guardia:</span>
                                    <a href="tel:3117060236" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-person-heart text-danger me-1"></i>311 706 0236</a>
                                </div>
                            </div>
                            <a href="tel:3117060236" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
                        </div>
                    </div>
                </div>


<!-- Patrulla Púrpura -->
<div class="col-md-6 col-lg-4">
    <div class="contact-card border-emergencia">
        <div class="d-flex justify-content-between align-items-start">
            <div>
                <small class="text-danger fw-bold">Género y Familia</small>
                <h5 class="fw-bold mb-2 text-dark">Patrulla Púrpura</h5>
                <p class="text-muted small mb-3">Atención y orientación a mujeres víctimas de violencia.</p>
                <div class="mb-2">
                    <span class="d-block text-muted small">Celular Directo:</span>
                    <a href="tel:3155526322" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-gender-female text-danger me-1"></i>315 552 6322</a>
                </div>
            </div>
            <a href="tel:3155526322" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
        </div>
        <div class="mt-2 pt-2 border-top text-center">
            <a href="tel:155" class="badge bg-danger text-decoration-none fw-bold p-2 w-100"><i class="bi bi-hash me-1"></i>Línea de Orientación Nacional: 155</a>
        </div>
    </div>
</div>
                <!-- Policía de Inteligencia (SIPOL) -->
<div class="col-md-6 col-lg-4">
    <div class="contact-card border-principales">
        <div class="d-flex justify-content-between align-items-start">
            <div>
                <small class="text-primary fw-bold">Seguridad Preventiva</small>
                <h5 class="fw-bold mb-2 text-dark">Policía de Inteligencia (SIPOL)</h5>
                <p class="text-muted small mb-3">Recepción de información confidencial y seguridad nacional.</p>
                <div class="mb-2">
                    <span class="d-block text-muted small">Celular de Guardia:</span>
                    <a href="tel:3215770526" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-eye text-primary me-1"></i>321 577 0526</a>
                </div>
            </div>
            <a href="tel:3215770526" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
        </div>
    </div>
</div>


<!-- Instituto Colombiano de Bienestar Familiar (ICBF) -->
<div class="col-md-6 col-lg-4">
    <div class="contact-card border-emergencia">
        <div class="d-flex justify-content-between align-items-start">
            <div>
                <small class="text-danger fw-bold">Protección Integral</small>
                <h5 class="fw-bold mb-2 text-dark">ICBF Regional Cauca</h5>
                <p class="text-muted small mb-3">Prevención y protección de la infancia y la familia.</p>
                <div class="mb-2">
                    <span class="d-block text-muted small">Línea Nacional Gratuita:</span>
                    <a href="tel:018000918080" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-headset text-danger me-1"></i>01 8000 918080</a>
                </div>
            </div>
            <a href="tel:018000918080" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
        </div>
        <div class="mt-2 pt-2 border-top text-center">
            <a href="tel:141" class="badge bg-danger text-decoration-none fw-bold p-2 w-100"><i class="bi bi-hash me-1"></i>Línea de Protección Directa: 141</a>
        </div>
    </div>
</div>

<!-- Defensa Civil Colombiana -->
<div class="col-md-6 col-lg-4">
    <div class="contact-card border-emergencia">
        <div class="d-flex justify-content-between align-items-start">
            <div>
                <small class="text-danger fw-bold">Socorro y Emergencias</small>
                <h5 class="fw-bold mb-2 text-dark">Defensa Civil Seccional Cauca</h5>
                <p class="text-muted small mb-3">Prevención de desastres, rescate y apoyo logístico.</p>
                <div class="mb-2">
                    <span class="d-block text-muted small">Línea de Emergencia Corta:</span>
                    <a href="tel:144" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-heart-pulse-fill text-danger me-1"></i>144</a>
                </div>
            </div>
            <a href="tel:144" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
        </div>
    </div>
</div>

<!-- Fiscalía General de la Nación -->
<div class="col-md-6 col-lg-4">
    <div class="contact-card border-principales">
        <div class="d-flex justify-content-between align-items-start">
            <div>
                <small class="text-primary fw-bold">Justicia y Denuncias</small>
                <h5 class="fw-bold mb-2 text-dark">Fiscalía General</h5>
                <p class="text-muted small mb-3">Recepción de denuncias penales y actos urgentes.</p>
                <div class="mb-2">
                    <span class="d-block text-muted small">Línea Única de Atención:</span>
                    <a href="tel:122" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-briefcase text-primary me-1"></i>Línea 122</a>
                </div>
            </div>
            <a href="tel:122" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
        </div>
    </div>
</div>





            </div>
        </div>


               <!-- PESTAÑA 2: VÍAS Y ENTORNO -->
        <div class="tab-pane fade" id="vias" role="tabpanel">
            <div class="row g-4">
                
                <!-- Policía de Carreteras -->
                <div class="col-md-6 col-lg-4">
                    <div class="contact-card border-vias">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <small class="text-success fw-bold">Tránsito y Transporte</small>
                                <h5 class="fw-bold mb-2 text-dark">Policía de Carreteras</h5>
                                <p class="text-muted small mb-3">Estado de vías o celular directo</p>
                                <div class="mb-2">
                                    <span class="d-block text-muted small">Celular:</span>
                                    <a href="tel:3232274825" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-phone me-1 text-success"></i>323 227 4825</a>
                                </div>
                            </div>
                            <a href="tel:3232274825" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
                        </div>
                        <div class="mt-2 pt-2 border-top text-center">
                            <a href="tel:#767" class="badge bg-success text-decoration-none fw-bold p-2 w-100"><i class="bi bi-hash me-1"></i>Marcación Rápida: #767</a>
                        </div>
                    </div>
                </div>

                <!-- INVIAS Oficina Cauca -->
                <div class="col-md-6 col-lg-4">
                    <div class="contact-card border-vias">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <small class="text-success fw-bold">Infraestructura</small>
                                <h5 class="fw-bold mb-2 text-dark">INVIAS Cauca</h5>
                                <p class="text-muted small mb-3">Reporte de emergencias viales territoriales</p>
                                <div class="mb-2">
                                    <span class="d-block text-muted small">Línea Directa:</span>
                                    <a href="tel:3203017300" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-telephone me-1 text-success"></i>320 301 7300</a>
                                </div>
                            </div>
                            <a href="tel:3203017300" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
                        </div>
                    </div>
                </div>

                <!-- INVIAS Línea Nacional -->
                <div class="col-md-6 col-lg-4">
                    <div class="contact-card border-vias">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <small class="text-success fw-bold">Atención Nacional</small>
                                <h5 class="fw-bold mb-2 text-dark">Línea Gratuita INVIAS</h5>
                                <p class="text-muted small mb-3">Línea nacional interactiva de carreteras</p>
                                <div class="mb-2">
                                    <span class="d-block text-muted small">Número Gratuito:</span>
                                    <a href="tel:018005191656" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-headset me-1 text-success"></i>01 8000 519 1656</a>
                                </div>
                            </div>
                            <a href="tel:018005191656" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
                        </div>
                    </div>
                </div>

                <!-- Policía Ambiental -->
                <div class="col-md-6 col-lg-4">
                    <div class="contact-card border-vias">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <small class="text-success fw-bold">Ecosistemas y Entorno</small>
                                <h5 class="fw-bold mb-2 text-dark">Policía Ambiental y R.N.</h5>
                                <p class="text-muted small mb-3">Protección de fauna, flora y senderos</p>
                                <div class="mb-2">
                                    <span class="d-block text-muted small">Celular cuadrante:</span>
                                    <a href="tel:3225100948" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-shield-shaded me-1 text-success"></i>322 510 0948</a>
                                </div>
                            </div>
                            <a href="tel:3225100948" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
                        </div>
                    </div>
                </div>

                <!-- Terminal de Transportes -->
                <div class="col-md-6 col-lg-4">
                    <div class="contact-card border-vias">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <small class="text-success fw-bold">Terminal Popayán</small>
                                <h5 class="fw-bold mb-2 text-dark">Transporte Terrestre</h5>
                                <p class="text-muted small mb-3">Información de rutas y frecuencias</p>
                                <div class="mb-2">
                                    <span class="d-block text-muted small">Contacto Operaciones:</span>
                                    <a href="tel:3169136476" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-bus-front me-1 text-success"></i>316 913 6476</a>
                                </div>
                            </div>
                            <a href="tel:3169136476" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
                        </div>
                    </div>
                </div>

            </div>
        </div>


           <!-- PESTAÑA 3: PATRULLAS MUNICIPALES -->
        <div class="tab-pane fade" id="municipios" role="tabpanel">
            <div class="row g-4">
                
                <!-- Municipio: Timbío -->
                <div class="col-md-6 col-lg-3">
                    <div class="contact-card border-municipios">
                        <div class="d-flex align-items-center mb-3">
                            <i class="bi bi-geo-alt-fill text-warning fs-4 me-2"></i>
                            <div>
                                <h5 class="fw-bold text-dark mb-0">Timbío</h5>
                                <small class="text-muted">Estación de Policía</small>
                            </div>
                        </div>
                        
                        <!-- Cuadrante 1 -->
                        <div class="mb-3 pb-2 border-bottom">
                            <span class="d-block text-muted small">Patrulla Cuadrante 1:</span>
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="tel:3014392546" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-phone me-1 text-warning"></i>301 439 2546</a>
                                <a href="tel:3014392546" class="btn-call btn-call-small" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
                            </div>
                        </div>
                        
                        <!-- Cuadrante 2 -->
                        <div>
                            <span class="d-block text-muted small">Patrulla Cuadrante 2:</span>
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="tel:3014392925" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-phone me-1 text-warning"></i>301 439 2925</a>
                                <a href="tel:3014392925" class="btn-call btn-call-small" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Municipio: Coconuco -->
                <div class="col-md-6 col-lg-3">
                    <div class="contact-card border-municipios">
                        <div class="d-flex align-items-center mb-3">
                            <i class="bi bi-geo-alt-fill text-warning fs-4 me-2"></i>
                            <div>
                                <h5 class="fw-bold text-dark mb-0">Coconuco</h5>
                                <small class="text-muted">Estación de Policía</small>
                            </div>
                        </div>
                        <div>
                            <span class="d-block text-muted small">Patrulla Única:</span>
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="tel:3174426995" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-shield-shaded me-1 text-warning"></i>317 442 6995</a>
                                <a href="tel:3174426995" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Municipio: Puracé -->
                <div class="col-md-6 col-lg-3">
                    <div class="contact-card border-municipios">
                        <div class="d-flex align-items-center mb-3">
                            <i class="bi bi-geo-alt-fill text-warning fs-4 me-2"></i>
                            <div>
                                <h5 class="fw-bold text-dark mb-0">Puracé</h5>
                                <small class="text-muted">Subestación de Policía</small>
                            </div>
                        </div>
                        <div>
                            <span class="d-block text-muted small">Patrulla Única:</span>
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="tel:3174428709" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-shield-shaded me-1 text-warning"></i>317 442 8709</a>
                                <a href="tel:3174428709" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Municipio: Sotará -->
                <div class="col-md-6 col-lg-3">
                    <div class="contact-card border-municipios">
                        <div class="d-flex align-items-center mb-3">
                            <i class="bi bi-geo-alt-fill text-warning fs-4 me-2"></i>
                            <div>
                                <h5 class="fw-bold text-dark mb-0">Sotará</h5>
                                <small class="text-muted">Estación de Policía</small>
                            </div>
                        </div>
                        <div>
                            <span class="d-block text-muted small">Patrulla Única:</span>
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="tel:3012470103" class="fw-bold text-dark text-decoration-none fs-5"><i class="bi bi-shield-shaded me-1 text-warning"></i>301 247 0103</a>
                                <a href="tel:3012470103" class="btn-call" title="Llamar"><i class="bi bi-telephone-fill"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>



        </asp:Content>