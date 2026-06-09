using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebAppPromocionCauca.Models;

namespace WebAppPromocionCauca.Interfaz
{
    public interface IBlogRepository
    {
        List<BlogModel> ObtenerBlogs();
    }
}
