using FerreteriaLogica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FerreteriaWeb
{
    public partial class MantCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ActualizarDatos();
            }
        }
        public void ActualizarDatos()
        {
            GrvListCliente.DataSource = ClienteLN.ObtenerTodos();
            GrvListCliente.DataBind();
            
        }
    }
}