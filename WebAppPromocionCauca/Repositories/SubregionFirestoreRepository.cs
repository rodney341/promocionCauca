using Google.Cloud.Firestore;
using Google.Cloud.Firestore.V1;
using System;
using System.Collections.Generic;
using WebAppPromocionCauca.Interfaces;
using WebAppPromocionCauca.Models;

namespace WebAppPromocionCauca.Repositories
{
    public class SubregionFirestoreRepository : ISubregionRepository
    {
        public List<SubregionModel> ObtenerSubregiones()
        {
            FirestoreDb db = FirebaseHelper.ObtenerDb();

            Query query = db.Collection("subregiones")
                            .WhereEqualTo("activo", true)
                            .OrderBy("orden");
            List<SubregionModel> lista =
             new List<SubregionModel>();
            try
            {
                QuerySnapshot snapshot =
                    query.GetSnapshotAsync()
                         .GetAwaiter()
                         .GetResult();

                foreach (DocumentSnapshot doc in snapshot.Documents)
                {
                    lista.Add(new SubregionModel
                    {
                        nombre = doc.GetValue<string>("nombre"),
                        descripcion = doc.GetValue<string>("descripcion"),
                        contenido = doc.GetValue<string>("contenido"),
                        slug = doc.GetValue<string>("slug"),
                        orden = doc.GetValue<int>("orden"),
                        activo = doc.GetValue<bool>("activo"),
                        colorTema = doc.GetValue<string>("colorTema"),
                        imagenPrincipal = doc.GetValue<string>("imagenPrincipal"),
                        imagenSecundaria = doc.GetValue<string>("imagenSecundaria"),
                        reconocimientoUnesco = doc.GetValue<string>("reconocimientoUnesco"),
                        destacados = doc.ContainsField("destacados")
                           ? doc.GetValue<List<string>>("destacados")
                        : new List<string>(),
                        galeria = doc.ContainsField("galeria")
                           ? doc.GetValue<List<string>>("galeria")
                        : new List<string>()
                    });
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception(
                "Error obteniendo subregiones desde Firestore",
                ex);
            }

        }
    }
}