<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ListaCarrito.aspx.cs" Inherits="FerreteriaWeb.ListaCarrito" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-xl-5 text-center ">
            <h2>Carrito de compras</h2>
        </div>
        <div class="col-xl-2 form-group text-center">
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-warning m-2" Text="Limpiar Carrito" />
        </div>
    </div>
    <div class="row ">
        <div class="col-xl-8 col-sm-12 form-group">

            <div class="col-xl-12 col-sm-12 form-group">
            <asp:ListView ID="listaCarrito" runat="server"
                GroupItemCount="1"
                ItemType="FerreteriaEntidad.DetallePedido"
                DataKeyNames="idDetalle">

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
                                <asp:TextBox ID="TextBox1" runat="server" Visible="false" Text="<%#:Item.idDetalle %>"></asp:TextBox>
                                <asp:Image ID="Image1" runat="server" CssClass="img-thumbnail mt-2" ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("productos.imagen"))  %>' />
                                <span class="card__info text-danger"><%# Eval("productos.precio","₡{0:N0}") %></span>
                            </div>
                            <div class="col-xl-5 align-self-center">
                                <div class="col-xl-12">
                                    <span class="form-group align-self-end text-uppercase font-weight-bolder"><%#:Item.productos.nombre%> </span>
                                </div>
                               
                            </div>
                            <div class="col-xl-5">
                                <div class="row">
                                    <div class="container align-self-end">
                                        <div class="col-xl-12 text-center pt-xl-4">
                                            <asp:Label ID="lblCantidad" runat="server" Text="Cantidad" CssClass="form-group font-weight-bold"> </asp:Label>
                                        </div>
                                        <div class="col-xl-12 form-group ">

                                            <asp:TextBox ID="txtCantidad" TextMode="Number" runat="server" CssClass="form-control m-2 text-center" OnTextChanged="txtCantidad_TextChanged" AutoPostBack="true" Text="<%#:Item.cantidad %>"></asp:TextBox>
                                        </div>
                                        <div class="col-xl-12 text-center">
                                            <asp:Button CssClass="btn btn-danger form-group"
                                                ID="btnEliminar"
                                                runat="server" Text="Eliminar"
                                                OnCommand="btnEliminar_Command" CommandArgument="<%#: Item.productos.idProducto %>" />
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-12 text-center  align-self-end">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                            <ContentTemplate>
                                                <asp:Label ID="lblCosto"  runat="server" CssClass="form-group"><%# Eval("subTotal","₡{0:N0}")%></asp:Label>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="txtCantidad" EventName="TextChanged" />
                                            </Triggers>
                                        </asp:UpdatePanel>


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
        <div class="col-xl-4">
            <div class="col-xl-11 p-0 text-center">
                <h2>Detalle de Compra</h2>
            </div>
            <div class="col-xl-11">
                <div class="form-group">
                    <asp:Label ID="lblSubTCompra" runat="server" Text="Sub total: "></asp:Label>
                    <asp:TextBox ID="txtSubTotal" AutoPostBack="true" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblDescuento" runat="server" Text="Descuento: "></asp:Label>
                    <asp:TextBox ID="txtDescuento" AutoPostBack="true" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblTotalCompra" runat="server" Text="Total a pagar: "></asp:Label>
                    <asp:TextBox ID="txtTotal" AutoPostBack="true" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnComprar" runat="server" OnClick="btnRegistrar_Click" CssClass="btn btn-primary" Text="Comprar" />
                </div>

            </div>

        </div>

    </div>
</asp:Content>

