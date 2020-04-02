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
    public partial class MantCuponCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlRango.DataSource = RangoLN.ObtenerTodos();
                ddlRango.DataBind();
                grvListadoCupon.DataSource = CuponLN.ObtenerTodos();
                grvListadoCupon.DataBind();
            }
        }

        protected void ddlRango_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlRango.SelectedValue);

            if (ddlRango.SelectedIndex != -1)
            {
                grvListadoCupon.DataSource = CuponLN.ObtenerXRango(id);
                grvListadoCupon.DataBind();
            }

        }

        protected void ChkMiCupon_CheckedChanged(object sender, EventArgs e)
        {

            if (Session["Cliente"] != null && ChkMiCupon.Checked)
            {
                int id = ((Cliente)Session["Cliente"]).idCliente;
                Cliente usuario = ClienteLN.Obtener(id);
              

                grvListadoCupon.DataSource = CuponLN.ObtenerClientes(usuario.idCliente);
                grvListadoCupon.DataBind();
            }
            else
            {
                grvListadoCupon.DataSource = CuponLN.ObtenerTodos();
                grvListadoCupon.DataBind();
            }
        }
    }
}