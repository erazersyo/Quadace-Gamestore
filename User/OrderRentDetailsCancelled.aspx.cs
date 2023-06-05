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
using System.Text;
using System.Security.Cryptography;
using System.Net.Mail;

namespace QuadaceGamestore.User
{
    public partial class OrderRentDetailsCancelled : System.Web.UI.Page
    {
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupOrderBuyDetails();
                Totalprice();
            }

        }

        protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
        {

        }

        public void SetupOrderBuyDetails()
        {
            string orderId = Session["order_id"].ToString();

            dgOrderBuyDetails.ShowFooter = true;

            OrderRentClass orderdetailsbuy = new OrderRentClass();
            DataSet ds = orderdetailsbuy.GetOrderRentDetailsList(orderId);
            dgOrderBuyDetails.DataSource = ds;
            dgOrderBuyDetails.DataBind();
        }

        private void Totalprice()
        {
            Decimal totalprice = 0;
            for (int i = 0; i < dgOrderBuyDetails.Items.Count; i++)
            {
                Label total = this.dgOrderBuyDetails.Items[i].FindControl("lbl_Total") as Label;
                Decimal VALUE = Convert.ToDecimal(total.Text);
                totalprice = totalprice + VALUE;
            }
            lbl_total_Prices.Text = totalprice.ToString();
        }
        protected void Search_Click(object sender, EventArgs e)
        {
            String search = searchbar.Text;
            Session["search"] = search;
            Server.Transfer("../SearchPage.aspx");
        }

    }
}