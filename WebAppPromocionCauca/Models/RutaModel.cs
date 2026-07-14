using System;
using System.Collections.Generic;

namespace WebAppPromocionCauca.Models
{
    public class RutaModel
    {
        // Propiedades de Identificación y Filtros
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Categoria { get; set; }

        // Propiedades de la Ficha Técnica
        public string Duracion { get; set; }
        public string Distancia { get; set; }
        public string Municipios { get; set; }

        // Propiedades de Contenido Multimedia e Informativo
        public string Descripcion { get; set; }
        public string Contenido { get; set; }
        public string Imagen { get; set; }
        public string Atractivos { get; set; }
        public string Servicios { get; set; }

        // Colecciones Dinámicas para Capas y Galería
        public List<string> GeoJsonFiles { get; set; } = new List<string>();
        public List<string> GeoJsonDataList { get; set; } = new List<string>();
        public List<string> Tags { get; set; } = new List<string>();
        public string[] Galeria { get; set; }
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
