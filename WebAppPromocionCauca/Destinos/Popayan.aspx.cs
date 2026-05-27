using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppPromocionCauca.Destinos
{
    public partial class Popayan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.Title = "Popayán Colonial y Gastronómica | Turismo Cauca";
                Page.MetaDescription = "Guía turística de Popayán, la Ciudad Blanca. Explora su centro histórico, iglesias coloniales y conoce por qué es Ciudad de la Gastronomía por la UNESCO.";
                Page.MetaKeywords = "popayan colombia, ciudad blanca, empanadas de pipian, semana santa popayan, puente del humilladero, turismo religioso colombia";
            }
        }
    }
}