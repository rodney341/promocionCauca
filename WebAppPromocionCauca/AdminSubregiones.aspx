<%@ Page Title="Administrar Subregiones"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="AdminSubregiones.aspx.cs"
    Inherits="WebAppPromocionCauca.AdminSubregiones" %>

<asp:Content ID="ContentAdmin"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="container py-5">

        <div class="row">

            <div class="col-lg-4">

                <div class="card shadow-sm border-0">

                    <div class="card-header bg-success text-white">
                        <h4 class="mb-0">
                            Subregión
                        </h4>
                    </div>

                    <div class="card-body">

                        <asp:HiddenField
                            ID="hfId"
                            runat="server" />

                        <asp:HiddenField
                            ID="hfImagenActual"
                            runat="server" />

                        <div class="mb-3">

                            <label class="form-label">
                                Nombre
                            </label>

                            <asp:TextBox
                                ID="txtNombre"
                                runat="server"
                                CssClass="form-control" />

                        </div>

                        <div class="mb-3">

                            <label class="form-label">
                                Descripción
                            </label>

                            <asp:TextBox
                                ID="txtDescripcion"
                                runat="server"
                                CssClass="form-control"
                                TextMode="MultiLine"
                                Rows="4" />

                        </div>

                        <div class="mb-3">

                            <label class="form-label">
                                Imagen
                            </label>

                            <asp:FileUpload
                                ID="fuImagen"
                                runat="server"
                                CssClass="form-control" />

                        </div>

                        <div class="mb-3 text-center">

                            <asp:Image
                                ID="imgPreview"
                                runat="server"
                                Width="220"
                                CssClass="img-fluid rounded border" />

                        </div>

                        <div class="mb-3">

                            <label class="form-label">
                                URL
                            </label>

                            <asp:TextBox
                                ID="txtUrl"
                                runat="server"
                                CssClass="form-control" />

                        </div>

                        <div class="mb-3">

                            <label class="form-label">
                                Orden
                            </label>

                            <asp:TextBox
                                ID="txtOrden"
                                runat="server"
                                CssClass="form-control"
                                TextMode="Number" />

                        </div>

                        <div class="mb-3">

                            <asp:CheckBox
                                ID="chkActivo"
                                runat="server"
                                Text=" Subregión activa"
                                Checked="true" />

                        </div>

                        <div class="d-grid gap-2">

                            <asp:Button
                                ID="btnGuardar"
                                runat="server"
                                Text="Guardar"
                                CssClass="btn btn-success"
                                OnClick="btnGuardar_Click" />

                            <asp:Button
                                ID="btnNuevo"
                                runat="server"
                                Text="Nuevo"
                                CssClass="btn btn-outline-secondary"
                                OnClick="btnNuevo_Click" />

                        </div>

                    </div>

                </div>

            </div>

            <div class="col-lg-8">

                <div class="card shadow-sm border-0">

                    <div class="card-header bg-dark text-white">
                        <h4 class="mb-0">
                            Listado de Subregiones
                        </h4>
                    </div>

                    <div class="card-body">

                        <asp:GridView
                            ID="gvSubregiones"
                            runat="server"
                            CssClass="table table-striped table-hover"
                            AutoGenerateColumns="False"
                            GridLines="None"
                            OnRowCommand="gvSubregiones_RowCommand">

                            <Columns>

                                <asp:TemplateField HeaderText="Imagen">

                                    <ItemTemplate>

                                        <img src='<%# Eval("imagen") %>'
                                            style="width:100px;height:70px;object-fit:cover;border-radius:8px;" />

                                    </ItemTemplate>

                                </asp:TemplateField>

                                <asp:BoundField
                                    DataField="nombre"
                                    HeaderText="Nombre" />

                                <asp:BoundField
                                    DataField="orden"
                                    HeaderText="Orden" />

                                <asp:TemplateField HeaderText="Estado">

                                    <ItemTemplate>

                                        <span class='<%# (bool)Eval("activo") ? "badge bg-success" : "badge bg-danger" %>'>
                                            <%# (bool)Eval("activo") ? "Activo" : "Inactivo" %>
                                        </span>

                                    </ItemTemplate>

                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Acciones">

                                    <ItemTemplate>

                                        <asp:LinkButton
                                            ID="btnEditar"
                                            runat="server"
                                            CssClass="btn btn-sm btn-primary me-1"
                                            Text="Editar"
                                            CommandName="Editar"
                                            CommandArgument='<%# Eval("id") %>' />

                                        <asp:LinkButton
                                            ID="btnEliminar"
                                            runat="server"
                                            CssClass="btn btn-sm btn-danger"
                                            Text="Eliminar"
                                            CommandName="Eliminar"
                                            CommandArgument='<%# Eval("id") %>'
                                            OnClientClick="return confirm('¿Desea eliminar esta subregión?');" />

                                    </ItemTemplate>

                                </asp:TemplateField>

                            </Columns>

                        </asp:GridView>

                    </div>

                </div>

            </div>

        </div>

    </div>

</asp:Content>