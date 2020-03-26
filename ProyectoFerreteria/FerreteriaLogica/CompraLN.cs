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
    public class CompraLN
    {
        public static List<Compra> ObtenerTodos()
        {
            List<Compra> lista = new List<Compra>();
            DataSet ds = CompraDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Compra registro = new Compra();
                registro.idCompra = Convert.ToInt32(fila["idPedidoCliente"]);
                registro.pedido.idPedido = Convert.ToInt32(fila["idPedido"]);
              
                registro.total = Convert.ToDecimal(fila["total"]);
                registro.fecha = Convert.ToDateTime(fila["fecha"]);
                lista.Add(registro);
            }
            return lista;
        }
        public static Compra Obtener(int idCompra)
        {
            List<Compra> lista = CompraLN.ObtenerTodos();
            Compra compra = lista.Where(x => x.idCompra == idCompra).FirstOrDefault();
            return compra;
        }
        ////public static List<Pedido> ObtenerXProducto(int idProducto)
        ////{
        ////    List<Pedido> lista = CompraLN.ObtenerTodos();

        ////    List<Pedido> pedido = new List<Pedido>();
        ////    pedido = lista.Where(x => x.idProducto == idProducto).ToList();
        ////    return pedido;


        ////}
        public static void Nuevo(Compra compra)
        {

            CompraDatos.InsertarRegistro(compra);
        }

    }
}
