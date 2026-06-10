using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppPromocionCauca.Models
{
    public class SubregionModel
    {
        public string id { get; set; }

        public string nombre { get; set; }

        public string slug { get; set; }

        public string descripcion { get; set; }

        public string contenido { get; set; }


        public string colorTema { get; set; }
        public string imagenPrincipal { get; set; }
        public string imagenSecundaria { get; set; }

        public string reconocimientoUnesco { get; set; }

        public int orden { get; set; }

        public bool activo { get; set; }
        public List<string> galeria { get; set; }
        public List<string> destacados { get; set; }
    }
}