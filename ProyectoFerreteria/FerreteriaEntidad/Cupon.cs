using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FerreteriaEntidad
{
    public class Cupon
    {
        public int idCuponCliente { get; set; }
        public int idCupon { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public Producto producto { get; set; }
        public Cliente cliente { get; set; }
        public Rango rango { get; set; }
        public int cantidad { get; set; }
        public bool estado { get; set; }
        public Cupon()
        {
            this.producto = new Producto();
            this.rango = new Rango();
            this.cliente = new Cliente();
        }
      
    }
}
