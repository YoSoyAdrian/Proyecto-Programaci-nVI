<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="RegistrarCupon.aspx.cs" Inherits="FerreteriaWeb.RegistrarCupon" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-xl-6">
            <fieldset>
                <legend>Registro de Cupones</legend>
                <div class="form-group row">
                    <div class="col-xl-2">
                        <asp:Label ID="Label1" runat="server" CssClass="col-sm-2 col-form-label" Text="Nombre">Nombre</asp:Label>
                    </div>
                    <div class="col-sm-10 col-xl-10">
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
                    <div class="col-xl-2">
                        <asp:Label ID="Label2" runat="server" CssClass="col-sm-2 col-form-label" Text="Descripción"></asp:Label>
                    </div>
                    <div class="col-sm-10 col-xl-10">
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
                    <div class="col-xl-2 form-group">
                        <asp:Label ID="Label3" runat="server" CssClass="col-sm-2 col-form-label" Text="Rango"></asp:Label>
                    </div>
                    <div class="col-sm-10 col-xl-10 form-group">
                        <%-- Rangos--%>
                        <asp:DropDownList ID="ddlRango" DataTextField="nombre" DataValueField="idRango" ValidationGroup="Registrar"  CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-xl-2 form-group">
                        <asp:Label ID="Label4" runat="server" CssClass="col-sm-2 col-form-label" Text="Producto"></asp:Label>
                    </div>

                    <div class="col-sm-10 col-xl-10 form-group">
                        <%-- Productos--%>
                        <asp:DropDownList ID="ddlProducto" DataTextField="nombre" ValidationGroup="Registrar" DataValueField="idProducto" CssClass="form-control" runat="server"></asp:DropDownList>

                    </div>
                </div>
                <div class="row form-group justify-content-center">
                    <div class="col-xl-3 col-sm-12 text-center ">
                        <asp:RadioButton ID="rdbDescuento" Text=" " GroupName="rdBtn" ValidationGroup="Registrar" CssClass="custom-radio " runat="server" />
                        <asp:Label ID="Label7" runat="server" Text="Descuento"></asp:Label>
                    </div>
                    <div class="col-xl-3 col-sm-12 text-center ">
                        <asp:RadioButton ID="rdbRegalia" CssClass="custom-radio " GroupName="rdBtn" Text=" " ValidationGroup="Registrar" runat="server" />
                        <asp:Label ID="Label6" runat="server" Text="Regalía"></asp:Label>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-xl-2">
                        <asp:Label ID="Label5" runat="server" CssClass="col-sm-2 col-form-label" Text="Cantidad"></asp:Label>
                    </div>
                    <div class="col-sm-10 col-xl-10">
                        <asp:TextBox ID="txtCantidad" CssClass="form-control" runat="server" ValidationGroup="Registrar" Text="1" TextMode="Number"></asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4"
                            runat="server"
                            ErrorMessage="La cantidad es requerida*"
                            ControlToValidate="txtCantidad"
                            ForeColor="Red" InitialValue="0"
                            SetFocusOnError="true"
                            ValidationGroup="Registrar"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                        <%--     <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
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
                <div class="form-group text-center">
                    <asp:Button ID="btnRegistrar" OnClick="btnRegistrar_Click" CssClass="btn btn-primary"  runat="server" Text="Registrar" />
                </div>
            </fieldset>
        </div>
        
        <div class="col-xl-6 col-sm-12 form-group">
            <div class="col-xl-6">
            <h2>Cupones</h2>
        </div>
            <asp:GridView ID="grvCupon" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="idCupon" SelectMethod="grvCupon_GetData" >

                <Columns>
                    <asp:BoundField HeaderText="Nombre" DataField="nombre"></asp:BoundField>
                    <asp:BoundField HeaderText="Producto" DataField="producto.nombre"></asp:BoundField>
                    <asp:BoundField DataField="rango.nombre" HeaderText="Nivel"></asp:BoundField>
                    <asp:CommandField ShowSelectButton="True" HeaderText="Asignar Cliente" ButtonType="Link" ></asp:CommandField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
