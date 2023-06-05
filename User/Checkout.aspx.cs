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
    public partial class Checkout : System.Web.UI.Page
    {
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupCheckout();
                Totalprice();
            }

            SqlConnection con = new SqlConnection("Data Source =LAPTOP-S54MGNFF; Initial Catalog = QuadaceGamestore;   Integrated Security = True; Pooling = False");
            con.Open();

            String username = "SELECT [user_name] FROM[QuadaceGamestore].[dbo].[Users] where[user_email] ='" + Session["user_email"] + "'";


            com = new SqlCommand(username, con);

            SqlDataReader reader = com.ExecuteReader();

            reader.Read();

            if (Session["user_email"] != null)
            {
                lbl_AccountName.Text = "  " + reader["user_name"].ToString();
            }

            else
            {
                lbl_AccountName.Text = " Account";
            }
        }

        public void SetupCheckout()
        {
            String userid = Session["user_id"].ToString();

            dgCheckout.ShowFooter = true;

            CartBuyClass cartbuy = new CartBuyClass();
            DataSet ds = cartbuy.GetCartBuyList(userid);
            dgCheckout.DataSource = ds;
            dgCheckout.DataBind();
        }

        private void Totalprice()
        {
            Decimal totalprice = 0;
            for (int i = 0; i < dgCheckout.Items.Count; i++)
            {
                Label lb = this.dgCheckout.Items[i].FindControl("lbl_Total") as Label;
                Decimal VALUE = Convert.ToDecimal(lb.Text);
                totalprice = totalprice + VALUE;
            }
            lbl_total_Prices.Text = totalprice.ToString();
        }

        protected void CheckBoxRequired_ServerValidate(object sender, ServerValidateEventArgs e)
        {
            e.IsValid = CheckBox1.Checked;
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
        protected void PO_Click(object sender, EventArgs e)
        {
            if(name.Text=="" || street.Text=="" || town.Text == "" || postcode.Text == "" || phone.Text == "")
            {
                LabelAttention.Text = "Please fill all the required information.";
            }
            else if(Convert.ToInt32(postcode.Text) < 10000 || Convert.ToInt32(postcode.Text) > 99999)
            {
                LabelAttention.Text = "Please fill the correct format of postcode.";
            }
            else if (CheckBox1.Checked)
            {
                lblOrderId.Text = GetUniqueKey(6);

                SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
                SqlCommand cmd = new SqlCommand("INSERT INTO OrderBuy VALUES ('" + lblOrderId.Text + "','" + Session["user_id"].ToString() + "',getdate(),'" + name.Text + "','" + street.Text + "','" + town.Text + "','" + state.Text + "','" + postcode.Text + "','" + phone.Text + "','" + notes.Text + "','" + lbl_total_Prices.Text + "','toship',' ', ' ')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                for (int j = 0; j < dgCheckout.Items.Count; j++)
                {
                    Label pdid = this.dgCheckout.Items[j].FindControl("lbl_pdid") as Label;
                    Label qty = this.dgCheckout.Items[j].FindControl("lbl_Amount") as Label;

                    SqlConnection con1 = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
                    SqlCommand cmd1 = new SqlCommand("INSERT INTO OrderProductBuy VALUES ('" + pdid.Text + "','" + lblOrderId.Text + "','" + qty.Text + "')", con1);
                    con1.Open();
                    cmd1.ExecuteNonQuery();
                    con1.Close();

                    SqlConnection con3 = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
                    SqlCommand cmd3 = new SqlCommand("UPDATE ProductBuy SET productbuy_quantity = productbuy_quantity - "+ qty.Text +" WHERE productbuy_id = '" + pdid.Text + "'", con3);
                    con3.Open();
                    cmd3.ExecuteNonQuery();
                    con3.Close();
                }

                SqlConnection con2 = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
                SqlCommand cmd2 = new SqlCommand("DELETE FROM CartBuy WHERE user_id='" + Session["user_id"].ToString() + "'", con2);
                con2.Open();
                cmd2.ExecuteNonQuery();
                con2.Close();

                Server.Transfer("OrderToShip.aspx");
            }
            else
            {
                Label2.Text = " *Please check the Accept Terms Check Box";
                LabelAttention.Text = "";
            }

        }
        protected void Search_Click(object sender, EventArgs e)
        {
            String search = searchbar.Text;
            Session["search"] = search;
            Server.Transfer("../SearchPage.aspx");
        }

    }
}