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
                registro.nombre = fila["nombreCliente"].ToString();
                registro.identificacion = fila["identificacion"].ToString();
                registro.apellidoP = fila["apellidoP"].ToString();
                registro.apellidoM = fila["apellidoM"].ToString();
                registro.correo = fila["correo"].ToString();
                registro.contrasenna = fila["contrasenna"].ToString().Trim();
                registro.direccion = fila["direccion"].ToString();
                registro.telefono = fila["telefono"].ToString();
                registro.rango.idRango = Convert.ToInt32(fila["Rango"]);
               
                lista.Add(registro);
            }
            return lista;
        }

        public static Cliente verificarCredenciales(Cliente cliente)
        {
            List<Cliente> lista = new List<Cliente>();
            lista = ClienteLN.ObtenerTodos();
            Cliente user = new Cliente();
            user = (lista.Find(elemento => elemento.correo==cliente.correo && elemento.contrasenna==cliente.contrasenna)) ;
            return user;
        }
        public static Cliente Obtener(int idCliente)
        {
            List<Cliente> lista =ClienteLN.ObtenerTodos();
            Cliente cliente = new Cliente();
            cliente= lista.Find(elemento => elemento.idCliente == idCliente);
            return cliente;
        }
        public static Cliente ObtenerXRango(int idRango)
        {
            List<Cliente> lista = ClienteLN.ObtenerTodos();
            Cliente cliente = new Cliente();
            cliente = lista.Find(elemento => elemento.rango.idRango == idRango);
            return cliente;
        }
        public static void Actualizar(int idCliente, int idRango)
        {

            ClienteDatos.ActualizarRangoCliente(idCliente,idRango);
        }
    }
}
