using System;
using System.Collections.Generic;

namespace FerreteriaEntidad
{
    public class Compra
    {
        public int idCompra { get; set; }
        public Cliente cliente { get; set; }
        public List<DetallePedido> pedidos { get; set; }
        public DateTime fecha { get; set; }

        public Compra()
        {
            this.cliente = new Cliente();
            this.pedidos = new List<DetallePedido>();
        }
    }
}