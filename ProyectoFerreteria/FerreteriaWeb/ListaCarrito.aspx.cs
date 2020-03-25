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


            DataTable dt = (DataTable)Session["pedido"];
            foreach (DataRow fila in dt.Rows)
            {
                DetallePedido pedido = new DetallePedido();
                Producto prod;
                pedido.idDetalle = Convert.ToInt32(fila["idDetalle"]);
                prod = ProductoLN.Obtener(Convert.ToInt32(fila["productos"]));
                pedido.productos.idProducto = prod.idProducto;
                pedido.productos.precio = prod.precio;
                pedido.productos.cantidad = prod.cantidad;
                pedido.productos.imagen = prod.imagen;
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
            Compra compra = new Compra();
            compra.pedidos = ObtenerPedido();
            DateTime fechaHoy = DateTime.Now;

            Cliente user = (Cliente)Session["Cliente"];
            compra.cliente = user;
            compra.fecha = fechaHoy;

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "Compra",
              "mensaje('Compra Productos','Compra registrada con éxito!','success')",
                true
                );
        }

        protected void btnAgregar_Command(object sender, CommandEventArgs e)
        {

        }



        protected void txtCantidad_TextChanged(object sender, EventArgs e)
        {
            carrito = (DataTable)Session["pedido"];
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

                    carrito.AcceptChanges();

                    Session["pedido"] = carrito;
                    grvListaCarrito.DataSource = ObtenerPedido();
                    grvListaCarrito.DataBind();
                }
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            GridViewRow currentRow = (GridViewRow)((Button)sender).Parent.Parent;


            carrito = (DataTable)Session["pedido"];
            carrito.Rows.RemoveAt(currentRow.RowIndex);
            carrito.AcceptChanges();
            Session["pedido"] = (DataTable)carrito;


            grvListaCarrito.DataSource = ObtenerPedido();
            grvListaCarrito.DataBind();
        }
    }


}
