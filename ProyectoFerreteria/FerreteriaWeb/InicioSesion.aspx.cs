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
    public partial class InicioSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Cliente user = new Cliente(txtUsuario.Text, txtPassword.Text);


            Cliente userVerificado;
            userVerificado = ClienteLN.verificarCredenciales(user);
            if (userVerificado != null)
            {
                Session["Cliente"] = (Cliente)userVerificado;
                decimal total = PedidoLN.ObtenerTotalXCliente(userVerificado.idCliente);
                if (total != 0)
                {
                    Rango rango = RangoLN.ObtenerXRango(total);
                    ClienteLN.Actualizar(userVerificado.idCliente, rango.idRango);
                }
                else
                {
                    ClienteLN.Actualizar(userVerificado.idCliente, 5);
                }

                ClientScript.RegisterStartupScript(this.GetType(), "Inicio de Sesión",
     "mensajeRedirect('Inicio de Sesión','Credenciales correctas','success','PaginaPrincipal.aspx')", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(
                  this.GetType(),
                  "Inicio de Sesión",
                   "mensajeRedirect('Inicio de Sesión','Verifique las credenciales','error','InicioSesion.aspx')",
                  true
                  );
                lblValidacion.Text = "Correo Electronico o Contraseña incorrecto";
                txtPassword.Text = "";
            }
        }
    }
}