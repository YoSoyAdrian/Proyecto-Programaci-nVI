<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="PaginaPrincipal.aspx.cs" Inherits="FerreteriaWeb.PaginaPrincipal" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="Content/estilo.css" rel="stylesheet" />
    <style>
        .showOverlay {
            bottom: 0;
            display: flex;
            font-size: 16px;
            left: calc(50% - 55px);
            margin-bottom: 7px;
            position: absolute;
        }

        .containerOuter {
            background: white;
            border-radius: 8px;
            box-shadow: 2px 6px 20px 2px rgba(10,10,120,0.15);
        }

        .container {
            position: relative;
            margin: 20px;
            overflow: hidden;
            width: 160px;
        }

        .hidden {
            display: none;
        }

        .entry {
            height: 25px;
            position: absolute;
            width: 160px;
        }

            .entry:nth-child(2) {
                left: 8px;
                top: 8px;
            }

            .entry:nth-child(4) {
                left: 8px;
                top: 58px;
            }

            .entry:nth-child(6) {
                left: 8px;
                top: 108px;
            }

        .circle {
            border: 2px solid #545556;
            border-radius: 50%;
            cursor: pointer;
            height: 20px;
            position: absolute;
            transition: border-color 300ms;
            width: 20px;
        }


        .overlay {
            background: #fff;
            mask: url(#holes);
            height: 140px;
            pointer-events: none;
            transition: background 300ms;
            width: 40px;
        }
    </style>


    <div class="row form-group mt-xl-5">
        <div class="col-xl-2 col-sm-12 mt-xl-5">
            <div class="text-center">
                <h2>Categoría</h2>
            </div>

            <div class="containerOuter">
                <div class="container row">
                    <div class="col-xl-12">
                        <asp:RadioButton ID="rBtnJardin" CssClass="" Text="Jardinería" AutoPostBack="true" GroupName="categoria" Checked="false" OnCheckedChanged="rBtnJardin_CheckedChanged" runat="server" />
                    </div>
                    <div class="col-xl-12">
                        <asp:RadioButton ID="rBtnPlomeria" CssClass="" Text="Plomería" AutoPostBack="true" GroupName="categoria" Checked="false" runat="server" OnCheckedChanged="rBtnPlomeria_CheckedChanged" />
                    </div>
                    <div class="col-xl-12">
                        <asp:RadioButton ID="rBtnPintura" CssClass="" Text="Pintura" AutoPostBack="true" GroupName="categoria" Checked="false" OnCheckedChanged="rBtnPintura_CheckedChanged" runat="server" />
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-10 col-sm-12 col-md-12 form-group">
            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>--%>
            <asp:ListView ID="listaProductos" runat="server"
                GroupItemCount="4"
                ItemType="FerreteriaEntidad.Producto"
                DataKeyNames="idProducto">
                <%-- Sin datos --%>
                <EmptyDataTemplate>
                    <div class="alert-info text-center">
                        <h2>No hay Productos registrados</h2>

                    </div>
                </EmptyDataTemplate>
                <%-- Item vacío --%>
                <EmptyItemTemplate>
                    <div>
                    </div>
                </EmptyItemTemplate>
                <%-- Grupo o fila --%>
                <GroupTemplate>


                    <div class="row col-sm-12 col-md-12 col-xl-12">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                    </div>

                </GroupTemplate>
                <%--Datos del item --%>
                <ItemTemplate>

                    <div class="row col-xl-3 col-sm-6 col-md-3 justify-content-center text-center">
                        <article class="card card--2 form-group col-xl-12 col-sm-12 col-md-12">
                            <div class="card__info-hover form-group ">
                                <div class="card__clock-info ">
                                    <span class="card__time"><%# Eval("precio","₡{0:N0}") %></span>
                                </div>
                            </div>
                            <div class="card__img form-group container-sm"></div>
                            <div class="card_link form-group ">
                                <div class="card__img--hover form-group col-md-12 col-sm-12 col-xl-12 text-center">
                                    <asp:Image ID="Image1" runat="server" CssClass="container-xl container-fluid " ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("imagen"))  %>' />
                                </div>
                            </div>

                            <div class="card__info form-group">
                                <span class="card__category form-group justify-content-center"><%#:Item.nombre %> </span>
                                <h3 class="card__by form-group"><%#:Item.categoria%></h3>
                                <div class="form-group text-center">
                                    <asp:Button CssClass="btn btn-primary "
                                        ID="btnSeleccionar"
                                        runat="server" CommandName="Seleccionar" Text="Añadir"
                                        CommandArgument="<%#:Item.idProducto%>"
                                        OnCommand="btnSeleccionar_Command" ValidationGroup="categoria" />
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
            <%--   </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="rBtnJardin" EventName="CheckedChanged" />
                    <asp:AsyncPostBackTrigger ControlID="rBtnPlomeria" EventName="CheckedChanged" />
                    <asp:AsyncPostBackTrigger ControlID="rBtnPintura" EventName="CheckedChanged" />
                    
                </Triggers>
            </asp:UpdatePanel>--%>
        </div>

    </div>


</asp:Content>
