using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using VaderSharp;
public partial class Buyer_Property_Single : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static bool flag;
    protected static bool flagr;
    protected static DataTable dt;
    protected static string id, id1;
    public string _name = String.Empty;
    public string _price = String.Empty;
    public string _addr = String.Empty;
    public string _image = String.Empty;
    public string _id = String.Empty;
    public string _rate = String.Empty;
    public string _status = String.Empty;
    public static string _ratings = String.Empty;
    public string _area = String.Empty;
    protected static DataTable dt_r;
    protected static DataTable dt2;


    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["u_id"] == null)
        {
            Response.Redirect("/User.aspx");
        }
        conn = new SqlConnection(cs);
        dt = new DataTable();
        id = Request.QueryString["id"].ToString();
        using (SqlCommand cmd = new SqlCommand("select * from  tour_master  where id=@id", conn))
        {
            cmd.Parameters.AddWithValue("@id", id);
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                sda.Fill(dt);
                _name = dt.Rows[0]["tour_name"].ToString();
                _price = dt.Rows[0]["price"].ToString();
                _area = dt.Rows[0]["location"].ToString();
                _image ="/Admin/img/"+ dt.Rows[0]["image"].ToString();
                _addr = dt.Rows[0]["discription"].ToString();                
                _id = id;
             //   HyperLink1.NavigateUrl = "Download.aspx?id="+_id;
            }
            
        }


        using (SqlCommand cmd1 = new SqlCommand("select * from tour_register_master where uid = @uid and tid = @tid", conn))
        {
            cmd1.Parameters.AddWithValue("@uid", Session["u_id"].ToString());
            cmd1.Parameters.AddWithValue("@tid", _id);
            using (SqlDataAdapter adp1 = new SqlDataAdapter(cmd1))
            {
                DataTable dt1 = new DataTable();
                adp1.Fill(dt1);
                if (dt1.Rows.Count > 0)
                {
                    Button2.Enabled = false;
                }
            }

        }

        using (SqlCommand cmd1 = new SqlCommand("select * from review_master where tour_id=@mid and user_id=@uid", conn))
        {
            cmd1.Parameters.AddWithValue("@mid", id);
            cmd1.Parameters.AddWithValue("@uid", Session["u_id"].ToString());
            using (SqlDataAdapter adp1 = new SqlDataAdapter(cmd1))
            {
                DataTable dt1 = new DataTable();
                adp1.Fill(dt1);
                if (dt1.Rows.Count > 0)
                {
                    Button2.Enabled = false;
                }
            }


        }


        using (SqlCommand cmd_r = new SqlCommand("select a.user_id,a.review,a.Ratings,user_master.name from user_master  inner join(select * from review_master where tour_id=@mid) as a on user_master.id=a.user_id", conn))
        {
            cmd_r.Parameters.AddWithValue("@mid", id);
            dt_r = new DataTable();
            using (SqlDataAdapter da_r = new SqlDataAdapter(cmd_r))
            {
                da_r.Fill(dt_r);
                if (dt_r.Rows.Count > 0)
                {
                    flagr = true;
                }

            }

        }

        using (SqlCommand cmd5 = new SqlCommand("select avg(Ratings) as rate from Review_Master where tour_id=@id", conn))
        {
            cmd5.Parameters.AddWithValue("@id", id);
            using (SqlDataAdapter sda5 = new SqlDataAdapter(cmd5))
            {
                DataTable dt5 = new DataTable();
                sda5.Fill(dt5);
                _rate = dt5.Rows[0]["rate"].ToString();
                HyperLink1.NavigateUrl = "Download.aspx?id="+_id;
            }

        }

        using (SqlCommand cmd2 = new SqlCommand("select top 3 tour_master.id,tour_master.tour_name,tour_master.location,tour_master.price,tour_master.Image,a.rate from tour_master inner join(select avg(Ratings) as rate, tour_id from Review_Master group by tour_id)as a on a.tour_id=tour_master.Id where  a.rate >=@rate and tour_master.id!=@id", conn))
        {
            cmd2.Parameters.AddWithValue("@id", id);
            cmd2.Parameters.AddWithValue("@genres", _price);
            cmd2.Parameters.AddWithValue("@rate", _rate);
            dt2 = new DataTable();
            using (SqlDataAdapter sda2 = new SqlDataAdapter(cmd2))
            {
                sda2.Fill(dt2);
            }
            if (dt2.Rows.Count > 0)
            {
                flag = true;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);

        using (SqlCommand cmd1 = new SqlCommand("select * from tour_register_master where uid = @uid and tid = @tid", conn))
        {
            cmd1.Parameters.AddWithValue("@uid", Session["u_id"].ToString());
            cmd1.Parameters.AddWithValue("@tid", _id);
            using (SqlDataAdapter adp1 = new SqlDataAdapter(cmd1))
            {
                DataTable dt1 = new DataTable();
                adp1.Fill(dt1);
                if (dt1.Rows.Count > 0)
                {
                    Button2.Enabled = false;
                    Response.Write("<script>alert('Already Registered')</script>");
                }
                else
                {
                    using (SqlCommand cmd = new SqlCommand("insert into tour_register_master (uid,tid,date) values(@uid,@tid,getdate())", conn))
                    {
                        cmd.Parameters.AddWithValue("@uid", Session["u_id"].ToString());
                        cmd.Parameters.AddWithValue("@tid", _id);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();

                    }
                    Button2.Enabled = false;
                    Response.Write("<script>alert('Registered Successfully')</script>");
                }
            }

        }

        
    }

    protected void Rating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        //lbl_point.Text = "You rated " + e.Value.ToString();
        _ratings = e.Value.ToString();
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        
        SentimentIntensityAnalyzer analyzer = new SentimentIntensityAnalyzer();
        conn = new SqlConnection(cs);
        var results = analyzer.PolarityScores(Request.Form["comments"]);
        string[] x1 = new string[3] { "positive", "Negative", "Neutral" };
        double[] y1 = new double[3] { results.Positive, results.Negative, results.Neutral };
        string result1 = "";
        if (results.Positive > 0 && Convert.ToInt16(_ratings) >= 4)
        {
            result1 = "Possitive";
            using (SqlCommand cmd = new SqlCommand("insert into review_master (tour_id,user_id,review,ratings,sentiment) values(@mid,@uid,@review,@rating,@sentiment)", conn))
            {
                cmd.Parameters.AddWithValue("@mid", id);
                cmd.Parameters.AddWithValue("@uid", Session["u_id"].ToString());
                cmd.Parameters.AddWithValue("@review", Request.Form["comments"]);
                cmd.Parameters.AddWithValue("@rating", Convert.ToInt16(_ratings));
                cmd.Parameters.AddWithValue("@sentiment", result1);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            Response.Write("<script>alert('Thank You! For Feedback.')</script>");
        }
        else if (results.Negative > 0 && Convert.ToInt16(_ratings) <= 2)
        {
            result1 = "Negative";
            using (SqlCommand cmd = new SqlCommand("insert into review_master (tour_id,user_id,review,ratings,sentiment) values(@mid,@uid,@review,@rating,@sentiment)", conn))
            {
                cmd.Parameters.AddWithValue("@mid", id);
                cmd.Parameters.AddWithValue("@uid", Session["u_id"].ToString());
                cmd.Parameters.AddWithValue("@review", Request.Form["comments"]);
                cmd.Parameters.AddWithValue("@rating", Convert.ToInt16(_ratings));
                cmd.Parameters.AddWithValue("@sentiment", result1);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            Response.Write("<script>alert('Thank You! For Feedback.')</script>");
        }
        else if (results.Neutral >= 1 && Convert.ToInt16(_ratings) == 3 )
        {
            result1 = "Neutral";
            using (SqlCommand cmd = new SqlCommand("insert into review_master (tour_id,user_id,review,ratings,sentiment) values(@mid,@uid,@review,@rating,@sentiment)", conn))
            {
                cmd.Parameters.AddWithValue("@mid", id);
                cmd.Parameters.AddWithValue("@uid", Session["u_id"].ToString());
                cmd.Parameters.AddWithValue("@review", Request.Form["comments"]);
                cmd.Parameters.AddWithValue("@rating", Convert.ToInt16(_ratings));
                cmd.Parameters.AddWithValue("@sentiment", result1);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            Response.Write("<script>alert('Thank You! For Feedback.')</script>");
        }
        else
        {
            Response.Write("<script>alert('Rating And Comment Does Not Match')</script>");
        }

        
    }

   
}