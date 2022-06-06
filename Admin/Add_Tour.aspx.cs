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

public partial class Buyer_Add_Property : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static string msg = "";
    protected static string id,id1;
    public string _name = String.Empty;
    public string _area = String.Empty;
    public string _price = String.Empty;
    public string _addr = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["s_id"] == null)
            {
                Response.Redirect("/Seller_Log.aspx");
            }

           
            conn = new SqlConnection(cs);
            if (Request.QueryString["msg"] == "edit")
            {

                msg = Request.QueryString["msg"].ToString();
                id = Request.QueryString["id"].ToString();
                if (msg == "edit")
                {
                    using (SqlCommand cmd = new SqlCommand("select * from tour_master where id=@id", conn))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            adp.Fill(dt);
                            if (dt.Rows.Count > 0)
                            {
                                _name = dt.Rows[0]["tour_name"].ToString();
                                _area = dt.Rows[0]["location"].ToString();
                                
                                _price = dt.Rows[0]["price"].ToString();

                                _addr = dt.Rows[0]["discription"].ToString();
                                string str = dt.Rows[0]["image"].ToString();
                                showimge.ImageUrl = ("img/" + str);
                            }
                        }
                    }

                    FileUpload1.Enabled = false;

                }
            }

            else if (Request.QueryString["msg"] == "view")
            {

                msg = Request.QueryString["msg"].ToString();
                id = Request.QueryString["id"].ToString();
                if (msg == "view")
                {
                    using (SqlCommand cmd = new SqlCommand("select * from tour_master where id=@id", conn))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            adp.Fill(dt);
                            if (dt.Rows.Count > 0)
                            {
                                _name = dt.Rows[0]["tour_name"].ToString();
                                _area = dt.Rows[0]["location"].ToString();
                                _price = dt.Rows[0]["price"].ToString();
                                
                                _addr = dt.Rows[0]["discription"].ToString();
                                string str = dt.Rows[0]["image"].ToString();
                                showimge.ImageUrl = ("img/" + str);             
                            }
                        }
                    }

                    
                }
            }


        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);
        conn = new SqlConnection(cs);
        string msg1 = Request.QueryString["msg"] != null ? Request.QueryString["msg"].ToString() : "";
        if (msg1 == "edit")
        {
            string str = fileuplogo.FileName;
            fileuplogo.PostedFile.SaveAs(Server.MapPath("img/" + str));
            string image = "img/" + str.ToString();
            id1 = Request.QueryString["id"].ToString();
            
            using (SqlCommand cmd = new SqlCommand("update tour_master set tour_name=@name , location=@loc , price=@price , discription=@disc , image=@image where id=@id ", conn))
                
            {
                cmd.Parameters.AddWithValue("@id", id1);
                cmd.Parameters.AddWithValue("@name", Request.Form["name"]);
                cmd.Parameters.AddWithValue("@loc", Request.Form["location"]);
                
                cmd.Parameters.AddWithValue("@price", Request.Form["price"]);
                
                cmd.Parameters.AddWithValue("@disc", Request.Form["discription"]);
                cmd.Parameters.AddWithValue("@image", str);
                

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("Manage_Tours.aspx");
            }

        }


        


        else
        {
            

            string str = fileuplogo.FileName;
            fileuplogo.PostedFile.SaveAs(Server.MapPath("img/" + str));
            string image = "img/" + str.ToString();
            string str1 = FileUpload1.FileName;
            FileUpload1.PostedFile.SaveAs(Server.MapPath("file/" + str1));
            string image1 = "file/" + str1.ToString();
            using (SqlCommand cmd = new SqlCommand("insert into tour_master (tour_name,location,price,discription,image,doc) values(@name,@loc,@price,@discription,@image,@file) ", conn))
            {
                
                cmd.Parameters.AddWithValue("@name", Request.Form["name"]);
                cmd.Parameters.AddWithValue("@loc", Request.Form["location"]);
                cmd.Parameters.AddWithValue("@price", Request.Form["price"]);
                cmd.Parameters.AddWithValue("@discription", Request.Form["discription"]);
                cmd.Parameters.AddWithValue("@image", str);
                cmd.Parameters.AddWithValue("@file", str1);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                

            }


            Response.Write("<script>alert('Tour Added Successfully')</script>");
        }



    }
}