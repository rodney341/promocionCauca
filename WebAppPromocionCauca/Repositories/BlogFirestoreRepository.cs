using Google.Cloud.Firestore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebAppPromocionCauca.Interfaces;
using WebAppPromocionCauca.Models;

namespace WebAppPromocionCauca.Repositories
{
    public class BlogFirestoreRepository : IBlogRepository
    {
        public List<BlogModel> ObtenerBlogs()
        {   
            FirestoreDb db = FirebaseHelper.ObtenerDb();

            Query query =
                db.Collection("blog");

            QuerySnapshot snapshot =
                query.GetSnapshotAsync()
                     .GetAwaiter()
                     .GetResult();

            List<BlogModel> blogs =
                new List<BlogModel>();

            foreach (DocumentSnapshot doc in snapshot.Documents)
            {
                blogs.Add(new BlogModel
                {
                    titulo =
                        doc.GetValue<string>("titulo"),

                    resumen =
                        doc.GetValue<string>("resumen"),

                    contenido =
                        doc.GetValue<string>("contenido"),

                    categoria =
                        doc.GetValue<string>("categoria"),

                    autor =
                        doc.GetValue<string>("autor"),
                    galeria = doc.ContainsField("galeria")
                        ? doc.GetValue<List<string>>("galeria")
                        : new List<string>()
                });
            }

            return blogs;
        }
    }

}