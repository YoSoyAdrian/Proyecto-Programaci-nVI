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
            ddlRango.SelectedIndex = -1;
            ddlProducto.SelectedIndex = -1;
            rdbDescuento.Checked = false;
            rdbRegalia.Checked = false;

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
            try
            {
                if (ddlProducto.SelectedIndex != -1 && ddlRango.SelectedIndex != -1)
                {

                    Cupon cupon = new Cupon()
                    {
                        idCupon = Random(),
                        nombre = txtNombre.Text,
                        descripcion = txtDescripcion.Text,
                        cantidad = Convert.ToInt32(txtCantidad.Text),
                    };
                    cupon.producto.idProducto = Convert.ToInt32(ddlProducto.SelectedValue);
                    cupon.rango.idRango = Convert.ToInt32(ddlRango.SelectedValue);
                    CuponLN.Nuevo(cupon);


                    ClientScript.RegisterStartupScript(this.GetType(), "Carrito",
          "mensajeConfirm('Agregado correctamente')", true);

                    txtCantidad.Text = "";
                    txtDescripcion.Text = "";
                    txtNombre.Text = "";
                }
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


        protected void listaCupon_ItemCreated(object sender, ListViewItemEventArgs e)
        {

        }

        protected void btnRegistrar_Command(object sender, CommandEventArgs e)
        {
        
        }

        public List<Cupon>grvCupon_GetData()
        {
            return CuponLN.ObtenerTodos();
        }
    }
}