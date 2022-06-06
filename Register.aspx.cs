using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Buyer_Log : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static string msg = "";
    protected static string id;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);
        using (SqlCommand cmd = new SqlCommand("select * from user_master where email=@email ", conn))
        {
            cmd.Parameters.AddWithValue("@email", Request.Form["email"]);
            using(SqlDataAdapter adp1= new SqlDataAdapter(cmd))
            {
                DataTable dt1 = new DataTable();
                adp1.Fill(dt1);
                if(dt1.Rows.Count>0)
                {
                    Response.Write("<script>alert('Email already present..')</script>");
                }
                else
                {
                    using(SqlCommand cmd1 = new SqlCommand("insert into user_master (name,phone,email,password) values(@name,@phone,@email,@pass)",conn))
                    {
                        cmd1.Parameters.AddWithValue("@pass", Request.Form["password"]);
                        cmd1.Parameters.AddWithValue("@name", Request.Form["name"]);
                        cmd1.Parameters.AddWithValue("@email", Request.Form["email"]);
                        cmd1.Parameters.AddWithValue("@phone", Request.Form["phone"]);
                        conn.Open();
                        cmd1.ExecuteNonQuery();
                        conn.Close();
                        Response.Redirect("User.aspx");
                    }
                }
            }
            }
            
        
    }
}