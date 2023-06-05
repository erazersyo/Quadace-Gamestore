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

namespace QuadaceGamestore.User
{
    public partial class Cart : System.Web.UI.Page
    {
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupCartBuy();
                Totalprice();
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

        public void SetupCartBuy()
        {
            String userid = Session["user_id"].ToString();

            dgCartBuy.ShowFooter = true;

            CartBuyClass cartbuy = new CartBuyClass();
            DataSet ds = cartbuy.GetCartBuyList(userid);
            dgCartBuy.DataSource = ds;
            dgCartBuy.DataBind();
        }


        protected void dgCartBuy_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.FindControl("btnDeleteCartBuy") != null)
            {
                ((Button)e.Item.FindControl("btnDeleteCartBuy")).Attributes.Add("onClick", "return confirm('Are you sure wish to delete the data?');");
            }
        }

        protected void dgCartBuy_ItemCommand(object sender, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            CartBuyClass cartbuy = new CartBuyClass();

            if (e.CommandName == "UpdateCartBuy")
            {
                TextBox quantity = (TextBox)e.Item.Cells[0].FindControl("txtbox_qty");
                Label _id = (Label)e.Item.Cells[0].FindControl("lbl_CartBuy_ID");
                int result = cartbuy.UpdateCartBuy(quantity.Text,_id.Text);
                if (result > 0)
                {
                    //lblAttention.Text = ErrorClass.ErrorMessage(result, "student");
                }
                else
                {
                    Server.Transfer("Cart.aspx");
                }
            }

            if (e.CommandName == "DeleteCartBuy")
            {
                // to do check subject or can rely MSSQL to do the checking
                Label _id = (Label)e.Item.Cells[0].FindControl("lbl_CartBuy_ID");
                int result = cartbuy.DeleteCartBuy(_id.Text);
                if (result > 0)
                {
                    //lblAttention.Text = ErrorClass.ErrorMessage(result, "student");
                }
                else
                {
                    Server.Transfer("Cart.aspx");
                }
            }
        }

        private void Totalprice()
        {
            Decimal totalprice = 0;
            for (int i = 0; i < dgCartBuy.Items.Count; i++)
            {
                Label lb = this.dgCartBuy.Items[i].FindControl("lbl_total_Price") as Label;
                Decimal VALUE = Convert.ToDecimal(lb.Text);
                totalprice = totalprice + VALUE;
            }
            lbl_total_Prices.Text = totalprice.ToString();
        }

        protected void Checkout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }

        protected void RentClick(object sender, EventArgs e)
        {
            Response.Redirect("CartRent.aspx");
        }
        protected void Search_Click(object sender, EventArgs e)
        {
            String search = searchbar.Text;
            Session["search"] = search;
            Server.Transfer("../SearchPage.aspx");
        }
    }
}