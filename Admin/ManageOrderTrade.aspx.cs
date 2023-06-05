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

namespace QuadaceGamestore.Admin
{
    public partial class ManageOrderTrade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataList();
            }
        }

        protected void BindDataList()
        {
            SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            con.Open();
            SqlCommand cmdImageupload = new SqlCommand("Select * FROM Trade WHERE trade_status='pending'", con);
            SqlDataAdapter daImageupload = new SqlDataAdapter(cmdImageupload);
            SqlDataAdapter da = new SqlDataAdapter(cmdImageupload);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataList2.DataSource = dt;
            DataList2.DataBind();
        }

        protected void Pending(object sender, EventArgs e)
        {
            Response.Redirect("ManageOrderTrade.aspx");
        }
        protected void Accepted(object sender, EventArgs e)
        {
            Response.Redirect("ManageOrderTradeAccepted.aspx");
        }
        protected void Declined(object sender, EventArgs e)
        {
            Response.Redirect("ManageOrderTradeDeclined.aspx");
        }
        protected void AcceptedButton(object sender, EventArgs e)
        {
            Label warning = this.DataList2.Items[0].FindControl("lbl_warning") as Label;
            Label tradeid = this.DataList2.Items[0].FindControl("lbl_tradeid") as Label;
            TextBox price = this.DataList2.Items[0].FindControl("txt_price") as TextBox;

            if(price.Text!="")
            {
                SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
                SqlCommand cmd = new SqlCommand("UPDATE Trade SET trade_status ='accepted', trade_price ='" + price.Text + "' WHERE trade_id='" + tradeid.Text + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                warning.Text = "";
                Response.Redirect("ManageOrderTrade.aspx");
            }

            else
            {
                warning.Text = "Please fill in the price!!";
            }
            
        }
        protected void DeclinedButton(object sender, EventArgs e)
        {
            Label tradeid = this.DataList2.Items[0].FindControl("lbl_tradeid") as Label;

            SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            SqlCommand cmd = new SqlCommand("UPDATE Trade SET trade_status ='declined' WHERE trade_id='" + tradeid.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("ManageOrderTrade.aspx");
        }
    }
}