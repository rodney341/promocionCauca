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
                id = 4,
                nombre = "Ruta de la Salud: Ascenso al Cerro de las Tres Cruces",
                categoria = "naturaleza aventura",
                duracion = "1 Día (Media Jornada)",
                distancia = "2.8 km",
                municipios = "Popayán",
                descripcion = "El principal desafío deportivo y mirador natural de Popayán. Un sendero ecológico que premia el esfuerzo con la mejor panorámica de la Ciudad Blanca y tradiciones locales.",
                contenido = "Inicie el día como lo hacen los payaneses. Este recorrido es el epicentro de la actividad física y el ecoturismo urbano en Popayán; un ascenso exigente que serpentea por un sendero natural hasta la cima del cerro, cruzando estaciones de avistamiento de aves y bosque andino. Al llegar a la cumbre, junto a las tres imponentes estructuras monumentales, disfrutará de una vista de 360 grados sobre el valle de Pubenza y la recompensa gastronómica tradicional de la región.",
                imagen = "images/rutas/tres_cruces/1.webp",
                atractivos = "Mirador Panorámico de Popayán, Monumento de las Tres Cruces, Avistamiento de avifauna andina, Sector gastronómico de la cima.",
                servicios = "Puntos de hidratación autorizados, guianza e interpretación ambiental local, acompañamiento de seguridad en horarios deportivos establecidos.",
                geoJsonFiles = new List<string> { "tres_cruces/1.json", "tres_cruces/2.json","tres_cruces/3.json","tres_cruces/4.json","tres_cruces/5.json","tres_cruces/6.json" },
                tags = new List<string> { "Senderismo", "Deporte", "Mirador" },
                galeria = new string[] {
                    "images/rutas/tres_cruces/2.webp",
                    "images/rutas/tres_cruces/3.webp",
                    "images/rutas/tres_cruces/4.webp",
                    "images/rutas/tres_cruces/5.webp",
                },

                operadores = new List<OperadorModel>
                {
                    new OperadorModel {
                        id = 104,
                        nombre = "Pubenza Outdoor & Trekking",
                        telefono = "+57 318 555 1234",
                        correo = "info@pubenzaoutdoor.com",
                        sitioWeb = "https://example.com",
                        registroTurismo = "RNT 55102",
                        certificadoSostenibilidad = true
                    },
                    new OperadorModel {
                        id = 105,
                        nombre = "Guías de Alta Montaña del Cauca",
                        telefono = "+57 301 444 5678",
                        correo = "guias@montanacauca.org",
                        sitioWeb = "https://example.com",
                        registroTurismo = "RNT 31044",
                        certificadoSostenibilidad = false
                    }
                }
            },


            new RutaModel
            {
                id = 1,
                nombre = "Ruta de la \"Ciudad Blanca\" y los Saberes Gastronómicos",
                categoria = "cultura gastronomia",
                duracion = "2 Días / 1 Noche",
                distancia = "15 km",
                municipios = "Popayán",
                descripcion = "Un recorrido urbano y cultural por el Centro Histórico de Popayán. Incluye catas de café de alta montaña del Cauca, talleres de cocina tradicional (pipián y carantanta) y recorridos guiados nocturnos por las iglesias coloniales.",
                contenido = "Explora la joya colonial del Cauca. Esta ruta abarca recorridos por la arquitectura barroca del sector histórico, catas guiadas de cafés especiales cultivados por comunidades caficultoras locales y talleres culinarios inmersivos donde aprenderás la técnica ancestral del pipián y el crujiente de la carantanta.",
                imagen = "images/rutas/Patrimonio-MiguelVarona.webp",
                atractivos = "Catedral Basílica, Puente del Humilladero, Panteón de los Próceres, El Morro de Tulcán.",
                servicios = "Seguro de asistencia médica, guías profesionales bilingües certificados, entradas a museos, menús de degustación de la cocina tradicional indexada por la UNESCO.",
                geoJsonFiles = new List<string> { "ciudad_blanca/1.json", "ciudad_blanca/2.json", "ciudad_blanca/3.json", "ciudad_blanca/4.json" },
                tags = new List<string> { "Popayán", "Gastronomía", "Cultura" },
                galeria = new string[] { "images/galeria/popayan1.webp", "images/galeria/popayan2.webp" },
                operadores = new List<OperadorModel>
                {
                    new OperadorModel { id = 103, nombre = "Puracé Aventuras Indígenas", telefono = "+57 312 456 7890", correo = "reservas@puraceaventura.com", sitioWeb = "https://example.com", registroTurismo = "RNT 19455", certificadoSostenibilidad = true }
                }
            },
            new RutaModel
            {
                id = 2,
                nombre = "Travesía del Cóndor: El Sendero Volcánico",
                categoria = "naturaleza aventura",
                duracion = "3 Días / 2 Noches",
                distancia = "45 km",
                municipios = "Popayán, Puracé (Coconuco)",
                descripcion = "Un circuito de naturaleza exigente que inicia en Popayán, asciende al municipio de Puracé, visita la cascada del Bedón, los Termales de San Juan y finaliza con el avistamiento del Cóndor de los Andes y senderismo guiado en el Parque Natural.",
                contenido = "Ascienda a las cumbres andinas del Cauca. Una ruta diseñada para montañistas y entusiastas del ecoturismo que recorre la geografía del Parque Nacional Natural Puracé, permitiendo el avistamiento del imponente Cóndor de los Andes, caminatas sobre campos de frailejones y descanso termal terapéutico gestionado por la comunidad indígena Coconuco.",
                imagen = "images/rutas/guardianes_de_puracé_AR.webp",
                atractivos = "Termales de San Juan, Cascada del Bedón, Laguna de San Rafael, Avistamiento de Cóndores.",
                servicios = "Permisos de ingreso al Parque Nacional, baquianos de la comunidad indígena local, alimentación balanceada de alta montaña, transporte de aproximación en vehículos 4x4.",
                geoJsonFiles = new List<string> { "purace_sendero1.geojson" },
                tags = new List<string> { "Ecoturismo", "PNN Puracé", "Termales" },
                galeria = new string[] { "images/galeria/purace1.webp" },
                operadores = new List<OperadorModel>
                {
                    new OperadorModel { id = 103, nombre = "Puracé Aventuras Indígenas", telefono = "+57 312 456 7890", correo = "reservas@puraceaventura.com", sitioWeb = "https://example.com", registroTurismo = "RNT 19455", certificadoSostenibilidad = true }
                }
            },
            new RutaModel
            {
                id = 3,
                nombre = "Circuito Intercultural de los Andes y Tierradentro",
                categoria = "cultura arqueologia",
                duracion = "4 Días / 3 Noches",
                distancia = "120 km",
                municipios = "Silvia, Inzá",
                descripcion = "Conecta el colorido mercado indígena de Silvia de los días martes (comunidad Misak) con el misticismo arqueológico del Oriente caucano en Inzá. Diseñado para explorar los hipogeos prehispánicos tallados bajo tierra.",
                contenido = "Adéntrese en el misticismo del oriente caucano. Esta travesía conecta los saberes vivos de la comunidad Misak en Silvia durante su día de mercado con el Parque Arqueológico Nacional de Tierradentro en Inzá, donde descenderá a los majestuosos hipogeos prehispánicos decorados con motivos geométricos prehispánicos.",
                imagen = "images/rutas/tierradentro-FotoMiguelVarona-3.webp",
                atractivos = "Resguardo Indígena de Guambía, Parque Arqueológico Tierradentro, Alto de Segovia, Hipogeos.",
                servicios = "Entradas al parque arqueológico, guías locales nativos, alojamiento en posadas rurales, talleres de tejido tradicional.",
                geoJsonFiles = new List<string> { "tierradentro_etapa1.geojson" },
                tags = new List<string> { "Silvia", "Tierradentro", "Etnoturismo" },
                galeria = new string[] { "images/galeria/tierradentro1.webp" },
                operadores = new List<OperadorModel>
                {
                    new OperadorModel { id = 103, nombre = "Puracé Aventuras Indígenas", telefono = "+57 312 456 7890", correo = "reservas@puraceaventura.com", sitioWeb = "https://example.com", registroTurismo = "RNT 19455", certificadoSostenibilidad = true }
                }
            }
        };

        public List<RutaModel> ObtenerTodas()
        {
            return _catalogoRutas;
        }


        public RutaModel ObtenerPorId(int id)
        {
            return _catalogoRutas.FirstOrDefault(r => r.id == id);
        }
    }
}
