<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="RegistroCompra.aspx.cs" Inherits="FerreteriaWeb.Registro" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="row form-group">
        <div class="col-xl-12 form-group">
            <div class="container-xl text-center pt-3 border-bottom border-info">
                <h2>Mis Compras<img src="Img/listaCompra.png" /></h2>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-xl-12 col-sm-12 form-group">

            <div class="col-xl-12 col-sm-12 form-group">
                <asp:ListView ID="listaCompra" runat="server"
                    GroupItemCount="1"
                    ItemType="FerreteriaEntidad.Pedido"
                    DataKeyNames="idPedido"
                    SelectMethod="listaCompra_GetData">

                    <%-- Sin datos --%>
                    <EmptyDataTemplate>
                        <div class="alert-info text-center">
                            <h2>¡No hay compras registradas! </h2>

                        </div>
                    </EmptyDataTemplate>
                    <%-- Item vacío --%>
                    <EmptyItemTemplate>
                        <div>
                        </div>
                    </EmptyItemTemplate>
                    <%-- Grupo o fila --%>
                    <GroupTemplate>
                        <div class="row col-sm-12">
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                        </div>
                    </GroupTemplate>
                    <%--Datos del item --%>
                    <ItemTemplate>
                        <div class="container-xl">
                            <div class="row col-xl-12 border border-bottom form-group">
                                <div class="form-group col-xl-2 align-self-center text-center">
                                    <img src="Img/logo.png" />
                                </div>
                                <div class="col-xl-2 text-center align-self-center">

                                    <div class="col-xl-12">
                                        <span class="form-group text-uppercase font-weight-bolder"><%# Item.cliente.idCliente%> </span>
                                    </div>
                                </div>
                                <div class="col-xl-2 text-center align-self-center">

                                    <div class="col-xl-12">
                                        <asp:Label ID="Label1" runat="server" CssClass="font-weight-bolder" Text="Cantidad Productos"></asp:Label>
                                    </div>
                                    <div class="col-xl-12">
                                        <asp:Label ID="Label3" runat="server" Text="<%# Item.cantidad %>"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-xl-2 text-center align-self-center">

                                    <div class="col-xl-12">
                                        <asp:Label ID="Label2" runat="server" CssClass="font-weight-bolder" Text="Total"></asp:Label>
                                    </div>
                                    <div class="col-xl-12">
                                        <asp:Label ID="Label4" runat="server" Text="<%# Item.total %>"></asp:Label>

                                    </div>
                                </div>
                                <div class="col-xl-3 align-self-center">

                                    <div class="col-xl-12 text-center">

                                        <asp:LinkButton ID="LnkProducto" runat="server" Text="Mostrar productos"></asp:LinkButton>

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
    </div>


</asp:Content>
