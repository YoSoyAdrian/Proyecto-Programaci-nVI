using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FerreteriaEntidad
{
   public class DetallePedido
    {
        public int idDetalle { get; set; }
        public Producto productos { get; set; }
        public int cantidad { get; set; }
        public decimal subTotal { get; set; }
   
        public DetallePedido()
        {
           this.productos = new Producto();
        }

     
    }
}
