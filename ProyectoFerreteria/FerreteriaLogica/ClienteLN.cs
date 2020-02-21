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
   public class ClienteLN
    {
        public static List<Cliente> ObtenerTodos()
        {
            List<Cliente> lista = new List<Cliente>();
            DataSet ds = ClienteDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Cliente registro = new Cliente();
                registro.idCliente = Convert.ToInt32(fila["idCliente"]);
                registro.nombre = fila["nombre"].ToString();
                registro.identificacion = fila["identificacion"].ToString();
                registro.apellidoP = fila["apellidoP"].ToString();
                registro.apellidoM = fila["apellidoM"].ToString();
                registro.correo = fila["correo"].ToString();
                registro.contrasenna = fila["contrasenna"].ToString();
                registro.direccion = fila["direccion"].ToString();
                registro.telefono = fila["telefono"].ToString();
                registro.rango.idRango = Convert.ToInt32(fila["Rango"]);
               
                lista.Add(registro);
            }
            return lista;
        }
    }
}
