using System;
using System.Collections.Generic;
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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

     
        public List<Producto> listaProductos_GetData()
        {
              
            return ProductoLN.ObtenerTodos();
        }

      
    }
}