<%@ Page Title="Redactar Crónica | Vive Cauca" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminBlog.aspx.cs" Inherits="WebAppPromocionCauca.AdminBlog" %>

<asp:Content ID="ContentStylesAdmin" ContentPlaceHolderID="Stylesheets" runat="server">
    <style>
        .admin-card {
            background-color: #FFFFFF;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
            border-left: 5px solid var(--verde-paramo) !important;
        }
        .form-label {
            font-weight: 600;
            color: var(--texto-oscuro);
        }
    </style>
</asp:Content>

<asp:Content ID="ContentBodyAdmin" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-5" style="max-width: 850px;">
        
        <div class="d-flex justify-content-between align-items-center mb-4">
            <a href="Blog.aspx" class="text-cauca-terracota fw-bold text-decoration-none">← Volver al Blog Público</a>
            <span class="badge bg-light text-dark border">Panel de Escritura Oficial</span>
        </div>

        <!-- Alertas de Servidor controladas por C# -->
        <asp:Panel ID="pnlExito" runat="server" CssClass="alert alert-success p-4 mb-4 shadow-sm" Visible="false">
            <h5 class="fw-bold mb-1">🎉 ¡Crónica publicada en la nube!</h5>
            <p class="mb-0 text-secondary">La bitácora e imágenes se cargaron con éxito. El artículo ya está disponible en el catálogo de promoción turística.</p>
        </asp:Panel>

        <asp:Panel ID="pnlError" runat="server" CssClass="alert alert-danger p-4 mb-4 shadow-sm" Visible="false">
            <h5 class="fw-bold mb-1">⚠️ Error de validación</h5>
            <asp:Literal ID="litMensajeError" runat="server"></asp:Literal>
        </asp:Panel>

        <div class="card admin-card p-4 p-md-5">
            <div class="mb-4">
                <h2 class="fw-bold m-0" style="color: var(--verde-paramo);">Publicar Nueva Bitácora</h2>
                <p class="text-muted small m-0 mt-1">Sube imágenes de tu almacenamiento local directamente al servidor.</p>
                <hr />
            </div>

            <div class="row g-3">
                <!-- Título -->
                <div class="col-12">
                    <label class="form-label">Título del Artículo:</label>
                    <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control" placeholder="Ej. Atardecer en el Cerro de Manzanillo"></asp:TextBox>
                </div>

                <!-- Autor y Categoría -->
                <div class="col-md-6">
                    <label class="form-label">Nombre del Escritor / Autor:</label>
                    <asp:TextBox ID="txtAutor" runat="server" CssClass="form-control" placeholder="Ej. Carlos Payán"></asp:TextBox>
                </div>
                <div class="col-md-6">
<label class="form-label">Categoría Temática:</label>
<asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select">
    <asp:ListItem Text="Cultura y Saberes" Value="Cultura" />
    <asp:ListItem Text="Ecoturismo y Aventura" Value="Ecoturismo" />
    <asp:ListItem Text="Gastronomía" Value="Gastronomía" />
</asp:DropDownList>

                </div>

                <!-- 📸 SELECCIÓN DE IMÁGENES DEL ALMACENAMIENTO -->
                <div class="col-md-6">
                    <label class="form-label">Imagen de Portada Principal 1:</label>
                    <asp:FileUpload ID="fileImagen1" runat="server" CssClass="form-control" />
                    <span class="text-muted small" style="font-size: 0.75rem;">Formatos aceptados: JPG, PNG, WEBP. Máximo 4MB.</span>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Imagen Intermedia 2 (Opcional):</label>
                    <asp:FileUpload ID="fileImagen2" runat="server" CssClass="form-control" />
                </div>
<!-- 📸 EXCLUSIVO: CARGADOR MÚLTIPLE DE IMÁGENES DEL ALMACENAMIENTO LOCAL -->
<div class="col-12">
    <label class="form-label">Galería de Imágenes Complementarias (Selecciona varios archivos):</label>
    <asp:FileUpload ID="fileGaleriaMultiple" runat="server" AllowMultiple="true" CssClass="form-control" onchange="validarLimiteArchivos(this)" />
    <span class="text-muted small" style="font-size: 0.75rem;">Puedes mantener presionada la tecla <strong>Ctrl</strong> o <strong>Shift</strong> en tu teclado para seleccionar hasta 3 o más imágenes de tu almacenamiento simultáneamente. Formatos: JPG, PNG, WEBP.</span>
