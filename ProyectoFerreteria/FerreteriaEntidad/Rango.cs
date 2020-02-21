using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FerreteriaEntidad
{
   public class Rango
    {
        public int idRango { get; set; }
        public string nombre { get; set; }
        public decimal montoMinimo { get; set; }

        public override string ToString()
        {
            return nombre;
        }
    }
}
