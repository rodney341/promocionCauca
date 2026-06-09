using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using WebAppPromocionCauca.Interfaz;
using WebAppPromocionCauca.Models;

namespace WebAppPromocionCauca.Repository
{
    public class SubregionSheetsRepository : ISubregionRepository
    {
        public List<SubregionModel> ObtenerSubregiones()
        {
            string url = $"{ConfigurationManager.AppSettings["GoogleScriptUrl"]}?tipo=subregiones";

            using (WebClient client = new WebClient())
            {
                client.Encoding =
                    System.Text.Encoding.UTF8;

                string json =
                    client.DownloadString(url);

                return JsonConvert
                    .DeserializeObject<List<SubregionModel>>(json).OrderByDescending(x => x.orden)
                        .ToList(); ;
            }
        }
    }
}