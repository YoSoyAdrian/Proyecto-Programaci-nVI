using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FerreteriaDatos;
using FerreteriaEntidad;
namespace FerreteriaLogica
{
   public class CategoriaLN
    {
        public static List<Categoria> ObtenerTodos()
        {
            List<Categoria> lista = new List<Categoria>();
            DataSet ds = CategoriaDatos.SeleccionarTodos();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Categoria registro = new Categoria();
                registro.idCategoria = Convert.ToInt32(fila["idCategoria"]);
                registro.nombre = fila["nombre"].ToString();
                registro.estado = Convert.ToBoolean(fila["estado"].ToString());
                lista.Add(registro);
            }
            return lista;
        }
        public static Categoria Obtener(int idCategoria)
        {
            List<Categoria> lista = CategoriaLN.ObtenerTodos();
            Categoria categoria = lista.Where(x => x.idCategoria == idCategoria).FirstOrDefault();
            return categoria;
        }
    }
}
