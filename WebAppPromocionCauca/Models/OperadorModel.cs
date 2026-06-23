using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppPromocionCauca.Models
{
    public class OperadorModel
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Telefono { get; set; }
        public string Correo { get; set; }
        public string SitioWeb { get; set; }
        public string LogoUrl { get; set; }
        public string RegistroTurismo { get; set; } // RNT (Registro Nacional de Turismo)
        public bool CertificadoSostenibilidad { get; set; }
    }
}