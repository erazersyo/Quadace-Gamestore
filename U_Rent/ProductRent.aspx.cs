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

namespace QuadaceGamestore.U_Rent
{
    public partial class ProductRent : System.Web.UI.Page
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
        protected void NS_Click(object sender, EventArgs e)
        {
            Response.Redirect("NintendoSwitchRent.aspx");
        }
        protected void PS_Click(object sender, EventArgs e)
        {
            Response.Redirect("PlayStationRent.aspx");
        }
        protected void Xbox_Click(object sender, EventArgs e)
        {
            Response.Redirect("XBoxRent.aspx");
        }
        protected void PC_Click(object sender, EventArgs e)
        {
            Response.Redirect("PCGamingRent.aspx");
        }
        protected void Ot_Click(object sender, EventArgs e)
        {
            Response.Redirect("OthersRent.aspx");
        }

        protected void BindDataList()
        {
            SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            con.Open();
            SqlCommand cmdImageupload = new SqlCommand("Select * FROM ProductRent", con);
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
                Response.Redirect("ViewDetailsProductRent.aspx?id=" + e.CommandArgument.ToString());
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            String search = searchbar.Text;
            Session["search"] = search;
            Server.Transfer("../SearchPage.aspx");
        }
    }
}