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
    public partial class ListaCarrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // El tipo devuelto puede ser modificado a IEnumerable, sin embargo, para ser compatible con la paginación y ordenación de 
        //, se deben agregar los siguientes parametros:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        

        protected void btnEliminar_Command(object sender, CommandEventArgs e)
        {

        }

        // El tipo devuelto puede ser modificado a IEnumerable, sin embargo, para ser compatible con la paginación y ordenación de 
        //, se deben agregar los siguientes parametros:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public List<Producto> listaCarrito_GetData()
        {
            return ProductoLN.ObtenerTodos();
        }
    }
}