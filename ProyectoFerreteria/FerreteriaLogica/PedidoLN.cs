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
                registro.cantidad = Convert.ToInt32(fila["cantidad"]);
                registro.total = Convert.ToDecimal(fila["total"]);
                registro.total = Convert.ToInt32(fila["codigo"]);
                lista.Add(registro);
            }
            return lista;
        }
        public static List<Pedido> ObtenerPedidos()
        {
            List<Pedido> lista = new List<Pedido>();
            DataSet ds = PedidoDatos.SeleccionarRegistro();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Pedido registro = new Pedido();
                registro.total = Convert.ToInt32(fila["codigo"]);
                registro.cliente.idCliente = Convert.ToInt32(fila["idCliente"]);
                registro.cantidad = Convert.ToInt32(fila["cantidad"]);
                registro.total = Convert.ToDecimal(fila["total"]);
                lista.Add(registro);
            }
            return lista;
        }
        public static List<Pedido> ObtenerTotales()
        {
            List<Pedido> lista = new List<Pedido>();
            DataSet ds = PedidoDatos.SeleccionarTotalCompras();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Pedido registro = new Pedido();
                registro.cliente.idCliente = Convert.ToInt32(fila["idCliente"]);
                registro.total = Convert.ToDecimal(fila["total"]);
                lista.Add(registro);
            }
            return lista;
        }
        public static Pedido Obtener(int idPedido)
        {
            List<Pedido> lista = PedidoLN.ObtenerTodos();
            Pedido pedido;
            pedido = lista.Where(x => x.idPedido == idPedido).FirstOrDefault();
            return pedido;
        }
        public static List<Pedido> ObtenerPedidosXCliente(int idCliente)
        {
            List<Pedido> lista = PedidoLN.ObtenerPedidos();
            List<Pedido> listaPedidos = new List<Pedido>();
            listaPedidos = lista.Where(x => x.cliente.idCliente == idCliente).ToList();
            return listaPedidos;
        }
        public static decimal ObtenerTotalXCliente(int idCliente)
        {

            List<Pedido> lista = PedidoLN.ObtenerTotales();
            decimal total = 0;
            foreach (Pedido pedido in lista)
            {
                if (pedido.cliente.idCliente == idCliente)
                {
                    total = pedido.total;
                    break;
                }
            }
            return total;
        }
        public static void Nuevo(Pedido pedido)
        {

            PedidoDatos.Insertar(pedido);
        }
    }
}
