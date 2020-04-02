using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FerreteriaEntidad
{
    public class Pedido
    {
        public int idPedido { get; set; }
        public Producto producto { get; set; }
        public Cliente cliente { get; set; }
        public int cantidad { get; set; }
        public decimal total { get; set; }
        public int codigo { get; set; }
        public Pedido()
        {
            this.cliente = new Cliente();
            this.producto = new Producto();
        }
    }
}
