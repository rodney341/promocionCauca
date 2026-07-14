using System;
using System.Collections.Generic;
using System.Linq;
using WebAppPromocionCauca.Models; // Asegúrate de que coincida con tu espacio de nombres del modelo

namespace WebAppPromocionCauca.Repositories
{
    public class RutasLocalRepository
    {

        private static readonly List<RutaModel> _catalogoRutas = new List<RutaModel>
        {
            new RutaModel
            {
                Id = 4,
                Nombre = "Ruta de la Salud: Ascenso al Cerro de las Tres Cruces",
                Categoria = "naturaleza aventura",
                Duracion = "1 Día (Media Jornada)",
                Distancia = "2.8 km",
                Municipios = "Popayán",
                Descripcion = "El principal desafío deportivo y mirador natural de Popayán. Un sendero ecológico que premia el esfuerzo con la mejor panorámica de la Ciudad Blanca y tradiciones locales.",
                Contenido = "Inicie el día como lo hacen los payaneses. Este recorrido es el epicentro de la actividad física y el ecoturismo urbano en Popayán; un ascenso exigente que serpentea por un sendero natural hasta la cima del cerro, cruzando estaciones de avistamiento de aves y bosque andino. Al llegar a la cumbre, junto a las tres imponentes estructuras monumentales, disfrutará de una vista de 360 grados sobre el valle de Pubenza y la recompensa gastronómica tradicional de la región.",
                Imagen = "images/rutas/tres_cruces/1.webp",
                Atractivos = "Mirador Panorámico de Popayán, Monumento de las Tres Cruces, Avistamiento de avifauna andina, Sector gastronómico de la cima.",
                Servicios = "Puntos de hidratación autorizados, guianza e interpretación ambiental local, acompañamiento de seguridad en horarios deportivos establecidos.",
                GeoJsonFiles = new List<string> { "tres_cruces/1.json", "tres_cruces/2.json","tres_cruces/3.json","tres_cruces/4.json","tres_cruces/5.json","tres_cruces/6.json" },
                Tags = new List<string> { "Senderismo", "Deporte", "Mirador" },
                Galeria = new string[] {
                    "images/rutas/tres_cruces/2.webp",
                    "images/rutas/tres_cruces/3.webp",
                    "images/rutas/tres_cruces/4.webp",
                    "images/rutas/tres_cruces/5.webp",
                },

                Operadores = new List<OperadorModel>
                {
                    new OperadorModel {
                        Id = 104,
                        Nombre = "Pubenza Outdoor & Trekking",
                        Telefono = "+57 318 555 1234",
                        Correo = "info@pubenzaoutdoor.com",
                        SitioWeb = "https://example.com",
                        RegistroTurismo = "RNT 55102",
                        CertificadoSostenibilidad = true
                    },
                    new OperadorModel {
                        Id = 105,
                        Nombre = "Guías de Alta Montaña del Cauca",
                        Telefono = "+57 301 444 5678",
                        Correo = "guias@montanacauca.org",
                        SitioWeb = "https://example.com",
                        RegistroTurismo = "RNT 31044",
                        CertificadoSostenibilidad = false
                    }
                }
            },


            new RutaModel
            {
                Id = 1,
                Nombre = "Ruta de la \"Ciudad Blanca\" y los Saberes Gastronómicos",
                Categoria = "cultura gastronomia",
                Duracion = "2 Días / 1 Noche",
                Distancia = "15 km",
                Municipios = "Popayán",
                Descripcion = "Un recorrido urbano y cultural por el Centro Histórico de Popayán. Incluye catas de café de alta montaña del Cauca, talleres de cocina tradicional (pipián y carantanta) y recorridos guiados nocturnos por las iglesias coloniales.",
                Contenido = "Explora la joya colonial del Cauca. Esta ruta abarca recorridos por la arquitectura barroca del sector histórico, catas guiadas de cafés especiales cultivados por comunidades caficultoras locales y talleres culinarios inmersivos donde aprenderás la técnica ancestral del pipián y el crujiente de la carantanta.",
                Imagen = "images/rutas/Patrimonio-MiguelVarona.webp",
                Atractivos = "Catedral Basílica, Puente del Humilladero, Panteón de los Próceres, El Morro de Tulcán.",
                Servicios = "Seguro de asistencia médica, guías profesionales bilingües certificados, entradas a museos, menús de degustación de la cocina tradicional indexada por la UNESCO.",
                GeoJsonFiles = new List<string> { "ciudad_blanca/1.json", "ciudad_blanca/2.json", "ciudad_blanca/3.json", "ciudad_blanca/4.json" },
                Tags = new List<string> { "Popayán", "Gastronomía", "Cultura" },
                Galeria = new string[] { "images/galeria/popayan1.webp", "images/galeria/popayan2.webp" },
                Operadores = new List<OperadorModel>
                {
                    new OperadorModel { Id = 103, Nombre = "Puracé Aventuras Indígenas", Telefono = "+57 312 456 7890", Correo = "reservas@puraceaventura.com", SitioWeb = "https://example.com", RegistroTurismo = "RNT 19455", CertificadoSostenibilidad = true }
                }
            },
            new RutaModel
            {
                Id = 2,
                Nombre = "Travesía del Cóndor: El Sendero Volcánico",
                Categoria = "naturaleza aventura",
                Duracion = "3 Días / 2 Noches",
                Distancia = "45 km",
                Municipios = "Popayán, Puracé (Coconuco)",
                Descripcion = "Un circuito de naturaleza exigente que inicia en Popayán, asciende al municipio de Puracé, visita la cascada del Bedón, los Termales de San Juan y finaliza con el avistamiento del Cóndor de los Andes y senderismo guiado en el Parque Natural.",
                Contenido = "Ascienda a las cumbres andinas del Cauca. Una ruta diseñada para montañistas y entusiastas del ecoturismo que recorre la geografía del Parque Nacional Natural Puracé, permitiendo el avistamiento del imponente Cóndor de los Andes, caminatas sobre campos de frailejones y descanso termal terapéutico gestionado por la comunidad indígena Coconuco.",
                Imagen = "images/rutas/guardianes_de_puracé_AR.webp",
                Atractivos = "Termales de San Juan, Cascada del Bedón, Laguna de San Rafael, Avistamiento de Cóndores.",
                Servicios = "Permisos de ingreso al Parque Nacional, baquianos de la comunidad indígena local, alimentación balanceada de alta montaña, transporte de aproximación en vehículos 4x4.",
                GeoJsonFiles = new List<string> { "purace_sendero1.geojson" },
                Tags = new List<string> { "Ecoturismo", "PNN Puracé", "Termales" },
                Galeria = new string[] { "images/galeria/purace1.webp" },
                Operadores = new List<OperadorModel>
                {
                    new OperadorModel { Id = 103, Nombre = "Puracé Aventuras Indígenas", Telefono = "+57 312 456 7890", Correo = "reservas@puraceaventura.com", SitioWeb = "https://example.com", RegistroTurismo = "RNT 19455", CertificadoSostenibilidad = true }
                }
            },
            new RutaModel
            {
                Id = 3,
                Nombre = "Circuito Intercultural de los Andes y Tierradentro",
                Categoria = "cultura arqueologia",
                Duracion = "4 Días / 3 Noches",
                Distancia = "120 km",
                Municipios = "Silvia, Inzá",
                Descripcion = "Conecta el colorido mercado indígena de Silvia de los días martes (comunidad Misak) con el misticismo arqueológico del Oriente caucano en Inzá. Diseñado para explorar los hipogeos prehispánicos tallados bajo tierra.",
                Contenido = "Adéntrese en el misticismo del oriente caucano. Esta travesía conecta los saberes vivos de la comunidad Misak en Silvia durante su día de mercado con el Parque Arqueológico Nacional de Tierradentro en Inzá, donde descenderá a los majestuosos hipogeos prehispánicos decorados con motivos geométricos prehispánicos.",
                Imagen = "images/rutas/tierradentro-FotoMiguelVarona-3.webp",
                Atractivos = "Resguardo Indígena de Guambía, Parque Arqueológico Tierradentro, Alto de Segovia, Hipogeos.",
                Servicios = "Entradas al parque arqueológico, guías locales nativos, alojamiento en posadas rurales, talleres de tejido tradicional.",
                GeoJsonFiles = new List<string> { "tierradentro_etapa1.geojson" },
                Tags = new List<string> { "Silvia", "Tierradentro", "Etnoturismo" },
                Galeria = new string[] { "images/galeria/tierradentro1.webp" },
                Operadores = new List<OperadorModel>
                {
                    new OperadorModel { Id = 103, Nombre = "Puracé Aventuras Indígenas", Telefono = "+57 312 456 7890", Correo = "reservas@puraceaventura.com", SitioWeb = "https://example.com", RegistroTurismo = "RNT 19455", CertificadoSostenibilidad = true }
                }
            }
        };

        public List<RutaModel> ObtenerTodas()
        {
            return _catalogoRutas;
        }


        public RutaModel ObtenerPorId(int id)
        {
            return _catalogoRutas.FirstOrDefault(r => r.Id == id);
        }
    }
}
