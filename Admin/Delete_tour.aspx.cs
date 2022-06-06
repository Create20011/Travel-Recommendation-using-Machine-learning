using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class Seller_Delete_property : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static bool flag;
    protected static DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);
        string id= Request.QueryString["id"].ToString();
        using(SqlCommand cmd = new SqlCommand("delete from buyer_request_master where p_id=@id ",conn))
        {
            cmd.Parameters.AddWithValue("@id", id);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        using (SqlCommand cmd1 = new SqlCommand("delete from log_master where Property_Id=@id and type=@type ", conn))
        {
            cmd1.Parameters.AddWithValue("@id", id);
            cmd1.Parameters.AddWithValue("@type", "Requested");
            conn.Open();
            cmd1.ExecuteNonQuery();
            conn.Close();
        }

        using (SqlCommand cmd2 = new SqlCommand("update property_master set status=@status where id=@id", conn))
        {
            cmd2.Parameters.AddWithValue("@status", "Sale");
            cmd2.Parameters.AddWithValue("@id", id);
            conn.Open();
            cmd2.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Buy_Request.aspx");
        }
    }
}