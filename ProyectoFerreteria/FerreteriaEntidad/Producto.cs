using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FerreteriaEntidad
{
    public class Producto
    {
        public int idProducto { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public decimal precio { get; set; }
        public Categoria categoria { get; set; }
        public byte[] imagen { get; set; }

      
        public Producto()
        {
            categoria = new Categoria();
        }
    }
    
}
