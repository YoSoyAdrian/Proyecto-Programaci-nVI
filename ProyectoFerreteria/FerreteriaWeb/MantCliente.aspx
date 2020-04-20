<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="MantCliente.aspx.cs" Inherits="FerreteriaWeb.MantCliente" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/sweetalert2.min.css" rel="stylesheet" />
    <div class="row col-12 pt-xl-4">
        <div class="col-xl-6">
            <div class="box-header text-center">
                <h3 class="box-title">Nuevo Usuario</h3>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-xl-6">
                        <div class="form-group">
                            <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="registrar" runat="server" ErrorMessage="*El nombre es requerido" ControlToValidate="txtNombre" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Identificación"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtIdentificacion" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="registrar" runat="server" ErrorMessage="*La identificación es requerida" ControlToValidate="txtIdentificacion" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-xl-6">

                        <div class="form-group">
                            <asp:Label ID="lblApellido" runat="server" Text="Apellido"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="registrar" runat="server" ControlToValidate="txtApellido" ErrorMessage="*El apellido es requerido" ForeColor="White" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="col-xl-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" runat="server" Text="Teléfono"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="registrar" runat="server" ErrorMessage="*El número de telefono es requerido" ControlToValidate="txtTelefono" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" runat="server" Text="Correo elctrónico"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="registrar" runat="server" ErrorMessage="*El correo electrónico requerido" ControlToValidate="txtCorreo" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="form-group">
                            <asp:Label ID="Label5" runat="server" Text="Dirección"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="registrar" runat="server" ErrorMessage="*La dirección es requerida" ControlToValidate="txtDireccion" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class=" col-xl-6">
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="Contraseña"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="registrar" ID="RequiredFieldValidator7" runat="server" ErrorMessage="*La contraseña es requerida" ControlToValidate="txtPassword" ForeColor="White" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="col-xl-6 align-self-end">
                        <div class="form-group text-left col-xl-12 ">
                            <asp:CheckBox ID="ChkMostrar"  CssClass="form-check" runat="server" onclick="mostrarContrasena()" TextAlign="Right" Text="Mostrar Contraseña" />
                        </div>
                    </div>
                </div>
                 
                <div class="row">
                    <div class="col-xl-12">
                        <div class="form-group container col-xl-6">
                            <asp:Button ID="btnRegistrar" ValidationGroup="registrar" runat="server" CssClass="btn btn-info form-control" Text="Registrar" OnClick="btnRegistrar_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-6 col-sm-10">
            <div class="box box-primary">
                <div class="box-header text-center">
                    <h3 class="box-title">Lista de Usuarios</h3>
                </div>
                <div class="box-body table-responsive">
                    <asp:GridView ID="GrvListCliente" CssClass="table table-bordered table-hover dataTable" DataKeyNames="idCliente" runat="server" AutoGenerateColumns="False">

                        <Columns>
                            <asp:BoundField DataField="nombre" HeaderText="Nombre"></asp:BoundField>
                            <asp:BoundField DataField="identificacion" HeaderText="Identificaci&#243;n"></asp:BoundField>
                            <asp:BoundField DataField="telefono" HeaderText="Teléfono" SortExpression="telefono"></asp:BoundField>
                            <asp:BoundField DataField="correo" HeaderText="Correo"></asp:BoundField>


                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>


    </div>
    <script src="Scripts/sweetalert2.min.js"></script>
    <script src="Scripts/mensaje.js"></script>
</asp:Content>
