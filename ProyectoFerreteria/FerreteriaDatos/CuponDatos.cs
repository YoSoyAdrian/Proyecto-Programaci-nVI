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
            comando.Parameters.AddWithValue("@idCupon", cupon.idCupon);
            comando.Parameters.AddWithValue("@nombre", cupon.nombre);
            comando.Parameters.AddWithValue("@descripcion", cupon.descripcion);
            comando.Parameters.AddWithValue("@cantidad", cupon.cantidad);
            comando.Parameters.AddWithValue("@producto", cupon.producto.idProducto);
            comando.Parameters.AddWithValue("@rango", cupon.rango.idRango);

            db.ExecuteNonQuery(comando);
        }
        public static void ActualizarCupon(bool estado, int id)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ActualizarEstadoCupon");
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idCupon", id);
            comando.Parameters.AddWithValue("@estado",estado);
           

            db.ExecuteNonQuery(comando);
        }
        public static void ActualizarCuponCliente(bool estado, int id)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ActualizarEstadoCuponCliente");
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idCupon", id);
            comando.Parameters.AddWithValue("@estado", estado);


            db.ExecuteNonQuery(comando);
        }
        public static void InsertarCliente(Cupon cupon)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_InsertarCuponCliente");
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idCupon", cupon.idCupon);
            comando.Parameters.AddWithValue("@idCliente",cupon.cliente.idCliente);
            comando.Parameters.AddWithValue("@estado", cupon.estado);
            db.ExecuteNonQuery(comando);
        }
        public static DataSet SeleccionarXCliente()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ListarCuponCliente");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "CuponCliente");
            return ds;
        }
        public static DataSet SeleccionarXRango()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ListarCuponRango");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "Cupon");
            return ds;
        }
    }
}
