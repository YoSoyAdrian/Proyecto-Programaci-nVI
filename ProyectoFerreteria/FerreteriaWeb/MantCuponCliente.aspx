<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="MantCuponCliente.aspx.cs" Inherits="FerreteriaWeb.MantCuponCliente" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row form-group">
        <div class="col-xl-12 form-group">
            <div class="container text-center">
                <h2>Cupones de los Clientes</h2>
            </div>
        </div>
    </div>

    <div class="row">
       
        <div class="col-xl-6 form-group">

            <div class="col-xl-12 form-group">
                <asp:Label ID="Label1" runat="server" Text="Correo del cliente"></asp:Label>

            </div>
            <div class="col-xl-12 form-group">
                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-xl-6">
                 <asp:Label ID="Label3" runat="server" Text="Cliente"></asp:Label>
            </div>
            
            <div class="col-xl-6">
                <asp:DropDownList ID="ddlUsuario" DataTextField="nombre" DataValueField="idCliente"  runat="server"></asp:DropDownList>
            </div>
        </div>
        <div class="col-xl-6 text-center form-group">
            <div class="col-xl-12 form-group">
                <asp:Label ID="Label2" runat="server" Text="Cupón seleccionado"></asp:Label>
            </div>
            <div class="col-xl-6 form-group">
                <div class="container bg-dark">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
