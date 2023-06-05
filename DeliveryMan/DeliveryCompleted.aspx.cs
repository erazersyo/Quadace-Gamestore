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

namespace QuadaceGamestore.DeliveryMan
{
    public partial class DeliveryCompleted : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupOrderBuy();
            }
        }

        public void SetupOrderBuy()
        {
            dgOrderBuy.ShowFooter = true;

            OrderBuyClass orderbuy = new OrderBuyClass();
            DataSet ds = orderbuy.GetOrderBuyCompletedList();
            dgOrderBuy.DataSource = ds;
            dgOrderBuy.DataBind();

            OrderRentClass orderrent = new OrderRentClass();
            DataSet dss = orderrent.GetOrderRentRentingList();
            dgOrderRent.DataSource = dss;
            dgOrderRent.DataBind();
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
                Response.Redirect("DeliveryCompletedDetails.aspx?id=" + _id.Text);
            }
        }

        protected void dgOrderBuy_ItemCommand2(object sender, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            if (e.CommandName == "OrderBuyDetails2")
            {
                Label _id = (Label)e.Item.Cells[0].FindControl("lbl_OrderBuy_ID2");
                Session["order_id"] = e.CommandArgument.ToString();
                Response.Redirect("DeliveryCompletedRentDetails.aspx?id=" + _id.Text);
            }
        }

        protected void Ship_Click(object sender, EventArgs e)
        {
            Server.Transfer("DeliveryShip.aspx");
        }
    }
}