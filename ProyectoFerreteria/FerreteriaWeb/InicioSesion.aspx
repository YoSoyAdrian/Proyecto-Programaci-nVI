<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="FerreteriaWeb.InicioSesion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="Scripts/main.js"></script>
    <style>
        html {
            height: 100%;
            
        }

        body {
            height: 100%;
            background-image: url("/Img/Fondo.jpg");
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover cover;
        }

      
    </style>


  <section class="modal-header text-center font-weight-bolder text-white-50 text-uppercase">
          
                    </section>
         <section class="modal-dialog text-center">
       
    </section>
<section class="modal-body text-center bg-dark col-sm-6" style="margin:0 30% 0 30%">
  
    <section class="form-group">
    <asp:Label ID="lblNombre" Font-Size="Large" CssClass="font-weight-bolder text-white" runat="server" Text="Correo Electronico"></asp:Label>
    </section>
    <section class="form-group">
         <asp:TextBox ID="txtUsuario"   CssClass="form-control"  runat="server" TextMode="Email"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Correo Electronico requerido" ControlToValidate="txtUsuario" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" style="font-size: medium; color: #CC0000" ></asp:RequiredFieldValidator>
    </section>
    <section class="form-group">
    <asp:Label ID="Label1" Font-Size="Large" CssClass="font-weight-bolder text-white" runat="server" Text="Contraseña"></asp:Label>
    </section>

     <section class="form-group">
         <asp:TextBox ID="txtPassword"  CssClass="form-control"  runat="server" TextMode="Password" ></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Contraseña requerida" ControlToValidate="txtPassword" ForeColor="White" SetFocusOnError="true" Display="Dynamic" style="font-size: medium; color: #CC0000" ></asp:RequiredFieldValidator>
    </section>
    <section class="form-group text-left">

        <asp:CheckBox ID="ChkMostrar" CssClass="form-check" runat="server" onclick="mostrarContra()" TextAlign="Right" Text="Mostrar Contraseña" ForeColor="White" Font-Size="Small" Font-Bold="true" />

    </section>
    <section class="form-group">
                <asp:Button ID="btnIngresar" CssClass="btn badge-dark btn-outline-danger form-control-sm font-weight-bold "  runat="server" Text="Ingresar" OnClick="btnIngresar_Click"  />
      </section>
    <section class="form-group">
        
           <asp:Label ID="lblValidacion" runat="server" ForeColor="Red" Font-Size="Medium" ></asp:Label>  
                     
    </section>

    </section>

</asp:Content>
