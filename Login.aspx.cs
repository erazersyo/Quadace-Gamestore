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

namespace QuadaceGamestore
{
    public partial class Login : System.Web.UI.Page
    {
        private SqlCommand cmd = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            String email = login_email.Text;
            String password = login_pass.Text;

            if (email == "Admin" && password == "12345")
                Response.Redirect("Admin/ManageProduct.aspx");

            else if (email == "Delivery" && password == "12345")
                Response.Redirect("DeliveryMan/DeliveryShip.aspx");

            else
            {
                SqlConnection con = new SqlConnection
                ("Data Source =LAPTOP-S54MGNFF; Initial Catalog = QuadaceGamestore;   Integrated Security = True; Pooling = False");

                try
                {
                    con.Open();
                    SqlCommand cmmd = new SqlCommand("SELECT * FROM users WHERE user_email='" + email + "' AND user_pass='" + password + "'", con);
                    SqlDataReader reader = cmmd.ExecuteReader();

                    if (reader.Read())
                    {
                        Session["user_email"] = email;
                        Session["user_id"] = reader["user_id"].ToString();
                        reader.Close();

                        Response.Redirect("U_Buy/ProductBuy.aspx");
                    }
                    else
                    {
                        lblStatus.Text = "Login unsucessful!";
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());

                }
                finally
                {
                    con.Close();
                }
            }

        }
        protected void ButtonReg_Click(object sender, EventArgs e)
        {
            if (reg_username.Text=="" || reg_email.Text == "" || reg_pass.Text == "" || reg_pass2.Text == "")
            {
                lblStatus3.Text = "Please fill the required information.";
            }
            else if(reg_pass.Text != reg_pass2.Text)
            {
                lblStatus3.Text = "Password not match";
            }
            else
            {
                string r_username = reg_username.Text;
                string r_email = reg_email.Text;
                string r_pass = reg_pass2.Text;
                string r_phone = null;

                SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
                SqlCommand cmd = new SqlCommand("INSERT INTO Users VALUES ('" + r_username + "','" + r_email + "','" + r_pass + "','" + r_phone + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lblStatus2.Text = "Thank you for your registration!! Please Login now";
            }
            

        }
       

    }
} 