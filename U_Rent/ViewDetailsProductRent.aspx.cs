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
    public partial class ViewDetailsProductRent : System.Web.UI.Page
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
            Label warning = (Label)e.Item.FindControl("Label_warning");
            TextBox from = (TextBox)e.Item.FindControl("date_from");
            TextBox to = (TextBox)e.Item.FindControl("date_to");

            if (e.CommandName == "AddToCart")
            {
                if(from.Text=="" || to.Text=="")
                {
                    warning.Text = "Please fill in the renting period.";
                }
                else
                {
                    DateTime fromd = Convert.ToDateTime(from.Text);
                    DateTime tod = Convert.ToDateTime(to.Text);

                    if (DateTime.Now.Subtract(fromd).TotalDays > 1 || DateTime.Now.Subtract(tod).TotalDays > 1)
                    {
                        warning.Text = "Renting day must be future date!";
                    }
                    else if (tod.Subtract(fromd).TotalDays > 0)
                    {
                        string userId = Session["user_id"].ToString();
                        string productbuyId = Request.QueryString["id"];
                        string quantity = tb.Text;
                        string datefrom = from.Text;
                        string dateto = to.Text;


                        SqlConnection con = new SqlConnection("Data Source =LAPTOP-S54MGNFF; Initial Catalog = QuadaceGamestore;   Integrated Security = True; Pooling = False");

                        SqlCommand cmd = new SqlCommand("INSERT INTO CartRent VALUES ('" + userId + "','" + productbuyId + "','" + quantity + "','" + datefrom + "','" + dateto + "')", con);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                        success.Text = "Product added to cart successfully!";
                        warning.Text = "";
                    }

                    else
                    {
                        warning.Text = "Renting period should be more than 1 day!";
                    }

                }
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