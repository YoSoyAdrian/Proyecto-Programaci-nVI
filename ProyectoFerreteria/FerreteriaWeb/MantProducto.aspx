<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="MantProducto.aspx.cs" Inherits="FerreteriaWeb.MantProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-xl-6">
            <fieldset>
                <legend>Mantenimiento de Productos</legend>
                <div class="form-group row">
                    <asp:Label ID="Label1" runat="server" CssClass="col-sm-2 col-form-label" Text="Nombre">Nombre</asp:Label>
                    <div class="col-sm-10">
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
                    <asp:Label ID="Label2" runat="server" CssClass="col-sm-2 col-form-label" Text="Nombre">Descripción</asp:Label>
                    <div class="col-sm-10">
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

                    <asp:Label ID="Label3" runat="server" CssClass="col-sm-2 col-form-label" Text="Categoría">Categoría</asp:Label>

                    <div class="col-sm-10">
                        <%-- CATEGORIA--%>
                        <asp:DropDownList ID="ddlCategoria" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" CssClass="form-control" runat="server"></asp:DropDownList>

                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="Label5" runat="server" CssClass="col-sm-2 col-form-label" Text="Precio">Precio</asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtPrecio" CssClass="form-control" runat="server" Text="1" TextMode="Number"></asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4"
                            runat="server"
                            ErrorMessage="El precio es requerido*"
                            ControlToValidate="txtPrecio"
                            ForeColor="Red" InitialValue="0"
                            SetFocusOnError="true"
                            ValidationGroup="Registrar"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                        <%--     <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                            runat="server"
                            ErrorMessage="El precio solo debe contener números"
                            ControlToValidate="txtPrecio"
                            ValidationExpression="[0-9]"
                            ForeColor="Red"
                            SetFocusOnError="true"
                            ValidationGroup="Registrar"
                            Display="Dynamic">
                        </asp:RegularExpressionValidator>--%>
                    </div>
                </div>
                <div class="form-group row">
                    <asp:Label ID="Label4" runat="server" CssClass="col-sm-2 col-form-label" Text="Precio">Imagen</asp:Label>
                    <asp:Image ID="iVerImagen" runat="server" />
                    <asp:FileUpload ID="fuploadImagen" runat="server" accept=".png" CssClass="form-control" />


                </div>
                <div class="text-center">
                    <asp:Button ID="btnRegistrar" OnClick="btnRegistrar_Click" CssClass="btn btn-primary form-group" runat="server" Text="Registrar" />
                </div>
            </fieldset>
        </div>
        <div class="col-xl-6">
            <asp:GridView ID="grvListado" CssClass="table text-justify table-bordered text-center" OnRowCommand="grvListado_RowCommand" DataKeyNames="idProducto" runat="server" AutoGenerateColumns="False" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                <Columns>

                    <asp:BoundField DataField="nombre" HeaderText="Nombre" ItemStyle-CssClass="align-middle" />
                    <asp:BoundField DataField="precio" DataFormatString=" ₡{0:N0}" HeaderText="Precio" ItemStyle-CssClass="align-middle" />
                    <asp:BoundField DataField="categoria.nombre" HeaderText="Categoría" ItemStyle-CssClass="align-middle" />
                    <asp:TemplateField HeaderText="Cupón">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnShowModal" runat="server" CommandName="cupon" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ImageUrl="~/Img/cupon.png" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <EditRowStyle BackColor="#999999"></EditRowStyle>

                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
            </asp:GridView>

            <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">
                                        <asp:Label ID="lblModalTitle" runat="server" Text=""></asp:Label></h4>
                                </div>
                                <div class="modal-body">
                                    <asp:Label ID="lblModalBody" runat="server" Text=""></asp:Label>
                                    <asp:TextBox ID="txtNombProducto" runat="server"></asp:TextBox>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
