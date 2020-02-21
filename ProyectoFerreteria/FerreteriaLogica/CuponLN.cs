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
        public static Cupon Obtener(int idCupon)
        {
            List<Cupon> lista = CuponLN.ObtenerTodos();
            Cupon cupon = lista.Where(x => x.idCupon == idCupon).FirstOrDefault();
            return cupon;
        }
        public static void Nuevo(Cupon cupon)
        {
            CuponDatos.Insertar(cupon);
        }
    }
}
