using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using WebAppPromocionCauca.Interfaces;
using WebAppPromocionCauca.Models;

namespace WebAppPromocionCauca.Repositories
{
        public class RutasSheetsRepository : IRutasRepository
        {

            private const string UrlApi =
                "https://script.google.com/macros/s/AKfycbzYCFV9_MpsPPHKJaxV9dFLUSKWRKk0spMBzLXW1fNmrrRnNN44iQJyX_X83-MYEKj3ow/exec?tipo=rutas";

            public List<RutaModel> ObtenerTodas()
            {
                using (var client = new HttpClient())
                {
                    var json = client.GetStringAsync(UrlApi).Result;

                    return JsonConvert.DeserializeObject<List<RutaModel>>(json);
                }
            }

            public RutaModel ObtenerPorId(int id)
            {
                var rutas = ObtenerTodas();

                return rutas.Find(x => x.id == id);
            }
        }




}