<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="PaginaPrincipal.aspx.cs" Inherits="FerreteriaWeb.PaginaPrincipal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/estilo.css" rel="stylesheet" />
    <div class="row form-group">
        <div class="col-2">
        <div class="form-group  text-center">
            <label>Categor&#237;a</label>
        </div>
        <div class="form-group border">

            <asp:CheckBoxList ID="ChkCategoria" runat="server" AutoPostBack="True" CssClass="form-group ">
                <asp:ListItem>Jardiner&#237;a</asp:ListItem>
                <asp:ListItem>Pinturas</asp:ListItem>
                <asp:ListItem>Plomer&#237;a</asp:ListItem>
            </asp:CheckBoxList>
        </div>
    </div>
      
        <div class="col-10 form-group">
            <asp:ListView ID="listaProductos" runat="server"
                GroupItemCount="4"
                ItemType="FerreteriaEntidad.Producto"
                SelectMethod="listaProductos_GetData"
                DataKeyNames="idProducto">
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
                    <div class="row ">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                    </div>
                </GroupTemplate>
                <%--Datos del item --%>
                <ItemTemplate>
                    <div class="row col-3">
                       

                            <article class="card card--2 form-group col-12">
                                <div class="card__info-hover form-group">
                                    <div class="card__clock-info ">
                                        <span class="card__time"><%# Eval("precio","${0:N0}") %></span>
                                    </div>
                                </div>
                                <div class="card__img form-group"></div>
                                <a href="#" class="card_link form-group">
                                    <div class="card__img--hover form-group">
                                        <asp:Image ID="Image1" runat="server" Width="90%" ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("imagen"))  %>' />
                                    </div>
                                </a>
                                <div class="card__info form-group">
                                    <span class="card__category form-group"><%#:Item.nombre %> </span>
                                    <h3 class="card__by form-group"><%#:Item.categoria%></h3>
                                    <div class="form-group text-center">
                                        <asp:Button CssClass="btn btn-primary "
                                            ID="btnSeleccionar"
                                            runat="server" Text="Seleccionar"
                                            CommandArgument="<%#:Item.idProducto%>"
                                            OnCommand="btnSeleccionar_Command" />
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
