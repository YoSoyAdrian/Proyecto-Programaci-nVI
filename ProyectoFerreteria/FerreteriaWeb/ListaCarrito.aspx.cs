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
    public partial class ListaCarrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            listaCarrito.DataSource = ObtenerProductos();
            listaCarrito.DataBind();

        }
        public List<DetallePedido> ObtenerProductos()
        {
            

            List<DetallePedido> lista = new List<DetallePedido>();

            DataTable dt = (DataTable)Session["pedido"];
            foreach (DataRow fila in dt.Rows)
            {
                DetallePedido pedido = new DetallePedido();
                Producto registro = new Producto();
                registro.idProducto = Convert.ToInt32(fila["idProducto"]);
                registro.nombre = fila["nombre"].ToString();
                registro.descripcion = fila["descripcion"].ToString();
                registro.precio = Convert.ToDecimal(fila["precio"]);
                registro.imagen = ProductoLN.Obtener(registro.idProducto).imagen;
                registro.cantidad = Convert.ToInt32(fila["cantidad"]);

                pedido.productos = registro;
                pedido.cantidad = registro.cantidad;
                pedido.subTotal = registro.precio * registro.cantidad;
                lista.Add(pedido);

            }
            return lista;
        }


        protected void btnEliminar_Command(object sender, CommandEventArgs e)
        {

        }

    }
}