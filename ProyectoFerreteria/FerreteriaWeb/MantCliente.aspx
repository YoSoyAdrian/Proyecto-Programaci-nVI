<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="MantCliente.aspx.cs" Inherits="FerreteriaWeb.MantCliente" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
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
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Identificación"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtIdentificacion" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xl-6">

                        <div class="form-group">
                            <asp:Label ID="lblApellido" runat="server" Text="Apellido"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-xl-6">
                        <div class="form-group">
                            <asp:Label ID="Label3" runat="server" Text="Teléfono"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="form-group">
                            <asp:Label ID="Label4" runat="server" Text="Correo Electronico"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="Correo" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="form-group">
                            <asp:Label ID="Label5" runat="server" Text="Dirección"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="Direccion" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xl-12">
                        <div class="form-group ">
                            <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-info form-control"  Text="Registrar" />
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

</asp:Content>
