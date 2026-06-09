using System.Configuration;

using WebAppPromocionCauca.Interfaz;


namespace WebAppPromocionCauca.Repository
{
    public static class RepositoryFactory
    {
        private static string DataSource => ConfigurationManager.AppSettings["DataSource"];
        public static IBlogRepository CrearBlogRepository()
        {
            switch (DataSource)
            {
                case "Firestore":
                    return new BlogFirestoreRepository();

                case "Sheets":
                default:
                    return new BlogSheetsRepository();
            }
        }

        public static ISubregionRepository CrearSubregionRepository()
        {

            switch (DataSource)
            {
                case "Firestore":
                    return new SubregionFirestoreRepository();

                case "Sheets":
                default:
                    return new SubregionSheetsRepository();
            }
        }
    }
}