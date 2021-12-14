using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using FireSharp.Config;
using FireSharp.Interfaces;
using FireSharp.Response;
using Newtonsoft.Json;

namespace AutonomousDroneDashboard
{
    public partial class Project : System.Web.UI.Page
    {
        IFirebaseConfig config = new FirebaseConfig
        {
            AuthSecret = "cDAs0ZSAjPtxNB8G7q0ksFQbIIy46c9lBTgA5FJg",
            BasePath = "https://drone-project-f9a08-default-rtdb.asia-southeast1.firebasedatabase.app/"
        };
        IFirebaseClient client;
        ArrayList al = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.Master.TitleText = "Projects";

                client = new FireSharp.FirebaseClient(config);

                var data = new Data();

                FirebaseResponse response;
                response = client.Get("Missions");
                Data obj = response.ResultAs<Data>();
                var json = response.Body;
                Dictionary<string, Data> elist = JsonConvert.DeserializeObject<Dictionary<string, Data>>(json);

                foreach (KeyValuePair<string, Data> entry in elist)
                {
                    al.Add(entry.Key.ToString());
                }

                DataList1.DataSource = al;
                DataList1.DataBind();
            }
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("FlightPlan.aspx");
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.SelectedIndex = e.Item.ItemIndex;
            pName.Text = ((System.Web.UI.WebControls.Label)DataList1.SelectedItem.FindControl("Label2")).Text;
            pName.Visible = true;

            //Response.Redirect("InspectionResult.aspx");
        }
    }
}