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

        DataTable dtb;
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarDetalle();
            carrito = (DataTable)Session["pedido"];
            if (!IsPostBack)
            {

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
                dtb.Columns.Add("productos", System.Type.GetType("System.Int32"));
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
                Producto prod;
                pedido.idDetalle = Convert.ToInt32(fila["idDetalle"]);
                prod = ProductoLN.Obtener(Convert.ToInt32(fila["productos"]));
                pedido.productos.idProducto = prod.idProducto;
                pedido.productos.precio = prod.precio;
                pedido.productos.cantidad = prod.cantidad;
                pedido.productos.imagen = prod.imagen;
                pedido.productos.nombre = prod.nombre;
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

                Pedido pedido = new Pedido();
                foreach (DetallePedido detalle in ObtenerPedido())
                {

                    pedido.producto.idProducto = detalle.productos.idProducto;
                    pedido.cantidad = detalle.cantidad;
                    pedido.total = detalle.subTotal;
                    pedido.cliente = user;
                    PedidoLN.Nuevo(pedido);

                    Compra compra = new Compra();
                    compra.pedido = PedidoLN.Obtener(pedido.idPedido);
                    compra.fecha = fechaHoy;
                    CompraLN.Nuevo(compra);

                }

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "Compra",
                  "mensaje('Productos','Compra registrada con éxito!','success')",
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
                            rows[2] = cantidad;
                            rows[3] = d.productos.precio * cantidad;
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

        }
    }


}
