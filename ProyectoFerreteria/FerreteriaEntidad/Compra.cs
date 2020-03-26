using System;
using System.Collections.Generic;

namespace FerreteriaEntidad
{
    public class Compra
    {
        public int idCompra { get; set; }
       
        public Pedido pedido { get; set; }
      
        public decimal total { get; set; }
        public DateTime fecha { get; set; }

        public Compra()
        {
            this.pedido = new Pedido();
         
           
        }
    }
}