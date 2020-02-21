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
     public class CuponDatos
    {
        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ListarCupon");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "Cupon");
            return ds;
        }
        public static void Insertar(Cupon cupon)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_InsertarCupon");
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nombre", cupon.nombre);
            comando.Parameters.AddWithValue("@descripcion", cupon.descripcion);
            comando.Parameters.AddWithValue("@cantidad", cupon.cantidad);
            comando.Parameters.AddWithValue("@producto", cupon.producto.idProducto);
            comando.Parameters.AddWithValue("@rango", cupon.rango.idRango);

            db.ExecuteNonQuery(comando);
        }
    }
}
