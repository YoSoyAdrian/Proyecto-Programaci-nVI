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
                Session["prueba"] = dtb;
            }


        }

        protected void btnSeleccionar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Seleccionar" )
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
        public void filtro()
        {
            List<Producto> lista = new List<Producto>();

            if (rBtnJardin.Checked)
            {
                lista = ProductoLN.ObtenerXCategoria(1);
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
                        lista = ProductoLN.ObtenerXCategoria(3);
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