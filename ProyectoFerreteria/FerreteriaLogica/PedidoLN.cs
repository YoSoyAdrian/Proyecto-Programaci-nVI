using FerreteriaDatos;
using FerreteriaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FerreteriaLogica
{
    public class PedidoLN
    {
        public static List<Pedido> ObtenerTodos()
        {
            List<Pedido> lista = new List<Pedido>();
            DataSet ds = PedidoDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Pedido registro = new Pedido();
                registro.idPedido = Convert.ToInt32(fila["idPedido"]);
                registro.producto.idProducto = Convert.ToInt32(fila["idProducto"]);
                registro.cliente.idCliente = Convert.ToInt32(fila["idCliente"]);
                registro.total = Convert.ToDecimal(fila["total"]);
                registro.cantidad = Convert.ToInt32(fila["cantidad"]);
                lista.Add(registro);
            }
            return lista;
        }
        public static Pedido Obtener(int idPedido)
        {
            List<Pedido> lista = PedidoLN.ObtenerTodos();
            Pedido pedido= new Pedido();
            pedido = lista.Where(x => x.idPedido == idPedido).First();
            return pedido;
        }
        public static void Nuevo(Pedido pedido)
        {

            PedidoDatos.Insertar(pedido);
        }
    }
}
