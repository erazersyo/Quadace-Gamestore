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
    public partial class DeliveryShipRentDetails : System.Web.UI.Page
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

        protected void UpdateStatus_Click(object sender, EventArgs e)
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

            SqlConnection con1 = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            SqlCommand cmd1 = new SqlCommand("INSERT INTO OrderRentTracking VALUES ('" + tracking + "', '" + txtbox_status.Text + "' , getdate())", con1);
            con1.Open();
            cmd1.ExecuteNonQuery();
            con1.Close();

            Server.Transfer("DeliveryShipRentDetails.aspx");
        }

        protected void OrderDelivered_Click(object sender, EventArgs e)
        {
            string fileName = Path.GetFileName(imageAdd.PostedFile.FileName);
            fileName = Guid.NewGuid() + fileName;
            if (Path.GetExtension(imageAdd.PostedFile.FileName) == ".jpg" || Path.GetExtension(imageAdd.PostedFile.FileName) == ".jpeg" || Path.GetExtension(imageAdd.PostedFile.FileName) == ".png" || Path.GetExtension(imageAdd.PostedFile.FileName) == ".bmp")
            {
                Label orderid = this.DataList1.Items[0].FindControl("lbl_orderbuyid") as Label;

                SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
                SqlCommand cmd = new SqlCommand("UPDATE OrderRent SET orderrent_status = 'renting', orderrent_image ='" + fileName + "' WHERE orderrent_id = '" + orderid.Text + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                if (Directory.Exists(Server.MapPath("~/Images")))
                {
                    string s = Server.MapPath("~/Images/" + fileName);

                    imageAdd.PostedFile.SaveAs(s);
                }

                SqlConnection con3 = new SqlConnection("Data Source =LAPTOP-S54MGNFF; Initial Catalog = QuadaceGamestore;   Integrated Security = True; Pooling = False");
                con3.Open();

                String trackingnumber = "SELECT orderrent_tracking FROM OrderRent WHERE orderrent_id = '" + orderid.Text + "'";

                SqlCommand com3 = new SqlCommand(trackingnumber, con3);

                SqlDataReader reader = com3.ExecuteReader();
                reader.Read();

                String tracking = reader["orderrent_tracking"].ToString();
                reader.Close();
                con.Close();

                SqlConnection con1 = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
                SqlCommand cmd1 = new SqlCommand("INSERT INTO OrderRentTracking VALUES ('" + tracking + "', 'Order has been delivered successfully' , getdate())", con1);
                con1.Open();
                cmd1.ExecuteNonQuery();
                con1.Close();

                ClientScript.RegisterStartupScript(typeof(System.Web.UI.Page), "Script", "<Script>alert ('Order Delivered Sucessfully')</Script>");
                Server.Transfer("DeliveryCompleted.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(typeof(System.Web.UI.Page), "Script", "<Script>alert ('Please Upload Only .Jpg .Jpeg .Bmp .Png File')</Script>");
            }
        }
    }
}