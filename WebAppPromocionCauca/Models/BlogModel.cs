using System;
using System.Collections.Generic;

namespace WebAppPromocionCauca.Models
{
    public class BlogModel
    {
        public string autor { get; set; }
        public string categoria { get; set; }
        public string titulo { get; set; }
        public string resumen { get; set; }
        public string contenido { get; set; }

        public DateTime fecha { get; set; }

        public string urlImagen { get; set; }
        public string urlImagen2 { get; set; }
        public Boolean activo { get; set; }

        public List<string> galeria { get; set; }

        public string slug
        {
            get
            {
                return titulo
                    .ToLower()
                    .Replace(" ", "-")
                    .Replace(",", "")
                    .Replace(".", "")
                    .Replace("á", "a")
                    .Replace("é", "e")
                    .Replace("í", "i")
                    .Replace("ó", "o")
                    .Replace("ú", "u")
                    .Replace("ñ", "n");
            }
        }
    }
}