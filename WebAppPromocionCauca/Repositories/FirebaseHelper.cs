using Google.Cloud.Firestore;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;

namespace WebAppPromocionCauca.Repositories
{
    public static class FirebaseHelper
    {
        public static FirestoreDb ObtenerDb()
        {
            string credentialPath =
                HttpContext.Current.Server.MapPath(
                    ConfigurationManager.AppSettings["FirebaseKeyPath"]);

            if (!File.Exists(credentialPath))
            {
                throw new FileNotFoundException(
                    $"No existe el archivo Firebase: {credentialPath}");
            }

            Environment.SetEnvironmentVariable(
                "GOOGLE_APPLICATION_CREDENTIALS",
                credentialPath);

            return FirestoreDb.Create(
                ConfigurationManager.AppSettings["FirebaseProjectId"]);
        }
    }
}