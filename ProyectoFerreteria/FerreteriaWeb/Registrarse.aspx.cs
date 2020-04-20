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
    public partial class Registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Cliente cliente = new Cliente()
                {
                    identificacion = txtIdentificacion.Text,
                    nombre = txtUsuario.Text,
                    apellidoP = txtApellido.Text,
                    correo = txtCorreo.Text,
                    telefono = txtTelefono.Text,
                    contrasenna = txtPassword.Text,
                    direccion = txtDireccion.Text

                };
                cliente.rango.idRango = 5;

                ClienteLN.Nuevo(cliente);

                ClientScript.RegisterStartupScript(this.GetType(), "Registrarse",
    "mensajeRedirect('Bienvenido','¡Gracias por registrarse!','success','PaginaPrincipal.aspx')", true);
            }
        }
    }
}