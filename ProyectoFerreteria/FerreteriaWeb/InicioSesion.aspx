<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="FerreteriaWeb.InicioSesion" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        html {
            height: 100%;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            height: 100%;
            background-image: url("/Img/Fondo.jpg");
            background-size: cover;
            background-attachment: fixed;
        }
    </style>

    <div class="row m-xl-5 p-xl-5 justify-content-center">

        <div class=" container text-center m-4 bg-dark col-sm-6 col-md-11 col-xl-6 pt-xl-1  form-group">

            <section class="form-group">
                <asp:Label ID="lblNombre" Font-Size="Large" CssClass="font-weight-bolder text-white" runat="server" Text="Correo Electronico"></asp:Label>
            </section>
            <section class="form-group">
                <asp:TextBox ID="txtUsuario" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Correo Electronico requerido" ControlToValidate="txtUsuario" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
            </section>
            <section class="form-group">
                <asp:Label ID="Label1" Font-Size="Large" CssClass="font-weight-bolder text-white" runat="server" Text="Contraseña"></asp:Label>
            </section>

            <div class="form-group">
                <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Contraseña requerida" ControlToValidate="txtPassword" ForeColor="White" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
            </div>
            <section class="form-group text-left">

                <asp:CheckBox ID="ChkMostrar" CssClass="form-check" runat="server" onclick="mostrarContra()" TextAlign="Right" Text="Mostrar Contraseña" ForeColor="White" Font-Size="Small" Font-Bold="true" />

            </section>
            <div class="form-group">
                <asp:Button ID="btnIngresar" CssClass="btn badge-dark btn-outline-danger form-control-sm font-weight-bold align-text-top" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" />
            </div>
            <div class="form-group">

                <asp:Label ID="lblValidacion" runat="server" ForeColor="Red" Font-Size="Medium"></asp:Label>

            </div>
            <div class="form-group">
                <asp:LinkButton ID="lkBtnCrearCuenta" Text="Crear Cuenta" runat="server"></asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>
