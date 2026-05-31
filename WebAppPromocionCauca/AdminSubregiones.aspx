<%@ Page Title="Administrar Subregiones"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="AdminSubregiones.aspx.cs"
Inherits="WebAppPromocionCauca.AdminSubregiones" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="container py-5">

    <h1 class="mb-4">
        Administración de Subregiones
    </h1>

    <asp:HiddenField ID="hfId" runat="server" />
    <asp:HiddenField ID="hfImagenActual" runat="server" />

    <div class="card shadow-sm mb-4">

        <div class="card-body">

            <div class="row">

                <div class="col-md-6">

                    <label>Nombre</label>

                    <asp:TextBox
                        ID="txtNombre"
                        runat="server"
                        CssClass="form-control" />

                </div>

                <div class="col-md-6">

                    <label>Orden</label>

                    <asp:TextBox
                        ID="txtOrden"
                        runat="server"
                        CssClass="form-control" />

                </div>

            </div>

            <div class="mt-3">

                <label>Descripción</label>

                <asp:TextBox
                    ID="txtDescripcion"
                    runat="server"
                    TextMode="MultiLine"
                    Rows="3"
                    CssClass="form-control" />

            </div>

            <div class="mt-3">

                <label>Contenido</label>

                <asp:TextBox
                    ID="txtContenido"
                    runat="server"
                    TextMode="MultiLine"
                    Rows="8"
                    CssClass="form-control" />

            </div>

            <div class="mt-3">

                <label>Imagen principal</label>

                <asp:FileUpload
                    ID="fuImagen"
                    runat="server"
                    CssClass="form-control" />

            </div>

            <div class="mt-3">

                <asp:Image
                    ID="imgPreview"
                    runat="server"
                    Width="250"
                    CssClass="img-thumbnail" />

            </div>

            <div class="form-check mt-3">

                <asp:CheckBox
                    ID="chkActivo"
                    runat="server"
                    Checked="true" />

                <label class="form-check-label">
                    Activo
                </label>

            </div>

            <div class="mt-4">

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
                    CssClass="btn btn-secondary ms-2"
                    OnClick="btnNuevo_Click" />

            </div>

        </div>

    </div>

    <asp:GridView
        ID="gvSubregiones"
        runat="server"
        AutoGenerateColumns="False"
        CssClass="table table-striped"
        OnRowCommand="gvSubregiones_RowCommand">

        <Columns>

            <asp:BoundField
                DataField="nombre"
                HeaderText="Nombre" />

            <asp:BoundField
                DataField="slug"
                HeaderText="Slug" />

            <asp:BoundField
                DataField="orden"
                HeaderText="Orden" />

            <asp:TemplateField>

                <ItemTemplate>

                    <asp:LinkButton
                        runat="server"
                        Text="Editar"
                        CssClass="btn btn-primary btn-sm"
                        CommandName="Editar"
                        CommandArgument='<%# Eval("id") %>' />

                    <asp:LinkButton
                        runat="server"
                        Text="Eliminar"
                        CssClass="btn btn-danger btn-sm"
                        CommandName="Eliminar"
                        CommandArgument='<%# Eval("id") %>' />

                </ItemTemplate>

            </asp:TemplateField>

        </Columns>

    </asp:GridView>

</div>

</asp:Content>