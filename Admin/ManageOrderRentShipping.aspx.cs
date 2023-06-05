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

namespace QuadaceGamestore.Admin
{
    public partial class ManageOrderRentShipping : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupOrderBuy();
            }
        }
        protected void SearchOrder_Click(object sender, EventArgs e)
        {
            dgOrderBuy.ShowFooter = true;

            String search = search_order.Text;

            if (String.IsNullOrEmpty(search))
            {
                SetupOrderBuy();
            }

            else
            {
                OrderRentClass orderbuy = new OrderRentClass();
                DataSet ds = orderbuy.GetSearchList(search);
                dgOrderBuy.DataSource = ds;
                dgOrderBuy.DataBind();
            }
        }

        public void SetupOrderBuy()
        {
            dgOrderBuy.ShowFooter = true;

            OrderRentClass orderbuy = new OrderRentClass();
            DataSet ds = orderbuy.GetOrderRentShippingList();
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
                    Server.Transfer("ManageOrderRent.aspx");
                }
            }

            if (e.CommandName == "OrderBuyDetails")
            {
                Session["order_id"] = e.CommandArgument.ToString();
                Response.Redirect("OrderDetailsProductRentTracking.aspx?id=" + e.CommandArgument.ToString());
            }
        }
        protected void ToShip(object sender, EventArgs e)
        {
            Response.Redirect("ManageOrderRent.aspx");
        }
        protected void Shipping(object sender, EventArgs e)
        {
            Response.Redirect("ManageOrderRentShipping.aspx");
        }
        protected void Renting(object sender, EventArgs e)
        {
            Response.Redirect("ManageOrderRentRenting.aspx");
        }
        protected void Returned(object sender, EventArgs e)
        {
            Response.Redirect("ManageOrderRentReturned.aspx");
        }
        protected void Cancelled(object sender, EventArgs e)
        {
            Response.Redirect("ManageOrderRentCancelled.aspx");
        }
    }
}