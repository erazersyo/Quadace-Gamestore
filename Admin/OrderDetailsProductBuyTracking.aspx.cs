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

namespace QuadaceGamestore.Admin
{
    public partial class OrderDetailsProductBuyTracking : System.Web.UI.Page
    {
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupOrderBuyDetails();
                Totalprice();
                TrackingNumber();
                SetupTracking();
            }

        }

        protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
        {

        }

        public void SetupOrderBuyDetails()
        {
            string orderId = Session["order_id"].ToString();

            dgOrderBuyDetails.ShowFooter = true;

            OrderBuyClass orderdetailsbuy = new OrderBuyClass();
            DataSet ds = orderdetailsbuy.GetOrderBuyDetailsList(orderId);
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

        private void TrackingNumber()
        {
            Label orderid = this.DataList1.Items[0].FindControl("lbl_orderbuyid") as Label;

            SqlConnection con = new SqlConnection("Data Source =LAPTOP-S54MGNFF; Initial Catalog = QuadaceGamestore;   Integrated Security = True; Pooling = False");
            con.Open();

            String trackingnumber = "SELECT orderbuy_tracking FROM OrderBuy WHERE orderbuy_id = '" + orderid.Text + "'";

            com = new SqlCommand(trackingnumber, con);

            SqlDataReader reader = com.ExecuteReader();
            reader.Read();

            lbl_tracking.Text = "  " + reader["orderbuy_tracking"].ToString();

            reader.Close();
            con.Close();
        }

        public void SetupTracking()
        {
            Label orderid = this.DataList1.Items[0].FindControl("lbl_orderbuyid") as Label;

            SqlConnection con = new SqlConnection("Data Source =LAPTOP-S54MGNFF; Initial Catalog = QuadaceGamestore;   Integrated Security = True; Pooling = False");
            con.Open();

            String trackingnumber = "SELECT orderbuy_tracking FROM OrderBuy WHERE orderbuy_id = '" + orderid.Text + "'";

            com = new SqlCommand(trackingnumber, con);

            SqlDataReader reader = com.ExecuteReader();
            reader.Read();

            String tracking = reader["orderbuy_tracking"].ToString();
            reader.Close();
            con.Close();

            dgTracking.ShowFooter = true;

            OrderBuyClass orderbuy = new OrderBuyClass();
            DataSet ds = orderbuy.GetTrackingList(tracking);
            dgTracking.DataSource = ds;
            dgTracking.DataBind();
        }
    }
}