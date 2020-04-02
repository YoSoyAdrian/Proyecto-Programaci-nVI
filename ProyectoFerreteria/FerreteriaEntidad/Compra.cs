using System;
using System.Collections.Generic;

namespace FerreteriaEntidad
{
    public class Compra
    {
        public int idCompra { get; set; }

        public DateTime fecha { get; set; }

        public Compra()
        {
            ;
            fecha = new DateTime();

        }
    }
}