<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="CuponCliente.aspx.cs" Inherits="FerreteriaWeb.CuponCliente" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/sweetalert2.min.css" rel="stylesheet" />
    <style>
        .ddlCliente li {
            text-align: center;
        }
    </style>
    <div class="container-xl">
        <div class="text-center border-bottom border-primary form-group">
            <h2>Cupones</h2>
        </div>

        <div class="row form-group">
            <div class="col-xl-12">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#Nuevo">Crear cupón</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#Asignar">Cupones sin asignar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#Asignados">Cupones asignados</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#Usados">Cupones Usados</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Tab panes -->
        <div class="tab-content">
            <div id="Nuevo" class="container tab-pane active form-group">

                <div class="row container-md">
                    <div class="col-xl-10">
                        <div class="form-group row">
                            <div class="col-xl-2 form-group">
                                <asp:Label ID="Label1" runat="server" CssClass="col-sm-2 col-form-label" Text="Nombre">Nombre</asp:Label>
                            </div>
                            <div class="col-sm-10 col-xl-10 form-group">
                                <asp:TextBox ID="txtNombre" TextMode="SingleLine" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1"
                                    runat="server"
                                    ErrorMessage="El nombre es requerido*"
                                    ControlToValidate="txtNombre"
                                    ForeColor="Red"
                                    ValidationGroup="Registrar"
                                    SetFocusOnError="true"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-xl-2 form-group">
                                <asp:Label ID="Label2" runat="server" CssClass="col-sm-2 col-form-label" Text="Descripción"></asp:Label>
                            </div>
                            <div class="col-sm-10 col-xl-10 form-group ">
                                <asp:TextBox ID="txtDescripcion" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator2"
                                    runat="server"
                                    ErrorMessage="La descripción es requerida*"
                                    ControlToValidate="txtDescripcion"
                                    ForeColor="Red"
                                    ValidationGroup="Registrar"
                                    SetFocusOnError="true"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="validarDescripcion"
                                    runat="server"
                                    ErrorMessage="La descripción debe tener al menos 3 caracteres"
                                    ControlToValidate="txtDescripcion"
                                    OnServerValidate="validarDescripcion_ServerValidate"
                                    ForeColor="Red"
                                    ValidationGroup="Registrar"
                                    SetFocusOnError="true"
                                    Display="Dynamic"></asp:CustomValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-xl-2 form-group">
                                <asp:Label ID="Label3" runat="server" CssClass="col-sm-2 col-form-label" Text="Rango"></asp:Label>
                            </div>
                            <div class="col-sm-10 col-xl-10 form-group">
                                <%-- Rangos--%>
                                <asp:DropDownList ID="ddlRango" DataTextField="nombre" DataValueField="idRango" ValidationGroup="Registrar" CssClass="form-control form-group" runat="server"></asp:DropDownList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="Registrar" runat="server" ErrorMessage="*Seleccione un rango" ControlToValidate="ddlRango" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-xl-2 form-group">
                                <asp:Label ID="Label4" runat="server" CssClass="col-sm-2 col-form-label" Text="Producto"></asp:Label>
                            </div>

                            <div class="col-sm-10 col-xl-10 form-group">
                                <%-- Productos--%>
                                <asp:DropDownList ID="ddlProducto" DataTextField="nombre" ValidationGroup="Registrar" DataValueField="idProducto" CssClass="form-control" runat="server"></asp:DropDownList>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Registrar" runat="server" ErrorMessage="*Seleccione un producto" ControlToValidate="ddlProducto" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" Style="font-size: medium; color: #CC0000"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-xl-2 form-group">
                                <asp:Label ID="Label5" runat="server" CssClass="col-sm-2 col-form-label" Text="Cantidad"></asp:Label>
                            </div>
                            <div class="col-sm-10 col-xl-10 form-group">
                                <asp:TextBox ID="txtCantidad" CssClass="form-control" runat="server" ValidationGroup="Registrar" Text="1" TextMode="Number"></asp:TextBox>

                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator4"
                                    runat="server"
                                    ErrorMessage="La cantidad es requerida*"
                                    ControlToValidate="txtCantidad"
                                    ForeColor="Red" InitialValue="0"
                                    SetFocusOnError="true"
                                    ValidationGroup="Registrar"
                                    Display="Dynamic"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="row  form-group">
                            <div class="col-xl-12 row">
                                <div class="custom-control custom-radio col-xl-2 mr-3">
                                    <asp:RadioButton ID="rbtnDescuento" GroupName="rbtn" ValidationGroup="Registrar" runat="server" OnCheckedChanged="rbtnDescuento_CheckedChanged" Text="Descuento" CssClass="custom-radio" AutoPostBack="true" />
                                </div>

                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="row" >
                                        <div class="col-xl-4">
                                            <asp:TextBox ID="txtDescuento" Visible="false" CssClass="form-inline border " runat="server"></asp:TextBox>

                                        </div>
                                        <div class="col-xl-8">
                                            <asp:Label ID="LblDescuento" Visible="false" runat="server" Text="Escriba la cantidad de descuento del cupón" CssClass="text-warning"></asp:Label>
                                        </div>
                                            </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="rbtnDescuento" EventName="CheckedChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="rbtnRegalia" EventName="CheckedChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>


                                <div class="custom-control custom-radio custom-control-inline col-xl-12">
                                    <asp:RadioButton ID="rbtnRegalia" Text="Regalía" GroupName="rbtn" AutoPostBack="true" OnCheckedChanged="rbtnRegalia_CheckedChanged" runat="server" CssClass="custom-radio" />
                                </div>
                            </div>
                        </div>

                        <div class="form-group text-center">
                            <asp:Button ID="btnRegistrar" OnClick="btnRegistrar_Click" CssClass="btn btn-primary" runat="server" CausesValidation="true" ValidationGroup="Registrar" Text="Registrar" />
                        </div>

                    </div>

                </div>
            </div>

            <div id="Asignar" class="container-xl container-md tab-pane fade">
                <div class="row">
                    <div class="col-xl-10 col-sm-6 col-md-6">
                        <h2>Cupones</h2>
                    </div>
                    <div class="col-xl-2 col-sm-6 col-md-6 form-group ">
                        <asp:Button ID="btnGuardar" runat="server" Text="Registrar" CssClass="btn btn-primary" OnCommand="btnGuardar_Command" />
                    </div>
                </div>
                <asp:UpdatePanel ID="UpdatePanelCupon" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:GridView ID="grvCuponSin" runat="server" CssClass="table table-bordered" SelectMethod="grvCuponSin_GetData" OnRowDataBound="grvCuponSin_RowDataBound" AutoGenerateColumns="False" DataKeyNames="idCupon">

                            <Columns>
                                <asp:BoundField HeaderText="Nombre" DataField="nombre"></asp:BoundField>
                                <asp:BoundField HeaderText="Producto" DataField="producto.nombre"></asp:BoundField>
                                <asp:BoundField DataField="rango.nombre" HeaderText="Nivel"></asp:BoundField>
                                <asp:TemplateField HeaderText="Asignar Cliente" ControlStyle-CssClass="text-center form-control " HeaderStyle-CssClass="text-center">

                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlCliente" runat="server" DataValueField="idCliente" DataTextField="nombre" OnSelectedIndexChanged="ddlCliente_SelectedIndexChanged"></asp:DropDownList>

                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Command" />
                        <asp:PostBackTrigger ControlID="grvCuponCon" />

                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <div id="Asignados" class="container-xl container-md tab-pane fade">
                    <h3>Cupones asignados a los clientes</h3>
                <asp:UpdatePanel ID="updatePanel2" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:GridView ID="grvCuponCon" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="idCuponCliente" SelectMethod="grvCuponCon_GetData">

                            <Columns>
                                <asp:BoundField HeaderText="Nombre" DataField="nombre"></asp:BoundField>
                                <asp:BoundField HeaderText="Producto" DataField="producto.nombre"></asp:BoundField>
                                <asp:BoundField DataField="cliente.nombre" HeaderText="Cliente"></asp:BoundField>

                                <asp:BoundField DataField="cliente.correo" HeaderText="Correo"></asp:BoundField>
                                <asp:TemplateField HeaderText="Activo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">

                                    <EditItemTemplate>
                                        <asp:CheckBox runat="server" Checked='<%# Bind("estado") %>' AutoPostBack="true" OnCheckedChanged="chkEstado_CheckedChanged" ID="ChkEstado"></asp:CheckBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" Checked='<%# Bind("estado") %>' AutoPostBack="true" OnCheckedChanged="chkEstado_CheckedChanged" ID="ChkEstado"></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="grvCupon" EventName="RowEditing" />
                        <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Command" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>

            <div id="Usados" class="container-xl tab-pane fade">
                <div class="row">
                    <div class="col-xl-12">
                        <h6>Búsqueda de Cliente</h6>
                    </div>
                    <div class="col-xl-12 form-group">
                        <input class="form-control" id="myInput" type="text" placeholder="Escriba el correo del cliente..." />
                    </div>
                </div>
                <h3>Cupones canjeados por los clientes</h3>
                <asp:UpdatePanel ID="updatePanelCuponCliente" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:GridView ID="grvCupon" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="idCuponCliente" SelectMethod="grvCupon_GetData">

                            <Columns>
                                <asp:BoundField HeaderText="Nombre" DataField="nombre"></asp:BoundField>
                                <asp:BoundField HeaderText="Producto" DataField="producto.nombre"></asp:BoundField>
                                <asp:BoundField DataField="cliente.nombre" HeaderText="Cliente"></asp:BoundField>

                                <asp:BoundField DataField="cliente.correo" HeaderText="Correo"></asp:BoundField>
                                <asp:TemplateField HeaderText="Activo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">

                                    <EditItemTemplate>
                                        <asp:CheckBox runat="server" Checked='<%# Bind("estado") %>' AutoPostBack="true" OnCheckedChanged="chkEstado_CheckedChanged" ID="ChkEstado"></asp:CheckBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" Checked='<%# Bind("estado") %>' AutoPostBack="true" OnCheckedChanged="chkEstado_CheckedChanged" ID="ChkEstado"></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="grvCupon" EventName="RowEditing" />
                        <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Command" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <script src="Scripts/mensaje.js"></script>
    <script src="Scripts/sweetalert2.min.js"></script>
     <script src="Scripts/Scripts.js"></script>

</asp:Content>
