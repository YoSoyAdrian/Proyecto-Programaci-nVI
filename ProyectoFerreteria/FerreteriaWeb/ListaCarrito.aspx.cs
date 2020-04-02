using FerreteriaEntidad;
using FerreteriaLogica;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace FerreteriaWeb
{
    public partial class ListaCarrito : System.Web.UI.Page
    {

        List<DetallePedido> lista;
        DataTable carrito = new DataTable();
        private static int codigo = 0;
        DataTable dtb;
        protected void Page_Load(object sender, EventArgs e)
        {

            carrito = (DataTable)Session["pedido"];
            if (!IsPostBack)
            {
                CargarDetalle();
                grvListaCarrito.DataSource = ObtenerPedido();
                grvListaCarrito.DataBind();
                Total();
            }

        }


        public void CargarDetalle()
        {
            if (Session["pedido"] == null)
            {
                dtb = new DataTable("Carrito");
                dtb.Columns.Add("idDetalle", System.Type.GetType("System.Int32"));
                dtb.Columns.Add("idProducto", System.Type.GetType("System.Int32"));
                dtb.Columns.Add("nombre");
                dtb.Columns.Add("precio");
                dtb.Columns.Add("cantidad");
                dtb.Columns.Add("subTotal");
                Session["pedido"] = dtb;
                Session["prueba"] = dtb;
            }
            else
            {
                Session["prueba"] = dtb;
            }

        }
        public List<DetallePedido> ObtenerPedido()
        {
            lista = new List<DetallePedido>();


            foreach (DataRow fila in carrito.Rows)
            {
                DetallePedido pedido = new DetallePedido();

                pedido.idDetalle = Convert.ToInt32(fila["idDetalle"]);

                pedido.productos.idProducto = Convert.ToInt32(fila["idProducto"]);
                pedido.productos.nombre = fila["nombre"].ToString();
                pedido.productos.precio = Convert.ToDecimal(fila["precio"]);
                pedido.cantidad = Convert.ToInt32(fila["cantidad"]);
                pedido.subTotal = Convert.ToDecimal(fila["subTotal"]);
                lista.Add(pedido);

            }

            return lista;
        }
        public void Total()
        {
            lista = new List<DetallePedido>();
            decimal subTotal = 0;
            decimal total = 0;
            foreach (DetallePedido detalle in ObtenerPedido())
            {
                subTotal += detalle.subTotal;
                total += detalle.subTotal;
            }

            txtSubTotal.Text = subTotal.ToString();
            txtTotal.Text = total.ToString();


        }



        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Cliente user = (Cliente)Session["Cliente"];
            if (user != null)
            {


                DateTime fechaHoy = DateTime.Now;
                if (codigo == 0)
                {

                    Compra compra = new Compra()
                    {
                        fecha = fechaHoy
                    };
                    CompraLN.Nuevo(compra);
                }


                foreach (var item in CompraLN.ObtenerTodos())
                {

                    codigo = item.idCompra;
                }

                foreach (DetallePedido detalle in ObtenerPedido())
                {
                    Pedido pedido = new Pedido();
                    pedido.producto = detalle.productos;
                    pedido.codigo = codigo;
                    pedido.cantidad = detalle.cantidad;
                    pedido.total = detalle.subTotal;

                    pedido.cliente = ClienteLN.Obtener(user.idCliente);
                    PedidoLN.Nuevo(pedido);

                }
                decimal total = PedidoLN.ObtenerTotalXCliente(user.idCliente);
                Rango rango = RangoLN.ObtenerXRango(total);
                ClienteLN.Actualizar(user.idCliente, rango.idRango);

                codigo = 0;
                carrito.Clear();
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "Compra",
                  "mensajeRedirect('Productos','Compra registrada con éxito!','success','PaginaPrincipal.aspx')",
                    true
                    );

            }
            else
            {
                Response.Redirect("InicioSesion.aspx");
            }
        }


        protected void btnAgregar_Command(object sender, CommandEventArgs e)
        {

        }



        protected void txtCantidad_TextChanged(object sender, EventArgs e)
        {

            //Obtener fila actual
            GridViewRow currentRow = (GridViewRow)((TextBox)sender).Parent.Parent;
            TextBox txtCantidad = (TextBox)currentRow.FindControl("txtCantidad");
            if (txtCantidad.Text != "")
            {

                int cantidad = Convert.ToInt32(txtCantidad.Text);
                int idDetalle = Convert.ToInt32(grvListaCarrito.DataKeys[currentRow.RowIndex].Values[0]);
                //Actualizar cantidad en la sesión del carrito

                DetallePedido d = ObtenerPedido().Find(x => x.idDetalle == idDetalle);
                if (d.cantidad != cantidad)
                {

                    foreach (DataRow rows in carrito.Rows)
                    {
                        if (Convert.ToInt32(rows[1]) == d.productos.idProducto)
                        {
                            rows.BeginEdit();
                            rows[4] = cantidad;
                            rows[5] = d.productos.precio * cantidad;
                            rows.EndEdit();


                        }
                        rows.AcceptChanges();
                    }



                    Total();
                    grvListaCarrito.DataSource = ObtenerPedido();
                    grvListaCarrito.DataBind();

                }
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            GridViewRow currentRow = (GridViewRow)((Button)sender).Parent.Parent;



            carrito.Rows.RemoveAt(currentRow.RowIndex);
            carrito.AcceptChanges();
            Session["pedido"] = (DataTable)carrito;
            dtb = (DataTable)Session["pedido"];
            Total();
            grvListaCarrito.DataSource = ObtenerPedido();
            grvListaCarrito.DataBind();
        }

        protected void ChkCupon_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkCupon.Checked)
            {
                lblCupon.Visible = true;
                txtCupon.Visible = true;
                btnCanjear.Visible = true;
            }
            else
            {
                lblCupon.Visible = false;
                txtCupon.Visible = false;
                btnCanjear.Visible = false;
            }
        }

        protected void btnCanjear_Click(object sender, EventArgs e)
        {
            if (txtCupon.Text != "")
            {
                int idCupon = Convert.ToInt32(txtCupon.Text);

            }
        }
    }


}
