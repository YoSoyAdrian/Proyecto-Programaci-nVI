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
    public class RangoLN
    {
        public static List<Rango> ObtenerTodos()
        {
            List<Rango> lista = new List<Rango>();
            DataSet ds = RangoDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Rango registro = new Rango();
                registro.idRango = Convert.ToInt32(fila["idRango"]);
                registro.nombre = fila["nombre"].ToString();
                registro.montoMinimo = Convert.ToDecimal(fila["montoMinimo"]);
                registro.montoMaximo = Convert.ToDecimal(fila["montoMaximo"]);
                registro.imagen = (byte[])fila["imagen"];

                lista.Add(registro);
            }
            return lista;
        }
        public static Rango Obtener(int idRango)
        {
            List<Rango> lista = RangoLN.ObtenerTodos();
            Rango rango=new Rango();
            rango= lista.Where(x => x.idRango == idRango).FirstOrDefault();
            return rango;
        }
        public static Rango ObtenerXRango(decimal total)
        {
            List<Rango> lista = RangoLN.ObtenerTodos();
            Rango rango = new Rango();
            if (total <= 100000)
            {
                rango = lista.Find(x => x.montoMinimo <= total && x.montoMaximo >= total);
            }
            else
            {
                rango = lista.Find(x => x.montoMaximo == 1);
            }
           
            return rango;
        }
        public static void Nuevo(Rango rango)
        {

        }
    }
}
