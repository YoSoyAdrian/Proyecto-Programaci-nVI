using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FerreteriaEntidad;
using FerreteriaLogica;
namespace FerreteriaWeb
{
    public partial class MantProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //!IsPostBack= Carga inicial de la página
                //Cargar lista de actividades
                ddlCategoria.DataSource = CategoriaLN.ObtenerTodos();
                ddlCategoria.DataTextField = "nombre";
                ddlCategoria.DataValueField = "idCategoria";
                ddlCategoria.DataBind();

                grvListado.DataSource = ProductoLN.ObtenerTodos();
                grvListado.DataBind();
            }
        }
        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void validarDescripcion_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = args.Value.Length >= 3;
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {

            Producto producto = new Producto();
            producto.nombre = txtNombre.Text;
            producto.descripcion = txtDescripcion.Text;
            producto.precio = Convert.ToDecimal(txtPrecio.Text);
            producto.categoria.idCategoria = Convert.ToInt32(ddlCategoria.SelectedValue);


            //Obtener imagen
            int tamanno = fuploadImagen.PostedFile.ContentLength;
            byte[] imagenOriginal = new byte[tamanno];
            fuploadImagen.PostedFile.InputStream.Read(imagenOriginal, 0, tamanno);
            Bitmap imagenOriginalBinaria = new Bitmap(fuploadImagen.PostedFile.InputStream);
            string imagenDataURL64 = "data:image/png;base64," + Convert.ToBase64String(imagenOriginal);
            //Insertar imagen a base de datos
            producto.imagen = imagenOriginal;


            ProductoLN.Nuevo(producto);
        }

        protected void grvListado_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grvListado_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            try
            {
                int indice = Convert.ToInt32(e.CommandArgument);

                int id = Convert.ToInt32(grvListado.DataKeys[indice].Values["idProducto"]);

                if (e.CommandName == "cupon")
                {
                    Session["idProducto"]= ProductoLN.Obtener(id).nombre;
                    Response.Redirect("RegistrarCupon.aspx");


                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}