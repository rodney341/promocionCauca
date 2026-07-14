using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppPromocionCauca.Models
{
    public class OperadorModel
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string telefono { get; set; }
        public string correo { get; set; }
        public string sitioWeb { get; set; }
        public string logoUrl { get; set; }
        public string registroTurismo { get; set; }
        public bool certificadoSostenibilidad { get; set; }
    }
}