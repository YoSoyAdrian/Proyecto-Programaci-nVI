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
        <div class="col-xl-8 col-sm-12 form-group">

            <div class="col-xl-12 col-sm-8 form-group">
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
                        <div class="col-xl-12">
                            <div class="row col-xl-12 border border-bottom form-group">
                                <div class="form-group col-xl-2 align-self-center text-center">
                                    <img src="Img/logo.png" />
                                </div>
                                <div class="col-xl-2 text-center align-self-center">

                                    <div class="col-xl-12">
                                        <asp:Label ID="Label5" runat="server" CssClass="font-weight-bolder" Text="Cupón canjeado"></asp:Label>
                                    </div>
                                    <div class="col-xl-12">
                                        <asp:Label ID="Label6" runat="server" Text="<%# Item.nombreCupon%>"></asp:Label>
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
                                <div class="col-xl-4 align-self-center">

                                    <div class="col-xl-12 text-center">

                                        <asp:LinkButton ID="LnkCupon" runat="server" Visible='<%# !Eval("nombreCupon").Equals("")%>' Text="Ver detalle del cupón" OnCommand="LnkCupon_Command" CommandArgument="<%# Item.cupon%>" CommandName="Seleccionar"></asp:LinkButton>

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

                <div class="col-xl-4">
                    <div class="row">
                        <div class="col-xl-12 form-group">
                            <h2>Cupón seleccionado</h2>
                        </div>
                        <asp:Panel ID="Panel1" runat="server" Visible="false" CssClass="col-xl-10 card text-center">
                            
                                <div class="card-body  font-weight-bolder text-uppercase ">
                                    <asp:Label runat="server" ID="lblNombreCupon" CssClass="card-title" Text=""></asp:Label>
                                </div>
                                <div class="card-subtitle form-group mb-3">
                                    <asp:Label ID="lblDescripcion" runat="server" CssClass="card-text" Text=""></asp:Label>
                                </div>
                                <div class="card-subtitle form-group mb-3">
                                    <asp:Label runat="server" CssClass="card-text font-weight-bold" Text="Nivel de Cliente: "></asp:Label>
                                    <asp:Label ID="lblRango" runat="server" CssClass="card-text" Text=""></asp:Label>
                                </div>
                                <div class="card-subtitle form-group">
                                    <asp:Label ID="Label8" runat="server" CssClass="card-text font-weight-bold" Text="Descuento: "></asp:Label>
                                    <asp:Label ID="lblDescuento" runat="server" CssClass="card-text" Text=""></asp:Label>
                                </div>

                                <asp:Image runat="server" ID="imgCupon" CssClass="card-img-bottom swal2-image" Style="width: 50%" />
                            
                        </asp:Panel>


                    </div>
                </div>

            </div>
        </div>



    </div>



</asp:Content>
