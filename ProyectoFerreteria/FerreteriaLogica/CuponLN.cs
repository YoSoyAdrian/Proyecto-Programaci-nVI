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
    public class CuponLN
    {
        public static List<Cupon> ObtenerTodos()
        {
            List<Cupon> lista = new List<Cupon>();
            DataSet ds = CuponDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Cupon registro = new Cupon();
                registro.idCupon = Convert.ToInt32(fila["idCupon"]);
                registro.nombre = fila["nombre"].ToString();
                registro.descripcion = fila["descripcion"].ToString();
                registro.cantidad = Convert.ToInt32(fila["cantidad"]);
                registro.producto.idProducto = Convert.ToInt32(fila["producto"]);
                registro.rango.idRango = Convert.ToInt32(fila["rango"]);

                lista.Add(registro);
            }
            return lista;
        }
        public static List<Cupon> ObtenerTodosCliente()
        {
            List<Cupon> lista = new List<Cupon>();
            DataSet ds = CuponDatos.SeleccionarXCliente();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Cupon registro = new Cupon();
                registro.idCupon = Convert.ToInt32(fila["idCupon"]);
                registro.cliente.idCliente = Convert.ToInt32(fila["idCliente"]);
                registro.estado = Convert.ToBoolean(fila["estado"]);

                lista.Add(registro);
            }
            return lista;
        }
        public static Cupon Obtener(int idCupon)
        {
            List<Cupon> lista = CuponLN.ObtenerTodos();
            Cupon cupon = lista.Where(x => x.idCupon == idCupon).FirstOrDefault();
            return cupon;
        }
        public static List<Cupon> ObtenerXRango(int idRango)
        {
            List<Cupon> lista = CuponLN.ObtenerTodos();
            List<Cupon> listaCupon = new List<Cupon>();
            listaCupon = lista.Where(x => x.rango.idRango == idRango).ToList();
            return listaCupon;
        }
        public static List<Cupon> ObtenerClientes(int idCliente)
        {
            List<Cupon> lista = CuponLN.ObtenerTodosCliente();
            List<Cupon> listaCupon = new List<Cupon>();
            listaCupon = lista.Where(x => x.cliente.idCliente == idCliente).ToList();
            return listaCupon;
        }
        public static Cupon ObtenerXCliente(int idCupon, int idCliente)
        {
            List<Cupon> lista = CuponLN.ObtenerTodosCliente();
            Cupon cupon = lista.Where(x => x.idCupon == idCupon).FirstOrDefault();
            return cupon;
        }
        public static void Nuevo(Cupon cupon)
        {
            CuponDatos.Insertar(cupon);
        }
        public static void InsertarCliente(Cupon cupon)
        {
            CuponDatos.InsertarCliente(cupon);
        }
    }
}
