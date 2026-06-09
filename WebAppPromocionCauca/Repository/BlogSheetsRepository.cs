using Newtonsoft.Json;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using WebAppPromocionCauca.Interfaz;
using WebAppPromocionCauca.Models;

namespace WebAppPromocionCauca.Repository
{
    public class BlogSheetsRepository : IBlogRepository
    {
        public List<BlogModel> ObtenerBlogs()
        {
            string url = $"{ConfigurationManager.AppSettings["GoogleScriptUrl"]}?tipo=blog";

            using (WebClient client = new WebClient())
            {
                client.Encoding =
                    System.Text.Encoding.UTF8;

                string json =
                    client.DownloadString(url);

                return JsonConvert
                    .DeserializeObject<List<BlogModel>>(json).OrderByDescending(x => x.fecha)
                        .ToList(); ;
            }
        }
    }
}