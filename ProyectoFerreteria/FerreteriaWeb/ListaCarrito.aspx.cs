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
        DataTable carrito = new DataTable();
        DataTable dtb;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCarrito();
                CargarDetalle();

            }

        }
        public void CargarCarrito()
        {
            listaCarrito.DataSource = ObtenerPedido();
            listaCarrito.DataBind();
        }
        public void CargarDetalle()
        {
            if (Session["pedidoT"] == null)
            {
                dtb = new DataTable("CarritoT");
                dtb.Columns.Add("idDetalle", System.Type.GetType("System.Int32"));
                dtb.Columns.Add("productos", System.Type.GetType("System.Int32"));
                dtb.Columns.Add("cantidad");
                dtb.Columns.Add("subTotal");
                Session["pedidoT"] = dtb;
                Session["pruebaT"] = dtb;
            }
            else
            {
                Session["pruebaT"] = dtb;
            }

        }
        public List<DetallePedido> ObtenerPedido()
        {

            List<DetallePedido> lista = new List<DetallePedido>();

            DataTable dt = (DataTable)Session["pedido"];
            foreach (DataRow fila in dt.Rows)
            {
                DetallePedido pedido = new DetallePedido();
                Producto prod = new Producto();
                pedido.idDetalle = Convert.ToInt32(fila["idDetalle"]);
                prod = ProductoLN.Obtener(Convert.ToInt32(fila["productos"]));
                pedido.productos = prod;

                pedido.cantidad = Convert.ToInt32(fila["cantidad"]);
                pedido.subTotal = Convert.ToDecimal(fila["subTotal"]);
                lista.Add(pedido);

            }
            return lista;
        }
        public void Total()
        {
            decimal subTotal = 0;
            decimal total = 0;
            foreach (DetallePedido detalle in ObtenerPedido())
            {
                subTotal += detalle.subTotal;
                total = detalle.subTotal;
            }
            ContentPlaceHolder cph = (ContentPlaceHolder)this.Master.FindControl("ContentPlaceHolder1");
            TextBox txtTotal = ((TextBox)cph.FindControl("txtTotal"));
            txtSubTotal.Text = subTotal.ToString();
            txtTotal.Text = total.ToString();


        }

        protected void btnEliminar_Command(object sender, CommandEventArgs e)
        {
            int indice = Convert.ToInt32(e.CommandArgument);
            DetallePedido d = ObtenerPedido().Find(x => x.productos.idProducto == indice);


            List<DetallePedido> lista = new List<DetallePedido>();


            DataTable dt = (DataTable)Session["pedido"];

            carrito = (DataTable)Session["pedidoT"];
            foreach (DataRow fila in dt.Rows)
            {
                DetallePedido pedido = new DetallePedido();
                Producto prod = new Producto();
                pedido.idDetalle = Convert.ToInt32(fila["idDetalle"]);
                prod = ProductoLN.Obtener(Convert.ToInt32(fila["productos"]));
                pedido.productos = prod;
                if (pedido.productos.idProducto != d.productos.idProducto)
                {
                    pedido.cantidad = Convert.ToInt32(fila["cantidad"]);
                    pedido.subTotal = Convert.ToDecimal(fila["subTotal"]);
                    lista.Add(pedido);
                }

            }
            dt.Clear();
            dt.AcceptChanges();
            foreach (DetallePedido detalle in lista)
            {
                if (detalle.productos.idProducto != d.productos.idProducto)
                {
                    DataRow fila1 = carrito.NewRow();
                    fila1[0] = (int)detalle.idDetalle;
                    fila1[1] = (int)detalle.productos.idProducto;
                    fila1[2] = (int)detalle.cantidad;
                    fila1[3] = (decimal)detalle.subTotal;
                    carrito.Rows.Add(fila1);
                }

            }
            Session["pedido"] = carrito;

            CargarCarrito();
        }


        protected void txtCantidad_TextChanged(object sender, EventArgs e)
        {
            Total();



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

        protected void listaCarro_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

      
    }

}
