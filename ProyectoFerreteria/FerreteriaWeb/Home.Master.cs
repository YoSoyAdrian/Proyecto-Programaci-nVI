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
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Cliente"] != null)
            {
                int id = ((Cliente)Session["Cliente"]).idCliente;
                Cliente usuario = ClienteLN.Obtener(id);
                Rango rango = RangoLN.Obtener(usuario.rango.idRango);

                lblCupon.Visible = true;
                lblCliente.Text = usuario.nombre;
                LkBtnIniciar.Text = "Cerrar sesión";
                LkBtnRegistrar.Visible = false;
                LinkCambiar.Visible = true;
                lblCompra.Text = "Compra";
                lnkRegistroInfo.HRef = "RegistroCompra.aspx";
                lblRango.Text = rango.nombre;
                consultarImagen(rango.idRango);

            }
            else
            {
                if (Session["Admin"] != null)
                {
                    LkBtnCerrar.Visible = true;

                    lblCliente.Text = Session["Admin"].ToString();
                    LkBtnIniciar.Text = "Registro Cupones";
                    LkBtnRegistrar.Text = "Registro de Usuarios";
                    LkBtnCerrar.Text = "Cerrar Sesión";
                    LinkCambiar.Visible = false;

                }
            }

        }
        protected void consultarImagen(int idRango)
        {
            switch (idRango)
            {
                case 1:
                    imgRango.ImageUrl = "../Img/UserBronce.png";
                    break;
                case 2:
                    imgRango.ImageUrl = "../Img/UserSilver.png";
                    break;
                case 3:
                    imgRango.ImageUrl = "../Img/UserGold.png";
                    break;
                case 4:
                    imgRango.ImageUrl = "../Img/UserVip.png";
                    break;
                case 5:
                    imgRango.ImageUrl = "../Img/new.png";
                    break;
            }
        }

        protected void LkBtnIniciar_Click(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                Response.Redirect("CuponCliente.aspx");
            }
            if (LkBtnIniciar.Text == "Cerrar sesión")
            {
                Session.RemoveAll();
                Response.Redirect("InicioSesion.aspx");
            }
            else
            {
                LkBtnIniciar.Text = "Iniciar Sesión";
                Response.Redirect("InicioSesion.aspx");
            }

        }


        protected void LkBtnRegistrar_Click(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                Response.Redirect("MantCliente.aspx");
            }
            if (LkBtnIniciar.Text == "Cerrar sesión")
            {
                Session.RemoveAll();
                Response.Redirect("InicioSesion.aspx");
            }
            else
            {
                LkBtnIniciar.Text = "Iniciar Sesión";
                Response.Redirect("Registrarse.aspx");
            }
        }

        protected void LinkCerrar_Click(object sender, EventArgs e)
        {
            if (LkBtnCerrar.Text == "Cerrar sesión" || Session["Admin"] != null)
            {
                Session.RemoveAll();
                Response.Redirect("InicioSesion.aspx");
            }
        }


    }
}