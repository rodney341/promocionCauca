using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebAppPromocionCauca.Models;

namespace WebAppPromocionCauca.Interfaces
{
    public interface IRutasRepository
    {
        List<RutaModel> ObtenerTodas();

        RutaModel ObtenerPorId(int id);
    }
}
