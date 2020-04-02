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
                registro.fecha = Convert.ToDateTime(fila["fecha"]);
                lista.Add(registro);
            }
            return lista;
        }
        public static List<Compra> ObtenerCompras()
        {
            List<Compra> lista = new List<Compra>();
            DataSet ds = CompraDatos.SeleccionarRegistro();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Compra registro = new Compra();
                registro.idCompra = Convert.ToInt32(fila["idPedidoCliente"]);
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
        public static void Nuevo(Compra compra)
        {

            CompraDatos.InsertarRegistro(compra);
        }

    }
}
