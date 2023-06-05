using QuadaceGamestore.Class;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace QuadaceGamestore.User
{
    public partial class CartRent : System.Web.UI.Page
    {
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupCartRent();
                //Totalquantity();
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

        public void SetupCartRent()
        {
            String userid = Session["user_id"].ToString();

            dgCartBuy.ShowFooter = true;

            CartRentClass cartbuy = new CartRentClass();
            DataSet ds = cartbuy.GetCartRentList(userid);
            dgCartBuy.DataSource = ds;
            dgCartBuy.DataBind();
        }


        protected void dgCartBuy_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.FindControl("btnDeleteCartBuy") != null)
            {
                ((Button)e.Item.FindControl("btnDeleteCartBuy")).Attributes.Add("onClick", "return confirm('Are you sure wish to delete the data?');");
            }
        
            if (e.Item.FindControl("lbl_totalqty") != null && e.Item.FindControl("lbl_totaldeposit") != null)
            {
                Decimal totalquantity = 0;
                for (int i = 0; i < dgCartBuy.Items.Count; i++)
                {
                    Label lb = this.dgCartBuy.Items[i].FindControl("lbl_quantity") as Label;
                    if(lb!=null)
                    {
                        Decimal VALUE = Convert.ToDecimal(lb.Text);
                        totalquantity = totalquantity + VALUE;
                    }
                }
                    
                Decimal totaldeposit = totalquantity * 50;

                ((Label)e.Item.FindControl("lbl_totalqty")).Text = totalquantity.ToString();
                ((Label)e.Item.FindControl("lbl_totaldeposit")).Text = totaldeposit.ToString("0.00");

            }
        }

        protected void dgEdit_CartBuy(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgCartBuy.EditItemIndex = e.Item.ItemIndex;
            SetupCartRent();
        }

        protected void dgCancel_CartBuy(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgCartBuy.EditItemIndex = -1;
            SetupCartRent();
        }

        protected void dgCartBuy_ItemCommand(object sender, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            CartRentClass cartbuy = new CartRentClass();


            if (e.CommandName == "DeleteCartBuy")
            {
                // to do check subject or can rely MSSQL to do the checking
                Label _id = (Label)e.Item.Cells[0].FindControl("lbl_CartBuy_ID");
                int result = cartbuy.DeleteCartRent(_id.Text);
                if (result > 0)
                {
                    //lblAttention.Text = ErrorClass.ErrorMessage(result, "student");
                }
                else
                {
                    Server.Transfer("CartRent.aspx");
                }
            }
        }

        protected void dgUpdate_CartBuy(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            CartRentClass cartbuy = new CartRentClass();

            TextBox quantity = (TextBox)e.Item.Cells[0].FindControl("txtbox_qty");
            TextBox from = (TextBox)e.Item.Cells[0].FindControl("txtbox_from");
            TextBox to = (TextBox)e.Item.Cells[0].FindControl("txtbox_to");
            Label _id = (Label)e.Item.Cells[0].FindControl("lbl_CartBuy_ID");
            int result = cartbuy.UpdateCartRent(quantity.Text, from.Text, to.Text, _id.Text);
            if (result > 0)
            {
                //lblAttention.Text = ErrorClass.ErrorMessage(result, "student");
            }
            else
            {
                Server.Transfer("CartRent.aspx");
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

            Decimal totalquantity = 0;
            for (int i = 0; i < dgCartBuy.Items.Count; i++)
            {
                Label lb = this.dgCartBuy.Items[i].FindControl("lbl_quantity") as Label;
                Decimal VALUE = Convert.ToDecimal(lb.Text);
                totalquantity = totalquantity + VALUE;
            }

            Decimal totaldeposit = totalquantity * 50;

            lbl_total_Prices.Text = (totalprice+totaldeposit).ToString();
        }

        protected void Checkout_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckoutRent.aspx");
        }

        protected void BuyClick(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            String search = searchbar.Text;
            Session["search"] = search;
            Server.Transfer("../SearchPage.aspx");
        }
    }
        
}