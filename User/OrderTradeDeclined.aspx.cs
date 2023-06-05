using QuadaceGamestore.Class;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace QuadaceGamestore.User
{
    public partial class OrderTradeDeclined : System.Web.UI.Page
    {
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataList();
            }

            SqlConnection con = new SqlConnection("Data Source =LAPTOP-S54MGNFF; Initial Catalog = QuadaceGamestore;   Integrated Security = True; Pooling = False");
            con.Open();

            String username = "SELECT [user_name], [user_phone] FROM[QuadaceGamestore].[dbo].[Users] where[user_email] ='" + Session["user_email"] + "'";

            com = new SqlCommand(username, con);

            SqlDataReader reader = com.ExecuteReader();

            reader.Read();

            if (Session["user_email"] != null)
            {
                lbl_AccountName.Text = "  " + reader["user_name"].ToString();
                lbl_AccountName2.Text = reader["user_name"].ToString();
            }

            else
            {
                lbl_AccountName.Text = " Account";
            }


            reader.Close();
            con.Close();
        }
        protected void BindDataList()
        {
            SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            con.Open();
            SqlCommand cmdImageupload = new SqlCommand("Select * FROM Trade WHERE trade_status='declined' AND user_id='" + Session["user_id"] + "'", con);
            SqlDataAdapter daImageupload = new SqlDataAdapter(cmdImageupload);
            SqlDataAdapter da = new SqlDataAdapter(cmdImageupload);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataList2.DataSource = dt;
            DataList2.DataBind();
        }

        protected void Pending(object sender, EventArgs e)
        {
            Response.Redirect("OrderTradeRequest.aspx");
        }
        protected void Accepted(object sender, EventArgs e)
        {
            Response.Redirect("OrderTradeAccepted.aspx");
        }
        protected void Declined(object sender, EventArgs e)
        {
            Response.Redirect("OrderTradeDeclined.aspx");
        }
        protected void Search_Click(object sender, EventArgs e)
        {
            String search = searchbar.Text;
            Session["search"] = search;
            Server.Transfer("../SearchPage.aspx");
        }
    }
}