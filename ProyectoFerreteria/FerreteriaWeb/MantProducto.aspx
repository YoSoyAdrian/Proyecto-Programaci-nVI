<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="MantProducto.aspx.cs" Inherits="FerreteriaWeb.MantProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col col-lg-6">
            <fieldset>
                <legend>Mantenimiento de Productos</legend>
                <div class="form-group row">
                    <asp:Label ID="Label1" runat="server" CssClass="col-sm-2 col-form-label" Text="Nombre">Nombre</asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtNombre" TextMode="SingleLine" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ErrorMessage="El nombre es requerido*"
                            ControlToValidate="txtNombre"
                            ForeColor="Red"
                            ValidationGroup="Registrar"
                            SetFocusOnError="true"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <asp:Label ID="Label2" runat="server" CssClass="col-sm-2 col-form-label" Text="Nombre">Descripción</asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtDescripcion" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ErrorMessage="La descripción es requerida*"
                            ControlToValidate="txtDescripcion"
                            ForeColor="Red"
                            ValidationGroup="Registrar"
                            SetFocusOnError="true"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="validarDescripcion"
                            runat="server"
                            ErrorMessage="La descripción debe tener al menos 3 caracteres"
                            ControlToValidate="txtDescripcion"
                            OnServerValidate="validarDescripcion_ServerValidate"
                            ForeColor="Red"
                            ValidationGroup="Registrar"
                            SetFocusOnError="true"
                            Display="Dynamic"></asp:CustomValidator>
                    </div>

                </div>
                <div class="form-group row">

                    <asp:Label ID="Label3" runat="server" CssClass="col-sm-2 col-form-label" Text="Categoría">Categoría</asp:Label>

                    <div class="col-sm-10">
                        <%-- CATEGORIA--%>
                        <asp:DropDownList ID="ddlCategoria" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" CssClass="form-control" runat="server"></asp:DropDownList>

                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="Label5" runat="server" CssClass="col-sm-2 col-form-label" Text="Precio">Precio</asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtPrecio" CssClass="form-control" runat="server" Text="1" TextMode="Number"></asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4"
                            runat="server"
                            ErrorMessage="El precio es requerido*"
                            ControlToValidate="txtPrecio"
                            ForeColor="Red" InitialValue="0"
                            SetFocusOnError="true"
                            ValidationGroup="Registrar"
                            Display="Dynamic"></asp:RequiredFieldValidator>
<%--                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                            runat="server"
                            ErrorMessage="El precio solo debe contener números"
                            ControlToValidate="txtPrecio"
                            ValidationExpression="[0-9]"
                            ForeColor="Red"
                            SetFocusOnError="true"
                            ValidationGroup="Registrar"
                            Display="Dynamic">
                        </asp:RegularExpressionValidator>--%>
                    </div>
                </div>
                <div class="form-group row">
                 <asp:Label ID="Label4" runat="server" CssClass="col-sm-2 col-form-label" Text="Precio">Imagen</asp:Label>
                        <asp:Image ID="iVerImagen"  runat="server" />
                        <asp:FileUpload ID="fuploadImagen" runat="server" accept=".png" CssClass="form-control"  />
                 

                </div>


                <asp:Button ID="btnRegistrar" OnClick="btnRegistrar_Click" CssClass="btn btn-primary" runat="server" Text="Registrar" />
          </fieldset>
        </div>
        <div class="col col-lg-6">
            <fieldset>
                <legend>Lista de Reservas</legend>
                <asp:GridView ID="grvListado" runat="server"
                    CssClass="table table-hover"
                    AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="fecha" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fecha"></asp:BoundField>
                        <asp:BoundField DataField="nombreCliente" HeaderText="Cliente" />

                        <asp:BoundField DataField="actividad.nombre" HeaderText="Actividad"></asp:BoundField>

                        <asp:BoundField DataField="total" DataFormatString="${0:N2}" HeaderText="Total"></asp:BoundField>
                        <asp:BoundField DataField="usuario.email" HeaderText="Usuario"></asp:BoundField>
                    </Columns>



                    <HeaderStyle CssClass="table-info" />
                </asp:GridView>
            </fieldset>
        </div>
    </div>
</asp:Content>
