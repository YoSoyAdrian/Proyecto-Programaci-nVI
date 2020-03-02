<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ListaCarrito.aspx.cs" Inherits="FerreteriaWeb.ListaCarrito" ClientIDMode="Static" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row align-self-end ">
        <div class="col-xl-10 text-center ">
            <h2>Carrito de compras</h2>
        </div>
        <div class="col-xl-2 form-group text-center">
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-warning m-2" Text="Limpiar Carrito" />
        </div>
    </div>
    <div class="row">
        <div class="col-xl-12 col-sm-12 form-group">
            <asp:ListView ID="listaCarrito" runat="server"
                GroupItemCount="1"
                ItemType="FerreteriaEntidad.DetallePedido">
                <%-- Sin datos --%>
                <EmptyDataTemplate>
                    <div class="alert-info text-center">
                        <h2>¡No hay productos agregados! </h2>

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
                    <div class="container-fluid">
                        <div class="row col-xl-12 border border-bottom form-group">
                            <div class="form-group col-xl-2 align-self-center text-center">
                                <asp:Image ID="Image1" runat="server" CssClass="img-thumbnail mt-2" ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("productos.imagen"))  %>' />
                                <span class="card__info text-danger"><%# Eval("productos.precio","₡{0:N0}") %></span>
                            </div>
                            <div class="col-xl-5 align-self-center">
                                <div class="col-xl-12">
                                    <span class="form-group align-self-end text-uppercase font-weight-bolder"><%#:Item.productos.nombre%> </span>
                                </div>
                                <div class="col-xl-12">
                                    <span class=" form-group "><%#:Item.productos.descripcion %> </span>
                                </div>
                            </div>
                            <div class="col-xl-5">
                                <div class="row">
                                    <div class="container align-self-end">
                                        <div class="col-xl-12 text-center pt-xl-4">
                                            <asp:Label ID="lblCantidad" runat="server" Text="Cantidad" CssClass="form-group font-weight-bold"> </asp:Label>
                                        </div>
                                        <div class="col-xl-12 form-group ">
                                            <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control m-2 text-center" ReadOnly="true" Text="<%#:Item.cantidad %>"></asp:TextBox>
                                        </div>
                                        <div class="col-xl-12 text-center">
                                            <asp:Button CssClass="btn btn-danger form-group"
                                                ID="btnEliminar"
                                                runat="server" Text="Eliminar"
                                                OnCommand="btnEliminar_Command" />
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-12 text-center  align-self-end">
                                        <asp:Label ID="lblCosto" runat="server"  CssClass="form-group"><%# Eval("subTotal","₡{0:N0}")%></asp:Label>
                                    </div>
                                </div>

                            </div>
                        </div>
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
    <div class="row">
        <div class="col-xl-12 text-center">

            <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Text="Registrarse o iniciar sesión para continuar la compra" />
        </div>
    </div>

</asp:Content>
