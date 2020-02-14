using FerreteriaDatos;
using FerreteriaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;


namespace FerreteriaLogica
{
    public class ProductoLN
    { 
        public static List<Producto> ObtenerTodos()
        {
            List<Producto> lista = new List<Producto>();
            DataSet ds = ProductoDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Producto registro = new Producto();
                registro.idProducto = Convert.ToInt32(fila["idProducto"]);
                registro.nombre = fila["nombre"].ToString();
                registro.descripcion = fila["descripcion"].ToString();
                registro.precio = Convert.ToDecimal(fila["precio"]);
                registro.categoria.idCategoria = Convert.ToInt32(fila["categoria"]);
                registro.imagen = (byte[])fila["imagen"];
                lista.Add(registro);
            }
            return lista;
        }
        public static void Nuevo(Producto producto)
        {
            ProductoDatos.Insertar(producto);
        }
     
    }
} 
    

