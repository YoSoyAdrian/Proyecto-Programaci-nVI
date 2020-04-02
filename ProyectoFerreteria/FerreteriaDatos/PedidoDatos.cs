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
            comando.Parameters.AddWithValue("@idProducto", pedido.producto.idProducto);
            comando.Parameters.AddWithValue("@idCliente", pedido.cliente.idCliente);
            comando.Parameters.AddWithValue("@cantidad", pedido.cantidad);
            comando.Parameters.AddWithValue("@total", pedido.total);
            comando.Parameters.AddWithValue("@codigo", pedido.codigo);

            db.ExecuteNonQuery(comando);
        }
        public static DataSet SeleccionarRegistro()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ListarRegistroCompra");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "Pedido");
            return ds;
        }
        public static DataSet SeleccionarTotalCompras()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");
            SqlCommand comando = new SqlCommand("PA_ListarTotalCompra");
            comando.CommandType = CommandType.StoredProcedure;
            DataSet ds = db.ExecuteReader(comando, "Pedido");
            return ds;
        }
    }
}
