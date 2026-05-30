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

    <h2 class="mb-4"
        style="color:var(--verde-paramo)">
        Administrar Subregiones
    </h2>

    <div class="card shadow-sm mb-4">

        <div class="card-body">

            <asp:HiddenField
                ID="hfDocumentoId"
                runat="server" />

            <div class="row g-3">

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
                        TextMode="Number"
                        CssClass="form-control" />
                </div>

                <div class="col-12">
                    <label>Descripción</label>

                    <asp:TextBox
                        ID="txtDescripcion"
                        runat="server"
                        TextMode="MultiLine"
                        Rows="4"
                        CssClass="form-control" />
                </div>

                <div class="col-md-6">
                    <label>Imagen</label>

                    <asp:TextBox
                        ID="txtImagen"
                        runat="server"
                        CssClass="form-control" />
                </div>

                <div class="col-md-6">
                    <label>URL</label>

                    <asp:TextBox
                        ID="txtUrl"
                        runat="server"
                        CssClass="form-control" />
                </div>

                <div class="col-md-3">
                    <asp:CheckBox
                        ID="chkActivo"
                        runat="server"
                        Text="Activo" />
                </div>

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
                    CssClass="btn btn-secondary"
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
                DataField="orden"
                HeaderText="Orden" />

            <asp:CheckBoxField
                DataField="activo"
                HeaderText="Activo" />

            <asp:TemplateField>

                <ItemTemplate>

                    <asp:LinkButton
                        runat="server"
                        CommandName="Editar"
                        CommandArgument='<%# Eval("id") %>'
                        CssClass="btn btn-sm btn-primary">
                        Editar
                    </asp:LinkButton>

                    <asp:LinkButton
                        runat="server"
                        CommandName="Eliminar"
                        CommandArgument='<%# Eval("id") %>'
                        CssClass="btn btn-sm btn-danger"
                        OnClientClick="return confirm('¿Eliminar subregión?');">
                        Eliminar
                    </asp:LinkButton>

                </ItemTemplate>

            </asp:TemplateField>

        </Columns>

    </asp:GridView>

</div>

</asp:Content>