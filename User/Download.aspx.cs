using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class User_Download : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);
        string id = Request.QueryString["id"].ToString();
        using (SqlCommand cmd1 = new SqlCommand("select * from Tour_Master where id = @id ", conn))
        {
            cmd1.Parameters.AddWithValue("@id", id);

            using (SqlDataAdapter adp1 = new SqlDataAdapter(cmd1))
            {
                DataTable dt1 = new DataTable();
                adp1.Fill(dt1);
                if (dt1.Rows.Count > 0)
                {
                    string path = dt1.Rows[0]["Doc"].ToString();
                    string str1 = ("/Admin/file/" + path);
                    Response.ContentType = "application/pdf";
                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + path);
                    Response.TransmitFile(Server.MapPath("~/Admin/file/" + path));
                    Response.End();  
                }
            }

        }
    }
}