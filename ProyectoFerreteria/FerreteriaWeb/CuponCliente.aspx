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
                        <a class="nav-link" data-toggle="tab" href="#Asignar">Asignar Cliente</a>
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

                <div class="row">
                    <div class="col-xl-12">
                        <fieldset>

                            <div class="form-group row">
                                <div class="col-xl-2">
                                    <asp:Label ID="Label1" runat="server" CssClass="col-sm-2 col-form-label" Text="Nombre">Nombre</asp:Label>
                                </div>
                                <div class="col-sm-10 col-xl-10">
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
                                <div class="col-xl-2">
                                    <asp:Label ID="Label2" runat="server" CssClass="col-sm-2 col-form-label" Text="Descripción"></asp:Label>
                                </div>
                                <div class="col-sm-10 col-xl-10">
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
                                    <asp:DropDownList ID="ddlRango" DataTextField="nombre" DataValueField="idRango" ValidationGroup="Registrar" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col-xl-2 form-group">
                                    <asp:Label ID="Label4" runat="server" CssClass="col-sm-2 col-form-label" Text="Producto"></asp:Label>
                                </div>

                                <div class="col-sm-10 col-xl-10 form-group">
                                    <%-- Productos--%>
                                    <asp:DropDownList ID="ddlProducto" DataTextField="nombre" ValidationGroup="Registrar" DataValueField="idProducto" CssClass="form-control" runat="server"></asp:DropDownList>

                                </div>
                            </div>
                            <div class="row form-group justify-content-center">
                                <div class="col-xl-3 col-sm-12 text-center ">
                                    <asp:RadioButton ID="rdbDescuento" Text=" " GroupName="rdBtn" ValidationGroup="Registrar" CssClass="custom-radio " runat="server" />
                                    <asp:Label ID="Label7" runat="server" Text="Descuento"></asp:Label>
                                </div>
                                <div class="col-xl-3 col-sm-12 text-center ">
                                    <asp:RadioButton ID="rdbRegalia" CssClass="custom-radio " GroupName="rdBtn" Text=" " ValidationGroup="Registrar" runat="server" />
                                    <asp:Label ID="Label6" runat="server" Text="Regalía"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-xl-2">
                                    <asp:Label ID="Label5" runat="server" CssClass="col-sm-2 col-form-label" Text="Cantidad"></asp:Label>
                                </div>
                                <div class="col-sm-10 col-xl-10">
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
                            <div class="form-group text-center">
                                <asp:Button ID="btnRegistrar" OnClick="btnRegistrar_Click" CssClass="btn btn-primary" runat="server" CausesValidation="true" ValidationGroup="Registrar" Text="Registrar" />
                            </div>
                        </fieldset>
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
                <asp:UpdatePanel ID="UpdatePanelCupon" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:GridView ID="grvCuponSin" runat="server" CssClass="table table-bordered" SelectMethod="grvCuponSin_GetData" OnRowDataBound="grvCuponSin_RowDataBound" AutoGenerateColumns="False" DataKeyNames="idCupon" >

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
                <h3>Cupones utilizados</h3>
                <asp:UpdatePanel ID="updatePanelCuponCliente" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:GridView ID="grvCupon" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="idCuponCliente" >

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

</asp:Content>