</div>



                <!-- Resumen Corto -->
                <div class="col-12">
                    <label class="form-label">Resumen Introductorio (Tarjeta):</label>
                    <asp:TextBox ID="txtResumen" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Resumen corto de la bitácora..."></asp:TextBox>
                </div>

                <!-- Contenido Extendido -->
                <div class="col-12">
                    <label class="form-label">Cuerpo Completo del Artículo:</label>
                    <asp:TextBox ID="txtContenido" runat="server" TextMode="MultiLine" Rows="6" CssClass="form-control" placeholder="Redacta la crónica detallada..."></asp:TextBox>
                </div>

                <!-- Botón de Envío nativo de Servidor -->
                <div class="col-12 text-end mt-4">
                    <asp:Button ID="btnPublicarServidor" runat="server" Text="Guardar y Publicar" CssClass="btn btn-lg btn-cauca-principal px-5" OnClick="btnPublicarServidor_Click" />
                </div>
            </div>
        </div>
    </div>


            <!-- 📑 SECCIÓN: GESTIÓN Y ELIMINACIÓN DE BITÁCORAS EXISTENTES -->
        <div class="card admin-card p-4 p-md-5 mt-5">
            <div class="mb-4">
                <h3 class="fw-bold m-0" style="color: var(--terracota);">Artículos Publicados</h3>
                <p class="text-muted small m-0 mt-1">Administra el contenido del blog. Los cambios se verán reflejados de forma inmediata en la pestaña pública.</p>
                <hr />
            </div>

            <!-- Spinner de carga interno -->
            <div class="text-center py-4" id="cargador-tabla">
                <div class="spinner-border text-danger" role="status"></div>
                <p class="mt-2 text-muted small">Sincronizando registros de la nube...</p>
            </div>

            <!-- Tabla responsiva de administración -->
            <div class="table-responsive" id="contenedor-tabla-admin" style="display: none;">
                <table class="table table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th scope="col" style="width: 45%;">Título de la Crónica</th>
                            <th scope="col" style="width: 20%;">Categoría</th>
                            <th scope="col" style="width: 20%;">Autor</th>
                            <th scope="col" class="text-end" style="width: 15%;">Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="tabla-cuerpo-admin">
                        <!-- Las filas de los artículos se inyectarán aquí dinámicamente -->
                    </tbody>
                </table>
            </div>
        </div>


    <script type="text/javascript">
    function validarLimiteArchivos(uploadControl) {
        const limiteMaximo = 5; // Configura aquí el número máximo de fotos permitidas
        
        if (uploadControl.files.length > limiteMaximo) {
            alert(`⚠️ Solo se permite un máximo de ${limiteMaximo} imágenes para la galería complementaria.`);
            uploadControl.value = ""; // Resetea el componente y remueve los archivos seleccionados
        }
    }

        // Ejecución inmediata al cargar el panel de control
            document.addEventListener("DOMContentLoaded", function () {
                CargarListadoAdministrativo();
        });

        const baseFirebaseUrl = "https://turismocauca-7a4ec-default-rtdb.firebaseio.com/blog";

            // 🔍 MOTOR DE CARGA: Trae los artículos para el administrador
            function CargarListadoAdministrativo() {
            const tablaContenedor = document.getElementById("contenedor-tabla-admin");
            const tablaCuerpo = document.getElementById("tabla-cuerpo-admin");
            const spinnerTabla = document.getElementById("cargador-tabla");

            fetch(`${baseFirebaseUrl}.json`)
                .then(response => response.json())
                .then(data => {
                spinnerTabla.style.display = "none";

            if (!data || data === "null") {
                tablaCuerpo.innerHTML = '<tr><td colspan="4" class="text-center text-muted py-4">No hay crónicas registradas en el sistema.</td></tr>';
            tablaContenedor.style.display = "block";
            return;
                    }

            let htmlFilas = "";

                    Object.keys(data).forEach(key => {
                        // Soporte para nodos planos o con el contenedor intermedio articulo_1
                        const articulo = data[key].articulo_1 || data[key];

            const titulo = articulo.Titulo || "Sin título";
            const categoria = articulo.Categoria || "General";
            const autor = articulo.Autor || "Anónimo";

            // Inyectamos el botón de borrado pasando la llave alfanumérica única de Firebase
            htmlFilas += `
            <tr id="fila-${key}">
                <td class="fw-bold text-dark">${titulo}</td>
                <td><span class="badge bg-light text-dark border">${categoria}</span></td>
                <td class="text-secondary small">${autor}</td>
                <td class="text-end">
                    <button type="button" class="btn btn-sm btn-outline-danger px-3" onclick="eliminarBitacoraNube('${key}')">
                        🗑️ Borrar
                    </button>
                </td>
            </tr>
            `;
                    });

            tablaCuerpo.innerHTML = htmlFilas;
            tablaContenedor.style.display = "block";
                })
                .catch(error => {
                console.error("Error sincronizando tabla:", error);
            spinnerTabla.innerHTML = '<p class="text-danger small m-0">⚠️ Error de comunicación con la base de datos.</p>';
                });
        }

        // 🗑️ MOTOR DE ELIMINACIÓN NATIVO ASÍNCRONO SIN BLOQUEOS DE AUTENTICACIÓN
        function eliminarBitacoraNube(idArticulo) {
            if (confirm("¿Estás seguro de que deseas eliminar permanentemente esta crónica y todas sus imágenes asociadas del servidor?")) {

                // Apuntamos al nuevo manejador genérico enviando el ID limpio en los parámetros
                const urlManejador = `EliminarArticulo.ashx?id=${idArticulo}`;

                fetch(urlManejador, { method: "GET" })
                    .then(response => {
                        if (!response.ok) throw new Error("Fallo en la conexión del servicio técnico.");
                        return response.json(); // Lee el JSON plano directo
                    })
                    .then(data => {
                        // Accedemos a la respuesta del JSON sin la propiedad intermediaria '.d'
                        if (data.resultado === "SUCCESS") {
                            // Animación fluida de desvanecimiento en la tabla
                            const fila = document.getElementById(`fila-${idArticulo}`);
                            if (fila) {
                                fila.style.transition = "all 0.4s ease";
                                fila.style.opacity = "0";
                                setTimeout(() => {
                                    fila.remove();
                                    if (document.querySelectorAll("#tabla-cuerpo-admin tr").length === 0) {
                                        CargarListadoAdministrativo();
                                    }
                                }, 400);
                            }
                        } else {
                            alert("Error procesado por el controlador: " + data.resultado);
                        }
                    })
                    .catch(error => {
                        console.error("Fallo crítico de red:", error);
                        alert("No se pudo completar la operación en el servidor local.");
                    });
            }
        }






</script>


</asp:Content>
