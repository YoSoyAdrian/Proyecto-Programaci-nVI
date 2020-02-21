﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FerreteriaEntidad
{
    public class Cliente
    {
        public int idCliente { get; set; }
        public string nombre { get; set; }
        public string apellidoP { get; set; }
        public string apellidoM { get; set; }
        public string identificacion { get; set; }
        public string correo { get; set; }
        public string contrasenna { get; set; }
        public string telefono { get; set; }
        public string direccion { get; set; }
        public Rango rango  { get; set; }
        public List<Compra> compras { get; set; }
        public Cliente()
        {
            this.rango = new Rango();
            this.compras = new List<Compra>();
        }
    }
}
