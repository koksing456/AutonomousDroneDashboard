using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutonomousDroneDashboard
{
    public partial class WeatherPrediction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.TitleText = "Forecast Weather";
            ScriptManager.RegisterStartupScript(this, Page.GetType(), "key", "DefaultScreen()", true);
        }
    }
}