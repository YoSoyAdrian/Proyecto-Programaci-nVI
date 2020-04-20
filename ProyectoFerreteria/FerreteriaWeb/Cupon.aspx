<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Cupon.aspx.cs" Inherits="FerreteriaWeb.MantCuponCliente" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <div class="col-12">
    <div class="row form-group" >
        <div class="col-xl-12">
            <div class="container-lg text-center pt-3 border-bottom border-danger">
                <h2>Cupones</h2>
            </div>
        </div>
    </div>

    <div class="row form-row">

        <div class="col-xl-11 form-group container">

            <div class="col-xl-6 form-group">
                <asp:Label ID="Label2" runat="server" Text="Nivel de Usuario seleccionado"></asp:Label>
            </div>
            <div class=" row col-xl-12">
                <div class="col-xl-3 form-group">
                    <asp:DropDownList ID="ddlRango" DataTextField="nombre" CssClass="form-control" DataValueField="idRango" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRango_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="col-xl-2 form-check mt-2">
                    <asp:CheckBox ID="ChkMiCupon" runat="server" AutoPostBack="true" Text="Mis cupones" OnCheckedChanged="ChkMiCupon_CheckedChanged" />
                </div>
            </div>

        </div>

    </div>
    <div class="row">
        <div class="col-xl-11 container-md">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>


                    <asp:GridView ID="grvListadoCupon" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" ItemType="FerreteriaEntidad.Cupon">

                        <Columns>
                          
                            <asp:BoundField DataField="nombre" HeaderText="Nombre"></asp:BoundField>
                            <asp:BoundField DataField="producto.nombre" HeaderText="Producto"></asp:BoundField>

                            <asp:CheckBoxField DataField="estado" HeaderText="Activo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center"></asp:CheckBoxField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlRango" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
        </div>

    </div>
        </div>
</asp:Content>
