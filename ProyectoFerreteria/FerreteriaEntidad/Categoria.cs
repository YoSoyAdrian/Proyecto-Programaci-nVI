using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FerreteriaEntidad
{
    public class Categoria
    {
        public int idCategoria { get; set; }
        public string nombre { get; set; }
        public bool estado { get; set; }

        public override string ToString()
        {
            return nombre;
        }
    }

}
