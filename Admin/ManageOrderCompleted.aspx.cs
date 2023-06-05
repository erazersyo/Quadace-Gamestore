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
    public partial class ManageOrderCompleted : System.Web.UI.Page
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
            DataSet ds = orderbuy.GetOrderBuyCompletedList();
            dgOrderBuy.DataSource = ds;
            dgOrderBuy.DataBind();
        }

        protected void dgOrderBuy_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            
        }

        protected void dgOrderBuy_ItemCommand(object sender, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {

            if (e.CommandName == "OrderBuyDetails")
            {
                Label _id = (Label)e.Item.Cells[0].FindControl("lbl_OrderBuy_ID");
                Session["order_id"] = e.CommandArgument.ToString();
                Response.Redirect("OrderDetailsProductBuyCompleted.aspx?id=" + _id.Text);
            }
        }

        protected void ToShip(object sender, EventArgs e)
        {
            Response.Redirect("ManageOrder.aspx");
        }

        protected void Shipping(object sender, EventArgs e)
        {
            Response.Redirect("ManageOrderShipping.aspx");
        }

        protected void Cancelled(object sender, EventArgs e)
        {
            Response.Redirect("ManageOrderCancelled.aspx");
        }
    }
}