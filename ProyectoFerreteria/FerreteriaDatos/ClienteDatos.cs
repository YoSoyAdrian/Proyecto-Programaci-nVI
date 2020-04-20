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
    public class ClienteDatos
    {
        public static void InsertarRegistro(Cliente cliente)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_InsertarCliente");
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nombre",cliente.nombre);
            comando.Parameters.AddWithValue("@apellidoP", cliente.apellidoP);
            comando.Parameters.AddWithValue("@identificacion", cliente.identificacion);
            comando.Parameters.AddWithValue("@direccion", cliente.direccion);
            comando.Parameters.AddWithValue("@telefono", cliente.telefono);
            comando.Parameters.AddWithValue("@correo", cliente.correo);
            comando.Parameters.AddWithValue("@contrasenna", cliente.contrasenna);
            comando.Parameters.AddWithValue("@rango", cliente.rango.idRango);

            db.ExecuteNonQuery(comando);
        }
        public static void ActualizarRangoCliente(int idCliente, int idRango)
        {

            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ActualizarRangoCliente");
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idCliente", idCliente);
            comando.Parameters.AddWithValue("@idRango", idRango);

            db.ExecuteNonQuery(comando);
        }
        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ListarCliente");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "UsuarioCliente");
            return ds;
        }
        public static DataSet SeleccionarRegistro()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ListarRegistro");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "RegistroCompra");
            return ds;
        }

    }
}
