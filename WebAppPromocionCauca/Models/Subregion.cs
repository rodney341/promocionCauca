using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppPromocionCauca
{
    public class Subregion
    {
        public string id { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public string imagen { get; set; }
        public string url { get; set; }
        public int orden { get; set; }
        public bool activo { get; set; }
    }
}