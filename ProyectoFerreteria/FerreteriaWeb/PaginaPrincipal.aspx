<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="PaginaPrincipal.aspx.cs" Inherits="FerreteriaWeb.PaginaPrincipal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-lg-3 custom-select-lg  p-5">
        <div class="form-group text-center">
            <label>Categor&#237;a</label>
        </div>
        <div class="form-group border">

            <asp:CheckBoxList ID="ChkCategoria" runat="server" AutoPostBack="True" CssClass="form-check">
                <asp:ListItem>Jardiner&#237;a</asp:ListItem>
                <asp:ListItem>Pinturas</asp:ListItem>
                <asp:ListItem>Plomer&#237;a</asp:ListItem>
            </asp:CheckBoxList>
        </div>
    </div>
    <div class="row align-middle">
        <div class="col-10">
            <asp:ListView ID="listaProductos" runat="server"
                GroupItemCount="4"
                ItemType="FerreteriaEntidad.Producto"
                DataKeyNames=""
                >
                <%-- Sin datos --%>
                <EmptyDataTemplate>
                    <div class="col-lg-4">
                        No hay datos
                    </div>
                </EmptyDataTemplate>
                <%-- Item vacío --%>
                <EmptyItemTemplate>
                    <div class="card text-center border-primary mb-4">
                    </div>
                </EmptyItemTemplate>
                <%-- Grupo o fila --%>
                <GroupTemplate>
                    <div class="row">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                    </div>
                </GroupTemplate>
                <%--Datos del item --%>
                <ItemTemplate>
                    <div class="col-lg-4">
                        <div class="card text-center border-primary mb-4">
                            <div class="card-body">
                                <h5 class="card-title"><%#:Item.nombre %></h5>
                                <div class="card-img">
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imagen")%>' />
                                </div>
                                <p class="card-text"><%# Eval("precio","${0:N0}") %></p>
                                <p class="card-text">
                                    <b>Descripción:</b>
                                    <%#:Item.descripcion%>
                                </p>

                                <asp:Button CssClass="btn btn-primary"
                                    ID="btnSeleccionar"
                                    runat="server" Text="Seleccionar"
                                    CommandArgument="<%#:Item.idProducto%>"
                                    OnCommand="btnSeleccionar_Command" />

                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <%-- Contenedor principal --%>
                <LayoutTemplate>
                    <div class="container">
                        <asp:PlaceHolder ID="groupPlaceHolder" runat="server"></asp:PlaceHolder>
                    </div>
                </LayoutTemplate>
            </asp:ListView>
        </div>
        <div class="col-2">
        </div>
    </div>

</asp:Content>
