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
    public partial class OrderRentDetails : System.Web.UI.Page
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

        private void TrackingNumber()
        {
            Label orderid = this.DataList1.Items[0].FindControl("lbl_orderbuyid") as Label;

            SqlConnection con = new SqlConnection("Data Source =LAPTOP-S54MGNFF; Initial Catalog = QuadaceGamestore;   Integrated Security = True; Pooling = False");
            con.Open();

            String trackingnumber = "SELECT orderrent_tracking FROM OrderRent WHERE orderrent_id = '" + orderid.Text + "'";

            com = new SqlCommand(trackingnumber, con);

            SqlDataReader reader = com.ExecuteReader();
            reader.Read();

            lbl_tracking.Text = "  " + reader["orderrent_tracking"].ToString();

            reader.Close();
            con.Close();
        }

        public void SetupTracking()
        {
            Label orderid = this.DataList1.Items[0].FindControl("lbl_orderbuyid") as Label;

            SqlConnection con = new SqlConnection("Data Source =LAPTOP-S54MGNFF; Initial Catalog = QuadaceGamestore;   Integrated Security = True; Pooling = False");
            con.Open();

            String trackingnumber = "SELECT orderrent_tracking FROM OrderRent WHERE orderrent_id = '" + orderid.Text + "'";

            com = new SqlCommand(trackingnumber, con);

            SqlDataReader reader = com.ExecuteReader();
            reader.Read();

            String tracking = reader["orderrent_tracking"].ToString();
            reader.Close();
            con.Close();

            dgTracking.ShowFooter = true;

            OrderRentClass orderbuy = new OrderRentClass();
            DataSet ds = orderbuy.GetTrackingList(tracking);
            dgTracking.DataSource = ds;
            dgTracking.DataBind();
        }
        protected void Search_Click(object sender, EventArgs e)
        {
            String search = searchbar.Text;
            Session["search"] = search;
            Server.Transfer("../SearchPage.aspx");
        }
    }
}