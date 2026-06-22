using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebAppPromocionCauca.Interfaces;
using WebAppPromocionCauca.Models;

namespace WebAppPromocionCauca.Repositories
{
    public class SubregionLocalRepository : ISubregionRepository
    {
        public  List<SubregionModel> ObtenerSubregiones()
        {
            return new List<SubregionModel>
            {
                new SubregionModel
                {
                    slug = "pacifico",

                    nombre = "Pacífico",

                    colorTema = "#64C7D0",
                    orden=1,

                    imagenPrincipal ="images/subregiones/pacifico/1.webp",
                    imagenSecundaria="images/subregiones/pacifico/2.webp",

                    reconocimientoUnesco =
                        "Músicas de Marimba y Cantos Tradicionales del Pacífico Sur Colombiano.",

                    descripcion =
                        "Paraíso biocultural del Cauca, rodeado de selva y océano, donde las tradiciones afrodescendientes, la música de marimba, la biodiversidad y el avistamiento de ballenas crean experiencias inolvidables.",
                    contenido =
                        "La subregión Pacífico del Cauca, conformada por Guapi, López de Micay y Timbiquí, es un territorio de riqueza biocultural donde las tradiciones ancestrales afrodescendientes e indígenas se entrelazan con la selva tropical y la biodiversidad del océano Pacífico. \r\n\r\nEste destino alberga gran variedad de aves, mamíferos y reptiles, entre ellos el emblemático Lagarto Azul de Gorgona, y cuenta con el reconocimiento de la Unesco a la música de marimba, cantos y bailes tradicionales del Pacífico sur colombiano.\r\n\r\nTimbiquí se destaca como centro cultural de la región por su música, gastronomía y tradición artesanal del viche. Entre los principales atractivos turísticos sobresalen el Parque Nacional Natural Gorgona, ideal para el buceo y accesible desde Guapi, así como recorridos fluviales, senderismo y el avistamiento de ballenas jorobadas, especialmente entre mayo y octubre, temporada en la que estos mamíferos llegan a las costas pacíficas caucanas.",

                    destacados = new List<string>
                    {
                        "🎵 Patrimonio UNESCO",
                        "🐋 Avistamiento de Ballenas",
                        "🌿 Ecoturismo",
                        "🏝️ Playas y Manglares"
                    },
                 

                    galeria = new List<string>
                    {
                        "images/subregiones/pacifico/3.webp",
                        "images/subregiones/pacifico/4.webp",
                        "images/subregiones/pacifico/5.webp",
                        "images/subregiones/pacifico/6.webp"
                    }
                },

                new SubregionModel
                {
                    slug = "centro",

                    nombre = "Centro",

                    colorTema = "#0D6EFD",
                    orden=2,

                    imagenPrincipal ="images/subregiones/centro/1.webp",
                    imagenSecundaria="images/subregiones/centro/2.webp",

                    reconocimientoUnesco =
                        "Semana Santa de Popayán y Ciudad Creativa de la Gastronomía UNESCO.",

                    descripcion =
                        "Territorio de tradición cafetera, riqueza indígena y paisajes andinos, donde la cultura ancestral, el patrimonio histórico y el turismo de naturaleza se unen en experiencias únicas. ",
                    contenido =
                        "Entre las cordilleras Central y Occidental se encuentra la subregión central, reconocida por su tradición cafetera, su riqueza natural y la presencia de comunidades indígenas como los Misak, Kokonuco, Nasa y Yanakuna. \r\n\r\nSu diversidad de fauna, flora y paisajes da vida a múltiples experiencias turísticas, entre ellas rutas cafeteras y ancestrales, agroturismo, senderismo, gastronomía local y turismo comunitario.\r\n\r\nDestacan lugares y experiencias como Silvia y su mercado indígena; Popayán, la Ciudad Blanca, con su patrimonio arquitectónico y eventos culturales; Puracé - Coconuco, con ecoturismo, termalismo y el imponente Volcán Puracé; así como actividades de aventura en municipios como El Tambo y Timbío, reconocido como destino turístico sostenible. \r\n\r\nTambién sobresalen atractivos naturales y culturales en Sotará, como el sendero ecológico El Molino y la cascada San Roque.",

                    destacados = new List<string>
                    {
                        "⛪ Semana Santa",
                        "🍲 Gastronomía UNESCO",
                        "🏛️ Centro Histórico",
                        "🎭 Eventos Culturales"

                    },

                    galeria = new List<string>
                    {
                        "images/subregiones/centro/3.webp",
                        "images/subregiones/centro/4.webp",
                        "images/subregiones/centro/5.webp",
                        "images/subregiones/centro/6.webp"
                    }
                },

                new SubregionModel
                {
                    slug = "amazonico",

                    nombre = "Piedemonte amazónico",

                    colorTema = "#488000",
                    orden=3,

                    imagenPrincipal ="images/subregiones/amazonico/1.webp",
                    imagenSecundaria="images/subregiones/amazonico/2.webp",

                    reconocimientoUnesco =
                        "",

                    descripcion =
                        "Puerta de entrada a la Amazonía caucana, caracterizada por su inmensa biodiversidad, paisajes selváticos, cascadas y ecosistemas únicos ideales para el turismo de naturaleza y observación de fauna.",
                    contenido =
                        "La subregión de Piedemonte Amazónico, integrada por los municipios de Piamonte y Santa Rosa, se ubica en la Bota Caucana y representa la puerta de entrada a la selva amazónica en el departamento. \r\n\r\nSu mayor riqueza es el vasto patrimonio natural donde convergen los biomas andino y amazónico, creando escenarios ideales para el turismo de naturaleza, el avistamiento de aves, caminatas ecológicas y fotografía de paisajes. \r\n\r\nEntre sus principales atractivos se destacan el Parque Nacional Natural Serranía de los Churumbelos Auka-Wasi, cascadas como Nabueno, La Honda y La Cristalina, además de espacios naturales como el Río Congor, Río Tambor y el muelle sobre el río Caquetá. \r\n\r\nEsta subregión alberga una gran diversidad de fauna, incluyendo especies como jaguares, dantas, osos de anteojos, osos hormigueros y pirarucús, consolidándose como uno de los territorios de mayor valor ecosistémico del Cauca.",

                    destacados = new List<string>
                    {
                        "🧭Avistamiento de aves",
                        "🌿 Biodiversidad",
                    },

                    galeria = new List<string>
                    {
                        "images/subregiones/amazonico/3.webp",
                        "images/subregiones/amazonico/4.webp",
                        "images/subregiones/amazonico/5.webp",
                        "images/subregiones/amazonico/6.webp"
                    }
                },

                new SubregionModel
                {
                    slug = "macizo",

                    nombre = "Macizo del Cauca",

                    colorTema = "#FF7043",
                    orden=4,

                    imagenPrincipal ="images/subregiones/macizo/1.webp",
                    imagenSecundaria="images/subregiones/macizo/2.webp",

                    reconocimientoUnesco =
                        "Reservas de la Biosfera y Red Global de Museos del Agua.",

                    descripcion =
                        "Reserva hídrica y ecológica del país, reconocida por la Unesco como Reserva de la Biosfera, donde nacen importantes ríos y se desarrollan experiencias de turismo de naturaleza, avistamiento de aves y cultura campesina.",
                    contenido =
                        "La subregión Macizo del Cauca, ubicada sobre la cordillera suroccidental, es reconocida como Reserva de la Biosfera por la Unesco bajo la denominación “Cinturón Andino” y como una de las principales estrellas fluviales del país.\r\n\r\n Integrada por los municipios de Almaguer, La Sierra, La Vega, Rosas, Santa Rosa y San Sebastián, esta subregión se destaca por sus paisajes naturales, más de 30 lagunas y afluentes que dan origen a ríos emblemáticos como el Magdalena, Caquetá y Patía, convirtiéndola en un destino ideal para el turismo de naturaleza y avistamiento de aves. \r\n\r\nEntre sus principales atractivos sobresalen el Primer Museo Vivo del Agua de América Latina en San Sebastián; el complejo de páramos de Sotará y Los Bellones; la Laguna de San Andrés y el Mirador de Quebrada Azul en La Sierra; así como rutas agroculturales y recorridos por cuerpos lagunares dentro del Parque Nacional Natural Puracé. \r\n\r\nAdemás, Santa Rosa, conocido como el portal a la Amazonía colombiana, se posiciona como referente en avistamiento de aves, gracias a su gran diversidad de especies y espacios naturales como la Reserva Natural Paraíso Bombonas y la Serranía de los Churumbelos Auka Wasi.",

                    destacados = new List<string>
                    {
                        "💧 Estrella Hídrica",
                        "🌋 Volcán Puracé",
                        "🦅 Aviturismo",
                        "🥾 Ecoturismo"
                    },

                    galeria = new List<string>
                    {
                        "images/subregiones/macizo/3.webp",
                        "images/subregiones/macizo/4.webp",
                        "images/subregiones/macizo/5.webp",
                        "images/subregiones/macizo/6.webp"
                    }
                },


                new SubregionModel
                {
                    slug = "norte",

                    nombre = "Norte",

                    colorTema = "#9C27B0",
                    orden=5,

                    imagenPrincipal ="images/subregiones/norte/1.webp",
                    imagenSecundaria="images/subregiones/norte/2.webp",

                    reconocimientoUnesco =
                        "",

                    descripcion =
                        "Una región vibrante marcada por la diversidad cultural de comunidades afrodescendientes e indígenas, reconocida por su riqueza natural, el avistamiento de aves, sus expresiones artísticas y tradiciones ancestrales.",
                    contenido =
                        "La subregión Norte del Cauca, conformada por trece municipios, se caracteriza por su ubicación entre las cordilleras Central y Occidental y el inicio de las planicies del valle del río Cauca. \r\n\r\nSu riqueza cultural se refleja en la presencia de comunidades indígenas, afrocolombianas, campesinas y palenqueras, que mantienen vivas sus tradiciones y expresiones culturales.\r\n\r\nEntre sus principales atractivos turísticos destacan el Bosque de la Guadua Curva, la Reserva de Munchique y el avistamiento de aves en Santander de Quilichao, reconocida como la única “Ciudad de las Aves” de Colombia. \r\n\r\nTambién sobresalen el Embalse de La Salvajina en Suárez; la Cascada Santa Bárbara, el muralismo y el valle de palmas de cera en Toribío; el Museo de Yerry Mina en Guachené; así como festivales, ferias y expresiones culturales que fortalecen la identidad y el turismo en toda la subregión.",

                    destacados = new List<string>
                    {
                        "🌱 Agroindustria",
                        "🎨 Cultura Afro",
                        "🏞️ Paisajes Rurales",
                        "🤝 Economía Solidaria"
                    },

                    galeria = new List<string>
                    {
                        "images/subregiones/norte/3.webp",
                        "images/subregiones/norte/4.webp",
                        "images/subregiones/norte/5.webp",
                        "images/subregiones/norte/6.webp"
                    }
                },


                new SubregionModel
                {
                    slug = "oriente",

                    nombre = "Oriente",

                    colorTema = "#0D6EFD",
                    orden=6,

                    imagenPrincipal ="images/subregiones/oriente/1.webp",
                    imagenSecundaria="images/subregiones/oriente/2.webp",

                    reconocimientoUnesco ="",

                    descripcion =
                        "Destino de gran valor arqueológico y cultural, hogar de los pueblos Misak y Nasa, donde la naturaleza y la historia precolombina convergen en experiencias de turismo comunitario y ancestral en Tierradentro.",
                    contenido =
                        "La subregión Oriente del Cauca, conformada por los municipios de Inzá, Páez y Totoró, se ubica sobre la cordillera Central y se destaca por su riqueza cultural y natural, con presencia de los pueblos indígenas Misak y Nasa.\r\n \r\nEste territorio ofrece experiencias de turismo de naturaleza, comunitario, cultural y agroturismo, además de actividades como avistamiento de aves y encuentros con las comunidades originarias.\r\n\r\nBajo la marca “Tierradentro: Mágico y Natural”, Inzá y Páez promueven uno de los destinos culturales más importantes del país: el Parque Arqueológico de Tierradentro, declarado Patrimonio de la Humanidad por la Unesco en 1995. El lugar es reconocido por sus hipogeos o tumbas subterráneas, estatuas y arte rupestre, construcciones precolombinas labradas en roca viva que evidencian la riqueza cultural y espiritual de las antiguas civilizaciones que habitaron este territorio.",

                    destacados = new List<string>
                    {
                        "🏔️ Páramos",
                        "🌿 Biodiversidad",
                        "🧭 Turismo Comunitario",
                        "🏕️ Senderismo"
                    },

                    galeria = new List<string>
                    {
                        "images/subregiones/oriente/3.webp",
                        "images/subregiones/oriente/4.webp",
                        "images/subregiones/oriente/5.webp",
                        "images/subregiones/oriente/6.webp"
                    }
                },

                new SubregionModel
                {
                    slug = "sur",

                    nombre = "Sur",

                    colorTema = "#4CAF50",
                    orden=7,

                    imagenPrincipal ="images/subregiones/sur/1.webp",
                    imagenSecundaria="images/subregiones/sur/2.webp",

                    reconocimientoUnesco =
                        "",

                    descripcion =
                        "Epicentro del turismo de aventura en el departamento, reconocido por sus actividades extremas, paisajes montañosos y una fuerte identidad afrodescendiente reflejada en su música, gastronomía y artesanías.",
                    contenido =
                        "La subregión Sur del Cauca, ubicada entre las cordilleras Central y Occidental e integrada por siete municipios, se consolida como el destino de aventura del departamento, gracias a actividades como rafting, escalada en roca, trekking y parapente. Además, cuenta con eventos deportivos y atractivos turísticos como la Travesía Pedaleando por el Patía, centros recreativos y experiencias de turismo de naturaleza en municipios como Balboa y Bolívar.\r\n\r\nEsta subregión también se distingue por su fuerte herencia afrodescendiente y sus expresiones culturales tradicionales, entre ellas el bambuco patiano, la elaboración artesanal de violines y artesanías en totumo, así como la reconocida producción del kumis patiano. A esto se suman festividades emblemáticas como el Carnaval de Negros y Blancos y el Festival de Globos, que reflejan la identidad cultural y el arraigo de sus comunidades.",

                    destacados = new List<string>
                    {
                        "🎶 Música Tradicional",
                        "🍖 Gastronomía Patiana",
                        "🌄 Paisajes",
                        "🚵 Turismo Rural"

                    },

                    galeria = new List<string>
                    {
                        "images/subregiones/sur/3.webp",
                        "images/subregiones/sur/4.webp",
                        "images/subregiones/sur/5.webp",
                        "images/subregiones/sur/6.webp"
                    }
                }
            };
        }

        public SubregionModel ObtenerPorSlug(string slug)
        {
            return ObtenerSubregiones()
                .FirstOrDefault(x => x.slug == slug);
        }
    }
}