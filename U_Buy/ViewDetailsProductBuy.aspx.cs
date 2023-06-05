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

namespace QuadaceGamestore.U_Buy
{
    public partial class ViewDetailsProductBuy : System.Web.UI.Page
    {
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
        {
            TextBox tb = (TextBox)e.Item.FindControl("txtbox_qty");
            int qty = int.Parse(tb.Text);
            Label success = (Label)e.Item.FindControl("Label_success");

            if (e.CommandName == "AddToCart")
            {
                string userId = Session["user_id"].ToString();
                string productbuyId = Request.QueryString["id"];
                string quantity = tb.Text;

                SqlConnection con = new SqlConnection("Data Source =LAPTOP-S54MGNFF; Initial Catalog = QuadaceGamestore;   Integrated Security = True; Pooling = False");
                
                SqlCommand cmd = new SqlCommand("INSERT INTO CartBuy VALUES ('" + userId + "','" + productbuyId + "','" + quantity + "')", con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                success.Text = "Product added to cart successfully!";
            }

            if (e.CommandName == "PlusButton")
            {          
                qty++;
                tb.Text = Convert.ToString(qty);
            }

            if (e.CommandName == "MinusButton")
            {
                if (qty >= 2)
                {
                    qty--;
                    tb.Text = Convert.ToString(qty);
                }
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