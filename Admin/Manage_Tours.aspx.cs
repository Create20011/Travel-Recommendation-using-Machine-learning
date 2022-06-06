using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class Seller_Manage_Property : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static bool flag;
    protected static DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["s_id"] == null)
        {
            Response.Redirect("/Admin.aspx");
        }
        conn = new SqlConnection(cs);
        dt = new DataTable();
        using (SqlCommand cmd = new SqlCommand("select * from  tour_master", conn))
        {
            //cmd.Parameters.AddWithValue("@id", Session["s_id"].ToString());
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                sda.Fill(dt);
            }
            if (dt.Rows.Count > 0)
            {
                flag = true;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);
        using (SqlCommand cmd = new SqlCommand("select * from property_master where p_name=@name", conn))
        {
            //cmd.Parameters.AddWithValue("@id", Session["s_id"].ToString());
            cmd.Parameters.AddWithValue("@name", txtid.Text);
            using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                dt = new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {

                    flag = true;

                }

            }
        }
    }
}