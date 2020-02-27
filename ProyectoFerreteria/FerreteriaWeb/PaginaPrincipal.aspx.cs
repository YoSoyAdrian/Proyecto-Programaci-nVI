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
        DataTable dtb;
        DataTable carrito = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            CargarDetalle();
        }
        public void CargarDetalle()
        {
            if (Session["pedido"] == null)
            {
                dtb = new DataTable("Carrito");
                dtb.Columns.Add("idProducto", System.Type.GetType("System.Int32"));
                dtb.Columns.Add("nombre");
                dtb.Columns.Add("descripcion");
                dtb.Columns.Add("precio");
                dtb.Columns.Add("cantidad");
                Session["pedido"] = dtb;
                Session["prueba"] = dtb;
            }
            else
            {
                Session["pedido"] = Session["prueba"];
            }


        }

        protected void btnSeleccionar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Seleccionar")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Producto producto = ProductoLN.Obtener(id);
                carrito = (DataTable)Session["pedido"];
                DataRow fila = carrito.NewRow();
                fila[0] = (int)producto.idProducto;
                fila[1] = producto.nombre;
                fila[2] = producto.descripcion;
                fila[3] = (decimal)producto.precio;
                fila[4] = (int)producto.cantidad;
                carrito.Rows.Add(fila);
                Session["pedido"] = carrito;
                ClientScript.RegisterStartupScript(this.GetType(), "Carrito",
      "mensajeConfirm('Agregado correctamente')", true);
            }

        }
        public int AgregarCantidad(int id)
        {
            DataTable dt = (DataTable)Session["pedido"];
            foreach (DataRow fila in dt.Rows)
            {
                int cantidad = 1;
                if (Convert.ToInt32(fila[0]) == id)
                {
                    return cantidad++;
                }
            }
            return 1;
        }
        public List<Producto> listaProductos_GetData()
        {
            return ProductoLN.ObtenerTodos();
        }


    }
}