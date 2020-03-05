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

        public override bool Equals(object obj)
        {
            return obj is DetallePedido pedido &&
                   EqualityComparer<Producto>.Default.Equals(productos, pedido.productos);
        }

        public override int GetHashCode()
        {
            return 15118190 + EqualityComparer<Producto>.Default.GetHashCode(productos);
        }
    }
}
