<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="FerreteriaWeb.Registrarse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="Content/sweetalert2.min.css" rel="stylesheet" />
    <style>
        html {
            height: 100%;
            font-family: Arial, Helvetica, sans-serif;
        }

        /*body {
            height: 100%;
            background-image: url("/Img/Fondo.jpg");
            background-size: cover;
            background-attachment: fixed;
        }*/
    </style>

    <div class="row p-xl-4 justify-content-center">

        <div class=" container text-center  bg-dark col-sm-6 col-md-11 col-xl-12  form-group">
            <h2 class="text-white">Registrarse</h2>
            <div class="row">

                <div class="col-xl-6">
                    <section class="form-group col-xl-12">
                        <asp:Label ID="lblNombre" Font-Size="Large" CssClass="font-weight-bolder text-white" runat="server" Text="Nombre"></asp:Label>
                    </section>
                    <section class="form-group col-xl-12">
                        <asp:TextBox ID="txtUsuario" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*El nombre es requerido" ControlToValidate="txtUsuario" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
                    </section>
                </div>

                <div class="col-xl-6">
                    <section class="form-group col-xl-12">
                        <asp:Label ID="Label1" Font-Size="Large" CssClass="font-weight-bolder text-white" runat="server" Text="Apellido"></asp:Label>
                    </section>
                    <section class="form-group col-xl-12">
                        <asp:TextBox ID="txtApellido" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtApellido" ErrorMessage="*El apellido es requerido" ForeColor="White" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
                    </section>
                </div>

                <div class="col-xl-6">
                    <section class="form-group col-xl-12">
                        <asp:Label ID="Label3" Font-Size="Large" CssClass="font-weight-bolder text-white" runat="server" Text="Identificación"></asp:Label>
                    </section>
                    <section class="form-group col-xl-12">
                        <asp:TextBox ID="txtIdentificacion" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*La identificación es requerida" ControlToValidate="txtIdentificacion" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
                    </section>
                </div>

                <div class="col-xl-6">
                    <section class="form-group col-xl-12">
                        <asp:Label ID="Label4" Font-Size="Large" CssClass="font-weight-bolder text-white" runat="server" Text="Núm.Teléfono"></asp:Label>
                    </section>
                    <section class="form-group col-xl-12">
                        <asp:TextBox ID="txtTelefono" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*El número de telefono es requerido" ControlToValidate="txtTelefono" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
                    </section>
                </div>

                <div class="col-xl-6">
                    <section class="form-group col-xl-12">
                        <asp:Label ID="Label2" Font-Size="Large" CssClass="font-weight-bolder text-white" runat="server" Text="Correo electrónico"></asp:Label>
                    </section>
                    <section class="form-group col-xl-12">
                        <asp:TextBox ID="txtCorreo" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Correo Electrónico requerido" ControlToValidate="txtCorreo" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
                    </section>
                </div>

                <div class="col-xl-6">
                    <section class="form-group col-xl-12">
                        <asp:Label ID="Label5" Font-Size="Large" CssClass="font-weight-bolder text-white" runat="server" Text="Dirección"></asp:Label>
                    </section>
                    <section class="form-group col-xl-12">
                        <asp:TextBox ID="txtDireccion" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*La dirección es requerida" ControlToValidate="txtDireccion" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
                    </section>
                </div>
                <div class="col-xl-6">
                    <section class="form-group col-xl-12">
                        <asp:Label ID="Label6" Font-Size="Large" CssClass="font-weight-bolder text-white" runat="server" Text="Contraseña"></asp:Label>
                    </section>

                    <div class="form-group col-xl-12">
                        <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Contraseña requerida" ControlToValidate="txtPassword" ForeColor="White" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-xl-6 align-self-end">
                    <section class="form-group text-left col-xl-12 ">
                        <asp:CheckBox ID="ChkMostrar" CssClass="form-check" runat="server" onclick="mostrarContrasena()" TextAlign="Right" Text="Mostrar Contraseña" ForeColor="White" Font-Size="Small" Font-Bold="true" />
                    </section>
                </div>

                <div class="form-group col-xl-12">
                    <asp:Button ID="btnCrear" CssClass="btn badge-dark btn-outline-danger form-control-sm font-weight-bold align-text-top" runat="server" Text="Crear Cuenta" OnClick="btnCrear_Click" />
                </div>
               
            </div>

        </div>
    </div>
    <script src="Scripts/sweetalert2.min.js"></script>
    <script src="Scripts/mensaje.js"></script>
</asp:Content>
