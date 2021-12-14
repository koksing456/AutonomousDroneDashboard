using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
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
    public partial class InspectionResult : System.Web.UI.Page
    {
        IFirebaseConfig config = new FirebaseConfig
        {
            AuthSecret = "cDAs0ZSAjPtxNB8G7q0ksFQbIIy46c9lBTgA5FJg",
            BasePath = "https://drone-project-f9a08-default-rtdb.asia-southeast1.firebasedatabase.app/"
        };
        IFirebaseClient client;
        protected void Page_Load(object sender, EventArgs e)
        {
            client = new FireSharp.FirebaseClient(config);

            var data = new Data();

            FirebaseResponse response;
            response = client.Get("CurrentMission");
            Data obj = response.ResultAs<Data>();
            var pName = response.Body;

            pName = pName.Remove(0, 53);
            for (int i = 0; i < pName.Length; i++)
            {
                if (pName[i] == '"')
                {
                    pName = pName.Remove(i);
                }

            }

            if(pName == "")
            {
                pName = "No mission is selected";
            }

            this.Master.TitleText = "Dashboard" + "<br>Current Mission: " + pName;

                if (!Page.IsPostBack)
                {


                    if(pName != "No mission is selected")
                    {
                        response = client.Get("Missions");
                        //Data obj = response.ResultAs<Data>();
                        var json = response.Body;

                        Dictionary<string, Data> elist = JsonConvert.DeserializeObject<Dictionary<string, Data>>(json);

                        ArrayList al = new ArrayList();

                        foreach (KeyValuePair<string, Data> entry in elist)
                        {
                            al.Add(entry.Key.ToString());
                        }

                        DataList1.DataSource = al;
                        DataList1.DataBind();
                    }
                    else
                    {
                        Label1.Text = "Please select a mission from project page";
                    }
                }
        }
    }
}