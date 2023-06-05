using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QuadaceGamestore;
using QuadaceGamestore.Class;

namespace QuadaceGamestore
{
    public partial class SearchPage : System.Web.UI.Page
    {
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataList();
                BindDataList2();
            }

            SqlConnection con = new SqlConnection("Data Source =LAPTOP-S54MGNFF; Initial Catalog = QuadaceGamestore;   Integrated Security = True; Pooling = False");
            con.Open();

            String username = "SELECT [user_name] FROM[QuadaceGamestore].[dbo].[Users] where[user_email] ='" + Session["user_email"] + "'";
  

            com = new SqlCommand(username, con);

            SqlDataReader reader = com.ExecuteReader();

            reader.Read();

            if (Session["user_email"] != null)
            {
                lbl_AccountName.Text = "  " + reader["user_name"].ToString();
            }

            else
            {
                lbl_AccountName.Text = " Account";
            }
        }
        protected void BindDataList()
        {
            SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            con.Open();
            SqlCommand cmdImageupload = new SqlCommand("Select * FROM ProductBuy WHERE productbuy_name LIKE '%" + Session["search"] + "%' OR productbuy_category LIKE '%" + Session["search"] + "%'", con);
            SqlDataAdapter daImageupload = new SqlDataAdapter(cmdImageupload);
            SqlDataAdapter da = new SqlDataAdapter(cmdImageupload);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                Response.Redirect("U_Buy/ViewDetailsProductBuy.aspx?id=" + e.CommandArgument.ToString());
            }
        }

        protected void DataList2_ItemCommand1(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                Response.Redirect("U_Rent/ViewDetailsProductRent.aspx?id=" + e.CommandArgument.ToString());
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            String search = searchbar.Text;
            Session["search"] = search;
            Response.Redirect("SearchPage.aspx");
        }

        protected void BindDataList2()
        {
            SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            con.Open();
            SqlCommand cmdImageupload = new SqlCommand("Select * FROM ProductRent WHERE productrent_name LIKE '%" + Session["search"] + "%' OR productrent_category LIKE '%" + Session["search"] + "%'", con);
            SqlDataAdapter daImageupload = new SqlDataAdapter(cmdImageupload);
            SqlDataAdapter da = new SqlDataAdapter(cmdImageupload);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataList2.DataSource = dt;
            DataList2.DataBind();
        }
    }
}