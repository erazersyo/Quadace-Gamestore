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
    public partial class OrderRentRenting : System.Web.UI.Page
    {
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupOrderBuy();
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
        public void SetupOrderBuy()
        {
            String userid = Session["user_id"].ToString();
            dgOrderBuy.ShowFooter = true;

            OrderRentClass orderbuy = new OrderRentClass();
            DataSet ds = orderbuy.GetOrderRentRentingUserList(userid);
            dgOrderBuy.DataSource = ds;
            dgOrderBuy.DataBind();
        }

        protected void dgOrderBuy_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.FindControl("btnCancelOrderBuy") != null)
            {
                ((Button)e.Item.FindControl("btnCancelOrderBuy")).Attributes.Add("onClick", "return confirm('Are you sure you want to cancel the order?');");
            }
        }

        protected void dgOrderBuy_ItemCommand(object sender, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            OrderRentClass orderbuy = new OrderRentClass();

            if (e.CommandName == "CancelOrderBuy")
            {
                Label _id = (Label)e.Item.Cells[0].FindControl("lbl_OrderBuy_ID");
                int result = orderbuy.CancelOrderRent(_id.Text);
                if (result > 0)
                {
                    //lblAttention.Text = ErrorClass.ErrorMessage(result, "student");
                }
                else
                {
                    Server.Transfer("OrderRentRenting.aspx");
                }
            }

            if (e.CommandName == "OrderBuyDetails")
            {
                Session["order_id"] = e.CommandArgument.ToString();
                Response.Redirect("OrderRentDetails.aspx?id=" + e.CommandArgument.ToString());
            }
        }

        protected void ToShip(object sender, EventArgs e)
        {
            Response.Redirect("OrderRentToShip.aspx");
        }
        protected void Shipping(object sender, EventArgs e)
        {
            Response.Redirect("OrderRentShipping.aspx");
        }
        protected void Renting(object sender, EventArgs e)
        {
            Response.Redirect("OrderRentRenting.aspx");
        }
        protected void Returned(object sender, EventArgs e)
        {
            Response.Redirect("OrderRentReturned.aspx");
        }
        protected void Cancelled(object sender, EventArgs e)
        {
            Response.Redirect("OrderRentCancelled.aspx");
        }
        protected void Search_Click(object sender, EventArgs e)
        {
            String search = searchbar.Text;
            Session["search"] = search;
            Server.Transfer("../SearchPage.aspx");
        }
    }
}