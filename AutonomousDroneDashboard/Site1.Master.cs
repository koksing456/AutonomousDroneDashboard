using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutonomousDroneDashboard
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public string TitleText
        {
            get
            {
                return pageTitlelbl.Text;
            }
            set
            {
                pageTitlelbl.Text = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}