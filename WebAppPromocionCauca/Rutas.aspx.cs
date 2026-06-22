using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using System.IO;

namespace WebAppPromocionCauca
{
    public partial class Rutas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Código inicial de carga de la página si es necesario
        }

        // Definimos la estructura de la Ruta turística
        public class RutaTuristica
        {
            public int id { get; set; }
            public string name { get; set; }
            public string category { get; set; }
            public string duration { get; set; }
            public string distance { get; set; }
            public string municipios { get; set; }
            public string shortDesc { get; set; }
            public string longDesc { get; set; }
            public string image { get; set; }
            public string atractivos { get; set; }
            public string servicios { get; set; }
            // Agrupamos los archivos en colecciones dinámicas
            public List<string> geoJsonFiles { get; set; }
            public List<string> geoJsonDataList { get; set; }
            public string[] gallery { get; set; }
        }

        [WebMethod]
        public static List<RutaTuristica> ObtenerRutas()
        {
            // Aquí puedes reemplazar este bloque simulado por una consulta real a SQL Server 
            // usando ADO.NET, Entity Framework o Dapper.
            var lista = new List<RutaTuristica>
            {
                new RutaTuristica
                {
                    id = 1,
                    name = "Ruta de la Ciudad Blanca",
                    category = "cultura gastronomia",
                    duration = "2 Días / 1 Noche",
                    distance = "15 km",
                    municipios = "Popayán",
                    shortDesc = "Un recorrido urbano y cultural por el Centro Histórico.",
                    longDesc = "Explora la arquitectura colonial de Popayán. Incluye catas de café de alta montaña, talleres de cocina tradicional (pipián y carantanta) y recorridos nocturnos por templos históricos.",
                    image = "images/rutas/Patrimonio-MiguelVarona.webp",
                    atractivos = "Catedral de Popayán, Puente del Humilladero, Museo de Arte Religioso",
                    servicios = "Guianza bilingüe, transporte interno, degustación gastronómica",
                    geoJsonFiles = new List<string> {
                        "ciudad_blanca/1.json",
                        "ciudad_blanca/2.geojson",
                        "ciudad_blanca/3.geojson",
                        "ciudad_blanca/4.geojson"
                    },
                    geoJsonDataList = new List<string>(),
                    gallery = new string[] { "images/galeria/popayan1.webp", "images/galeria/popayan2.webp" }
                },
                new RutaTuristica
                {
                    id = 2,
                    name = "Travesía Ancestral Puracé",
                    category = "naturaleza aventura",
                    duration = "1 Día (Pasadía)",
                    distance = "45 km",
                    municipios = "Puracé (Coconuco)",
                    shortDesc = "Conexión profunda con el territorio indígena y volcanes.",
                    longDesc = "Avistamiento del Cóndor de los Andes, senderismo guiado hacia las termales de San Juan y las faldas del imponente Volcán Puracé con guías locales de la comunidad.",
                    image = "images/rutas/Purace-Naturaleza.webp",
                    atractivos = "Termales de San Juan, Valle de los Frailejones, Cascada del Candelabro",
                    servicios = "Registro e ingreso al parque, paramédico, almuerzo típico ancestral",
                    geoJsonFiles = new List<string> {
                        "purace/1.json",
                        "purace/2.json",
                        "purace/3.json",
                        "purace/4.json"
                    },
                    geoJsonDataList = new List<string>(),
                    gallery = new string[] { "images/galeria/purace1.webp", "images/galeria/purace2.webp" }
                },
                new RutaTuristica
                {
                    id = 3,
                    name = "Cerro de las tres cruces",
                    category = "naturaleza aventura",
                    duration = "1 Día (Pasadía)",
                    distance = "45 km",
                    municipios = "Popayán",
                    shortDesc = "Conexión profunda con el territorio indígena y volcanes.",
                    longDesc = "Avistamiento del Cóndor de los Andes, senderismo guiado hacia las termales de San Juan y las faldas del imponente Volcán Puracé con guías locales de la comunidad.",
                    image = "images/rutas/tierradentro-FotoMiguelVarona-3.webp",
                    atractivos = "Termales de San Juan, Valle de los Frailejones, Cascada del Candelabro",
                    servicios = "Registro e ingreso al parque, paramédico, almuerzo típico ancestral",
                    geoJsonFiles = new List<string> {
                        "tres_cruces/1.json",
                        "tres_cruces/2.json",
                        "tres_cruces/3.json",
                        "tres_cruces/4.json"
                    },
                    geoJsonDataList = new List<string>(),
                    gallery = new string[] { "images/galeria/purace1.webp", "images/galeria/purace2.webp" }
                }

            };

            // Leer de forma automatizada cada archivo del arreglo de rutas
            foreach (var ruta in lista)
            {
                if (ruta.geoJsonFiles != null)
                {
                    foreach (var archivoName in ruta.geoJsonFiles)
                    {
                        string rutaFisica = HttpContext.Current.Server.MapPath($"~/jsonFiles/{archivoName}");
                        if (File.Exists(rutaFisica))
                        {
                            ruta.geoJsonDataList.Add(File.ReadAllText(rutaFisica));
                        }
                        else
                        {
                            ruta.geoJsonDataList.Add("{}"); // Objeto vacío de seguridad
                        }
                    }
                }
            }

            return lista;
        }
    }
}
