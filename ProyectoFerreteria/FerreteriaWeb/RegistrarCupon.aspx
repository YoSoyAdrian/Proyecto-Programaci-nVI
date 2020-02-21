<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="RegistrarCupon.aspx.cs" Inherits="FerreteriaWeb.RegistrarCupon" %>

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
                        <asp:DropDownList ID="ddlRango" DataTextField="nombre" DataValueField="idRango" OnSelectedIndexChanged="ddlRango_SelectedIndexChanged" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-xl-2 form-group">
                        <asp:Label ID="Label4" runat="server" CssClass="col-sm-2 col-form-label" Text="Producto"></asp:Label>
                    </div>

                    <div class="col-sm-10 col-xl-10 form-group">
                        <%-- Productos--%>
                        <asp:DropDownList ID="ddlProducto" DataTextField="nombre" DataValueField="idProducto" OnSelectedIndexChanged="ddlProducto_SelectedIndexChanged" CssClass="form-control" runat="server"></asp:DropDownList>

                    </div>
                </div>
                <div class="row form-group justify-content-center">
                    <div class="col-xl-3 col-sm-12 text-center ">
                        <asp:RadioButton ID="rdbDescuento" Text=" " CssClass="custom-radio " runat="server" />
                        <asp:Label ID="Label7" runat="server" Text="Descuento"></asp:Label>
                    </div>
                    <div class="col-xl-3 col-sm-12 text-center ">
                        <asp:RadioButton ID="rdbRegalia" CssClass="custom-radio " Text=" " runat="server" />
                        <asp:Label ID="Label6" runat="server" Text="Regalía"></asp:Label>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-xl-2">
                        <asp:Label ID="Label5" runat="server" CssClass="col-sm-2 col-form-label" Text="Cantidad"></asp:Label>
                    </div>
                    <div class="col-sm-10 col-xl-10">
                        <asp:TextBox ID="txtCantidad" CssClass="form-control" runat="server" Text="1" TextMode="Number"></asp:TextBox>

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
                    <asp:Button ID="btnRegistrar" OnClick="btnRegistrar_Click" CssClass="btn btn-primary" runat="server" Text="Registrar" />
                </div>
            </fieldset>
        </div>
        <div class="col-xl-6 col-sm-12 form-group">
            <asp:ListView ID="listaCupon" runat="server"
                GroupItemCount="4"
                ItemType="FerreteriaEntidad.Cupon"
                SelectMethod="listaCupon_GetData"
                DataKeyNames="idCupon">
                <%-- Sin datos --%>
                <EmptyDataTemplate>
                    <div>
                        No hay datos
                    </div>
                </EmptyDataTemplate>
                <%-- Item vacío --%>
                <EmptyItemTemplate>
                    <div>
                    </div>
                </EmptyItemTemplate>
                <%-- Grupo o fila --%>
                <GroupTemplate>
                    <div class="row col-sm-12 ">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                    </div>
                </GroupTemplate>
                <%--Datos del item --%>
                <ItemTemplate>
                    <div class="row col-xl-4 col-sm-12">
                       

                            <article class="card card--2 form-group col-xl-12 col-sm-12">
                                <div class="card__info-hover form-group">
                                    <div class="card__clock-info ">
                                        <span class="card__time"><%# Eval("cantidad","{0:N0}")%></span>
                                    </div>
                                </div>
                                
                                <div class="card__info form-group">
                                    <span class="card__category form-group "><%#:Item.nombre %> </span>
                                    <h3 class="card__by form-group"><%#:Item.producto.nombre%></h3>
                                    <div class="form-group text-center">
                                        <asp:Button CssClass="btn btn-primary "
                                            ID="btnSeleccionar"
                                            runat="server" Text="Seleccionar"
                                            CommandArgument="<%#:Item.idCupon%>"
                                            />
                                    </div>

                                </div>
                            </article>
                        </div>
                                </ItemTemplate>
                <%-- Contenedor principal --%>
                <LayoutTemplate>
                    <div>
                        <asp:PlaceHolder ID="groupPlaceHolder" runat="server"></asp:PlaceHolder>
                    </div>
                </LayoutTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
