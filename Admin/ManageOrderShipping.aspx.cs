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
    public partial class ManageOrderShipping : System.Web.UI.Page
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
                OrderBuyClass orderbuy = new OrderBuyClass();
                DataSet ds = orderbuy.GetSearchList(search);
                dgOrderBuy.DataSource = ds;
                dgOrderBuy.DataBind();
            }
        }

        public void SetupOrderBuy()
        {
            dgOrderBuy.ShowFooter = true;

            OrderBuyClass orderbuy = new OrderBuyClass();
            DataSet ds = orderbuy.GetOrderBuyShippingList();
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
            OrderBuyClass orderbuy = new OrderBuyClass();

            if (e.CommandName == "CancelOrderBuy")
            {
                Label _id = (Label)e.Item.Cells[0].FindControl("lbl_OrderBuy_ID");
                int result = orderbuy.CancelOrderBuy(_id.Text);
                if (result > 0)
                {
                    //lblAttention.Text = ErrorClass.ErrorMessage(result, "student");
                }
                else
                {
                    Server.Transfer("ManageOrderShipping.aspx");
                }
            }

            if (e.CommandName == "OrderBuyDetails")
            {
                Label _id = (Label)e.Item.Cells[0].FindControl("lbl_OrderBuy_ID");
                Session["order_id"] = e.CommandArgument.ToString();
                Response.Redirect("OrderDetailsProductBuyTracking.aspx?id=" + _id.Text);
            }
        }

        protected void ToShip(object sender, EventArgs e)
        {
            Response.Redirect("ManageOrder.aspx");
        }
        protected void Completed(object sender, EventArgs e)
        {
            Response.Redirect("ManageOrderCompleted.aspx");
        }
        protected void Cancelled(object sender, EventArgs e)
        {
            Response.Redirect("ManageOrderCancelled.aspx");
        }
    }
}