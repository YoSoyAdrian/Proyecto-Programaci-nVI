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
        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ListarCliente");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "UsuarioCliente");
            return ds;
        }

    }
}
