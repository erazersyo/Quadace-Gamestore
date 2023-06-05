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
    public partial class OrderDetailsProductRent : System.Web.UI.Page
    {
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

        public static string GetUniqueKey(int maxSize)
        {
            char[] chars = new char[62];
            chars =
            "123456789".ToCharArray();
            byte[] data = new byte[1];
            RNGCryptoServiceProvider crypto = new RNGCryptoServiceProvider();
            crypto.GetNonZeroBytes(data);
            data = new byte[maxSize];
            crypto.GetNonZeroBytes(data);
            StringBuilder result = new StringBuilder(maxSize);
            foreach (byte b in data)
            {
                result.Append(chars[b % (chars.Length)]);
            }
            return result.ToString();
        }

        protected void Ship_Click(object sender, EventArgs e)
        {
            lbl_tracking.Text = GetUniqueKey(6);

            Label orderid = this.DataList1.Items[0].FindControl("lbl_orderbuyid") as Label;
            SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            SqlCommand cmd = new SqlCommand("UPDATE OrderRent SET orderrent_status = 'shipping', orderrent_tracking = '" + lbl_tracking.Text + "' WHERE orderrent_id = '" + orderid.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            SqlConnection con1 = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            SqlCommand cmd1 = new SqlCommand("INSERT INTO OrderRentTracking VALUES ('" + lbl_tracking.Text + "', 'Seller is preparing to ship your parcel' , getdate())", con1);
            con1.Open();
            cmd1.ExecuteNonQuery();
            con1.Close();

            Server.Transfer("ManageOrderRentShipping.aspx");
        }
    }
}