using System;
using System.Collections.Generic;

namespace WebAppPromocionCauca.Models
{
    public class RutaModel
    {
  
        public int id { get; set; }
        public string nombre { get; set; }
        public string categoria { get; set; }

   
        public string duracion { get; set; }
        public string distancia { get; set; }
        public string municipios { get; set; }

 
        public string descripcion { get; set; }
        public string contenido { get; set; }
        public string imagen { get; set; }
        public string atractivos { get; set; }
        public string servicios { get; set; }

 
        public List<string> geoJsonFiles { get; set; } = new List<string>();
        public List<string> geoJsonDataList { get; set; } = new List<string>();
        public List<string> tags { get; set; } = new List<string>();
        public string[] galeria { get; set; }
        public List<OperadorModel> operadores { get; set; } = new List<OperadorModel>();



        public RutaModel()
        {
            geoJsonFiles = new List<string>();
            geoJsonDataList = new List<string>();
            tags = new List<string>();
        }
    }
}
