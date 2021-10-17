﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SQLite;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutonomousDroneDashboard
{
    public partial class FlightPlan : System.Web.UI.Page
    {
        SQLiteConnection con = new SQLiteConnection(ConfigurationManager.ConnectionStrings["DroneConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            SQLiteCommand cmd = new SQLiteCommand("SELECT DISTINCT osm_id FROM sqlRiver", con);
            con.Open();
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SQLiteDataAdapter da = new SQLiteDataAdapter(cmd);
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    lblRiverName.Text = dr["osm_id"].ToString();
                }
            }

            con.Close();

        }

        public string BinaryToText(byte[] data)
        {
            MemoryStream stream = new MemoryStream(data);
            StreamReader reader = new StreamReader(stream, Encoding.UTF8);
            string text = reader.ReadToEnd();
            return text;
        }
    }
}