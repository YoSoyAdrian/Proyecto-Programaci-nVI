<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Cupon.aspx.cs" Inherits="FerreteriaWeb.MantCuponCliente" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row form-group">
        <div class="col-xl-12 form-group">
            <div class="container text-center pt-3 border-bottom border-danger">
                <h2>Cupones</h2>
            </div>
        </div>
    </div>

    <div class="row form-row">

        <div class="col-xl-12 form-group">

            <div class="col-xl-6 form-group">
                <asp:Label ID="Label2" runat="server" Text="Nivel de Usuario seleccionado"></asp:Label>
            </div>
            <div class=" row col-xl-12">
                <div class="col-xl-3 form-group">
                    <asp:DropDownList ID="ddlRango" DataTextField="nombre" CssClass="form-control" DataValueField="idRango" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRango_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="col-xl-6 form-check mt-2">
                    <asp:CheckBox ID="ChkMiCupon" runat="server" AutoPostBack="true" Text="Mis cupones" OnCheckedChanged="ChkMiCupon_CheckedChanged" />
                </div>
            </div>

        </div>

    </div>
    <div class="row">
        <div class="col-xl-12">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>


                    <asp:GridView ID="grvListadoCupon" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" ItemType="FerreteriaEntidad.Cupon">

                        <Columns>
                            <asp:BoundField DataField="idCupon" HeaderText="C&#243;digo"></asp:BoundField>
                            <asp:BoundField DataField="nombre" HeaderText="Nombre"></asp:BoundField>
                            <asp:BoundField DataField="cantidad" HeaderText="Cantidad"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlRango" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
        </div>

    </div>
</asp:Content>
