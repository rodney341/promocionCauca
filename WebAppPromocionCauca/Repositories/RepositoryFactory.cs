using System.Configuration;

using WebAppPromocionCauca.Interfaces;


namespace WebAppPromocionCauca.Repositories
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
                    return new BlogSheetsRepository();
                default:
                    return new BlogFirestoreRepository();
            }
        }

        public static ISubregionRepository CrearSubregionRepository()
        {

            switch (DataSource)
            {
                case "Firestore":
                    return new SubregionFirestoreRepository();

                case "Sheets":
                    return new SubregionSheetsRepository();

                default:
                    return new SubregionLocalRepository();
            }
        }
    }
}