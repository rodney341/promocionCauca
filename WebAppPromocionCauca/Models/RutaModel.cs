using System;
using System.Collections.Generic;

namespace WebAppPromocionCauca.Models
{
    public class RutaModel
    {
        // Propiedades de Identificación y Filtros
        public int Id { get; set; }
        public string Name { get; set; }
        public string Category { get; set; }

        // Propiedades de la Ficha Técnica
        public string Duration { get; set; }
        public string Distance { get; set; }
        public string Municipios { get; set; }

        // Propiedades de Contenido Multimedia e Informativo
        public string ShortDesc { get; set; }
        public string LongDesc { get; set; }
        public string Image { get; set; }
        public string Atractivos { get; set; }
        public string Servicios { get; set; }

        // Colecciones Dinámicas para Capas y Galería
        public List<string> GeoJsonFiles { get; set; } = new List<string>();
        public List<string> GeoJsonDataList { get; set; } = new List<string>();
        public List<string> Tags { get; set; } = new List<string>();
        public string[] Gallery { get; set; }
        public List<OperadorModel> Operadores { get; set; } = new List<OperadorModel>();


        // Constructor básico para evitar errores de referencias nulas
        public RutaModel()
        {
            GeoJsonFiles = new List<string>();
            GeoJsonDataList = new List<string>();
            Tags = new List<string>();
        }
    }
}
