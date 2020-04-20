using FerreteriaEntidad;
using FerreteriaLogica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FerreteriaWeb
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }

        }



        public List<Pedido> listaCompra_GetData()
        {
            Cliente user = (Cliente)Session["Cliente"];
            if (user != null)
            {
                return PedidoLN.ObtenerPedidosXCliente(user.idCliente);

            }
            else
            {
                return null;
            }
        }


        protected void LnkCupon_Command(object sender, CommandEventArgs e)
        {
            Panel1.Visible = true;
            
            if (e.CommandName == "Seleccionar")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                Cupon cupon = CuponLN.Obtener(id);
                Producto producto = ProductoLN.Obtener(cupon.producto.idProducto);

                lblNombreCupon.Text = cupon.nombre;
                lblDescripcion.Text = cupon.descripcion;
                lblDescuento.Text = cupon.descuento.ToString("₡{0:N0}");
                lblRango.Text = cupon.rango.nombre;
                imgCupon.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(producto.imagen);
            }
        }

      
    }
}
