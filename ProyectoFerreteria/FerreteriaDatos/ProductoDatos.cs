using FerreteriaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FerreteriaDatos
{
    public class ProductoDatos
    {
       
            //Listar todos los productos
            public static DataSet SeleccionarTodos()
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("PA_ListarProductos");
                comando.CommandType = CommandType.StoredProcedure;
                DataSet ds = db.ExecuteReader(comando, "Producto");
                return ds;
            }

            public static void Insertar(Producto producto)
            {
                Database db = DatabaseFactory.CreateDatabase("Default");
                SqlCommand comando = new SqlCommand("PA_InsertarProducto");
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@nombre", producto.nombre);
                comando.Parameters.AddWithValue("@descripcion", producto.descripcion);
                comando.Parameters.AddWithValue("@precio", producto.precio);
                comando.Parameters.AddWithValue("@imagen", producto.imagen);
                comando.Parameters.AddWithValue("@categoria", producto.categoria.idCategoria);

                db.ExecuteNonQuery(comando);
            }

    }
}
