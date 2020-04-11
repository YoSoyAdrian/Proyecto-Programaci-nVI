using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FerreteriaEntidad;
using FerreteriaLogica;

namespace FerreteriaWeb
{
    public partial class PaginaPrincipal : System.Web.UI.Page
    {
        DetallePedido pedido = new DetallePedido();
        DataTable dtb;
        DataTable carrito = new DataTable();
        static int nPedido = 1;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                rBtnJardin.Checked = false;
                rBtnPlomeria.Checked = false;
                rBtnPintura.Checked = false;
                CargarDetalle();
                filtro();
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
        public List<DetallePedido> obtenerPedido()
        {
            List<DetallePedido> detalle = new List<DetallePedido>();
            DataTable dp = (DataTable)Session["pedido"];
            foreach (DataRow fila in dp.Rows)
            {
                DetallePedido pedidoS = new DetallePedido();

                pedidoS.idDetalle = Convert.ToInt32(fila["idDetalle"]);
                pedidoS.productos.idProducto = Convert.ToInt32(fila["idProducto"]);
                pedidoS.productos.nombre = fila["nombre"].ToString();
                pedidoS.productos.precio = Convert.ToDecimal(fila["precio"]);
                pedidoS.cantidad = Convert.ToInt32(fila["cantidad"]);
                pedidoS.subTotal = Convert.ToDecimal(fila["subTotal"]);
                detalle.Add(pedidoS);

            }
            return detalle;
        }

        protected void btnSeleccionar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Seleccionar")
            {

                int id = int.Parse(e.CommandArgument.ToString());
                Producto producto = ProductoLN.Obtener(id);
                DataTable dt = (DataTable)Session["pedido"];//*
                carrito = (DataTable)Session["pedido"];
                pedido.idDetalle = nPedido++;
                pedido.productos.idProducto = producto.idProducto;
                pedido.productos.precio = producto.precio;
                pedido.productos.nombre = producto.nombre;
                pedido.cantidad = 1;
                pedido.subTotal = pedido.productos.precio * pedido.cantidad;


                if (obtenerPedido().Exists(x => x.productos.idProducto == id))
                {

                    DetallePedido d = obtenerPedido().Find(x => x.productos.idProducto == id);
                    if (d != null)
                    {



                        foreach (DataRow row in carrito.Rows)
                        {
                            if (Convert.ToInt32(row[1]) == id)
                            {
                                row.BeginEdit();
                                row[4] = d.cantidad = 1 + Convert.ToInt32(row[4]);
                                row[5] = d.subTotal = d.productos.precio * d.cantidad;
                            }
                        }
                        carrito.AcceptChanges();

                    }
                }
                else
                {
                    DataRow fila = carrito.NewRow();
                    fila[0] = (int)pedido.idDetalle;
                    fila[1] = (int)pedido.productos.idProducto;
                    fila[2] = (String)pedido.productos.nombre;
                    fila[3] = (decimal)pedido.productos.precio;
                    fila[4] = (int)pedido.cantidad;
                    fila[5] = (decimal)pedido.subTotal;
                    carrito.Rows.Add(fila);
                    Session["pedido"] = carrito;

                }

                ClientScript.RegisterStartupScript(this.GetType(), "Carrito",
      "mensajeConfirm('Agregado correctamente')", true);
            }


        }

        public void filtro()
        {
            List<Producto> lista;

            if (rBtnJardin.Checked)
            {
                lista = ProductoLN.ObtenerXCategoria(3);
            }
            else
            {
                if (rBtnPintura.Checked)
                {
                    lista = ProductoLN.ObtenerXCategoria(2);
                }
                else
                {
                    if (rBtnPlomeria.Checked)
                    {
                        lista = ProductoLN.ObtenerXCategoria(1);
                    }
                    else
                    {
                        lista = ProductoLN.ObtenerTodos();
                    }

                }
            }
            listaProductos.DataSource = lista;
            if (!IsCallback)
            {
                listaProductos.DataBind();
            }

        }
        protected void rBtnPintura_CheckedChanged(object sender, EventArgs e)
        {
            filtro();
        }

        protected void rBtnPlomeria_CheckedChanged(object sender, EventArgs e)
        {
            filtro();
        }

        protected void rBtnJardin_CheckedChanged(object sender, EventArgs e)
        {
            filtro();
        }

        public List<Producto> listaProductos_GetData()
        {

            return ProductoLN.ObtenerTodos();
        }


    }

}