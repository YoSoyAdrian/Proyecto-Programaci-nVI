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

        public List<Compra> ObtenerCompra()
        {

            List<Compra> lista = CompraLN.ObtenerTodos();


            return lista;
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
    }
}
