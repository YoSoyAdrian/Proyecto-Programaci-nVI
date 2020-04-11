using FerreteriaEntidad;
using FerreteriaLogica;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FerreteriaWeb
{
    public partial class CuponCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ActualizarRango();
                ActualizarProducto();
                CargarCuponCliente();
            }


        }
        public void ActualizarRango()
        {
            ddlRango.DataSource = RangoLN.ObtenerTodos();
            ddlRango.DataBind();
        }
        public void ActualizarProducto()
        {

            ddlProducto.DataSource = ProductoLN.ObtenerTodos();
            ddlProducto.DataBind();

        }

        protected void ddlRango_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void validarDescripcion_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = args.Value.Length >= 3;
        }
        protected static int Random()
        {
            int value = 0;
            for (int i = 0; i <= 10; i++)
            {
                var guid = Guid.NewGuid();
                var justNumbers = new String(guid.ToString().Where(Char.IsDigit).ToArray());
                var seed = int.Parse(justNumbers.Substring(0, 4));

                var random = new Random(seed);
                value = random.Next(0, 9999);


            }
            return value;
        }
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (txtCantidad.Text != "" && txtDescripcion.Text != "" && txtNombre.Text != "")
            {
                Cupon cupon = new Cupon()
                {
                    idCupon = Random(),
                    nombre = txtNombre.Text,
                    descripcion = txtDescripcion.Text,
                    cantidad = Convert.ToInt32(txtCantidad.Text),
                    estado = true
                };
                cupon.producto.idProducto = Convert.ToInt32(ddlProducto.SelectedValue);
                cupon.rango.idRango = Convert.ToInt32(ddlRango.SelectedValue);
                CuponLN.Nuevo(cupon);


                ClientScript.RegisterStartupScript(this.GetType(), "Carrito",
        "mensajeConfirm('Agregado correctamente')", true);
                Response.Redirect("CuponCliente.aspx");

                txtCantidad.Text = "";
                txtDescripcion.Text = "";
                txtNombre.Text = "";
            }
        }
        public void CargarCuponCliente()
        {
            grvCupon.DataSource = CuponLN.ObtenerTodosCliente();
            grvCupon.DataBind();
        }


        protected void btnCrear_Click(object sender, EventArgs e)
        {

        }

        protected void btnAsignar_Click(object sender, EventArgs e)
        {

        }

        protected void chkEstado_CheckedChanged(object sender, EventArgs e)
        {


            GridViewRow currentRow = (GridViewRow)((CheckBox)sender).Parent.Parent;
            CheckBox estado = (CheckBox)currentRow.FindControl("ChkEstado");
            bool activo = estado.Checked;
            int idCupon = Convert.ToInt32(grvCupon.DataKeys[currentRow.RowIndex].Values[0]);
            CuponLN.ActualizarEstadoCuponCliente(activo, idCupon);
            ClientScript.RegisterStartupScript(this.GetType(), "Carrito",
  "mensajeConfirm('Actualizado correctamente')", true);
        }

        // El nombre de parámetro del id. debe coincidir con el valor DataKeyNames establecido en el control
    

        protected void grvCuponSin_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void grvCuponSin_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if ((e.Row.RowType == DataControlRowType.DataRow))
            {
                // DataRow Vale las row que tienen datos, de esta manera se saltea el header,el footer y el pager
                DropDownList ddl;
                int id = Convert.ToInt32(grvCuponSin.DataKeys[e.Row.RowIndex].Value);
                // Celda 1 es donde esta el DropdownList
                GridViewRow gvrow = ((GridViewRow)(e.Row.Cells[3].NamingContainer));
                ddl = ((DropDownList)(gvrow.FindControl("ddlCliente")));

                Cupon cupon = CuponLN.Obtener(id);
                List<Cliente> lista = new List<Cliente>();
                foreach (var item in ClienteLN.ObtenerTodos())
                {
                    if (item.rango.idRango == cupon.rango.idRango)
                    {
                        lista.Add(item);
                    }
                }

                ddl.DataSource = lista;
                ddl.SelectedIndex = -1;
                ddl.DataBind();

            }

        }

        // El tipo devuelto puede ser modificado a IEnumerable, sin embargo, para ser compatible con la paginación y ordenación de 
        //, se deben agregar los siguientes parametros:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public List<Cupon> grvCuponSin_GetData()
        {
            return CuponLN.ObtenerTodos();
        }

        protected void ddlCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl;
            GridViewRow currentRow = (GridViewRow)((DropDownList)sender).Parent.Parent;
            // Celda 1 es donde esta el DropdownList

            ddl = ((DropDownList)(currentRow.FindControl("ddlCliente")));

            int idCupon = Convert.ToInt32(grvCuponSin.DataKeys[currentRow.RowIndex].Values[0]);
            Cliente cliente = ClienteLN.Obtener(Convert.ToInt32(ddl.SelectedValue));


            Cupon cupon = new Cupon()
            {
                idCupon = idCupon,
                cliente = cliente,
                estado = true

            };
            CuponLN.InsertarCliente(cupon);
            CuponLN.ActualizarEstadoCupon(false, idCupon);

            grvCuponSin.DataBind();

        }

        // El nombre de parámetro del id. debe coincidir con el valor DataKeyNames establecido en el control


        protected void btnGuardar_Command(object sender, CommandEventArgs e)
        {

            ClientScript.RegisterStartupScript(this.GetType(), "Carrito",
 "mensajeConfirm('Actualizado correctamente')", true);
        }
    }

}