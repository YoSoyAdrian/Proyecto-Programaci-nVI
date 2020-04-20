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
                registro.descuento = Convert.ToDecimal(fila["descuento"]);
                registro.cantidad = Convert.ToInt32(fila["cantidad"]);
                registro.producto.idProducto = Convert.ToInt32(fila["idProducto"]);
                registro.producto.nombre = fila["nombreProducto"].ToString();
                registro.rango.idRango = Convert.ToInt32(fila["idRango"]);
                registro.rango.nombre = fila["nombreRango"].ToString();
                registro.estado = Convert.ToBoolean(fila["estado"]);

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

                registro.idCuponCliente = Convert.ToInt32(fila["idCuponCliente"]);
                registro.cliente.idCliente = Convert.ToInt32(fila["idCliente"]);
                registro.descuento = Convert.ToDecimal(fila["descuento"]);
                registro.cliente.nombre = fila["nombreCliente"].ToString();
                registro.nombre = fila["nombreCupon"].ToString();
                registro.producto.nombre = fila["nombreProducto"].ToString();
                registro.estado = Convert.ToBoolean(fila["estado"]);
                registro.cliente.correo = fila["correoCliente"].ToString();
                registro.canjeado = Convert.ToBoolean(fila["canjeado"]);
                lista.Add(registro);
            }
            return lista;
        }
        public static List<Cupon> ObtenerTodosRango()
        {
            List<Cupon> lista = new List<Cupon>();
            DataSet ds = CuponDatos.SeleccionarXRango();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Cupon registro = new Cupon();
                registro.idCuponCliente = Convert.ToInt32(fila["idCupon"]);
                registro.cliente.idCliente = Convert.ToInt32(fila["idCliente"]);
                registro.cliente.nombre = fila["nombreCliente"].ToString();
                registro.nombre = fila["nombreCupon"].ToString();
                registro.producto.nombre = fila["nombreProducto"].ToString();

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
            Cupon cupon = new Cupon();
            cupon = lista.Where(x => x.idCuponCliente == idCupon && x.cliente.idCliente == idCliente).FirstOrDefault();
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
        public static void ActualizarEstadoCupon(bool estado, int id)
        {
            CuponDatos.ActualizarCupon(estado, id);
        }
        public static void ActualizarEstadoCuponCliente(bool estado, int id)
        {
            CuponDatos.ActualizarCuponCliente(estado, id);
        }
        public static void ActualizarCanje(bool canje, int id)
        {
            CuponDatos.ActualizarCanjeCupon(canje, id);
        }
    }
}
