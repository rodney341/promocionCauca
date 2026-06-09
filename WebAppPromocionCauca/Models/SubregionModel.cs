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

        public string imagen { get; set; }

        public int orden { get; set; }

        public bool activo { get; set; }
        public List<string> galeria { get; set; }
    }
}