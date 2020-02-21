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
    public partial class RegistrarCupon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                ActualizarRango();
                ActualizarProducto();
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

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                Cupon cupon = new Cupon()
                {
                    nombre = txtNombre.Text,
                    descripcion = txtDescripcion.Text,
                    cantidad = Convert.ToInt32(txtCantidad.Text),
                };
                cupon.producto.idProducto = Convert.ToInt32(ddlProducto.SelectedValue);
                cupon.rango.idRango = Convert.ToInt32(ddlRango.SelectedValue);
                CuponLN.Nuevo(cupon);
                txtCantidad.Text = "";
                txtDescripcion.Text = "";
                txtNombre.Text = "";
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void ddlProducto_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public List<Cupon> listaCupon_GetData()
        {
            return CuponLN.ObtenerTodos();
        }
    }
}