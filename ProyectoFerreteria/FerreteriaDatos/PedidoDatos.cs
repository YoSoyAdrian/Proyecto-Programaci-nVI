using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FerreteriaEntidad;
using System.Data;
namespace FerreteriaDatos
{
    public class PedidoDatos
    {
        public static DataSet SeleccionarTodos()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ListarPedido");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "Pedido");
            return ds;
        }

        public static void Insertar(Pedido pedido)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_InsertarPedido");
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idProducto",pedido.idProducto);
            comando.Parameters.AddWithValue("@cantidad", pedido.cantidad);
            comando.Parameters.AddWithValue("@total", pedido.total);
           
            db.ExecuteNonQuery(comando);
        }
    }
}
