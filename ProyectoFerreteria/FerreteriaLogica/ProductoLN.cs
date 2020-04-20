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
                registro.categoria.idCategoria = Convert.ToInt32(fila["idCategoria"]);
                registro.categoria.nombre = fila["nombreCategoria"].ToString();
                registro.imagen = (byte[])fila["imagen"];
                registro.cantidad = Convert.ToInt32(fila["cantidad"]);
                lista.Add(registro);
            }
            return lista;
        }
        public static Producto Obtener(int idProducto)
        {
            List<Producto> lista = ProductoLN.ObtenerTodos();
            Producto producto = new Producto();
            producto = lista.Where(x => x.idProducto == idProducto).First();
            return producto;
        }
        public static List<Producto> ObtenerXCategoria(int idCategoria)
        {
            List<Producto> lista = ProductoLN.ObtenerTodos();

            List<Producto> producto = new List<Producto>();
            producto = lista.Where(x => x.categoria.idCategoria == idCategoria).ToList();
            return producto;


        }
        public static void Nuevo(Producto producto)
        {
            ProductoDatos.Insertar(producto);
        }

    }
}


