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
using System.IO;

namespace QuadaceGamestore.DeliveryMan
{
    public partial class DeliveryCompletedRentDetails : System.Web.UI.Page
    {
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TrackingNumber();
                SetupTracking();
            }
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

    }
}