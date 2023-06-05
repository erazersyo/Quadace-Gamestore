using QuadaceGamestore.Class;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace QuadaceGamestore.User
{
    public partial class AccountEdit : System.Web.UI.Page
    {
        SqlCommand com;

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source =LAPTOP-S54MGNFF; Initial Catalog = QuadaceGamestore;   Integrated Security = True; Pooling = False");
            con.Open();

            String username = "SELECT [user_name], [user_phone] FROM[QuadaceGamestore].[dbo].[Users] where[user_email] ='" + Session["user_email"] + "'";
  
            com = new SqlCommand(username, con);

            SqlDataReader reader = com.ExecuteReader();

            reader.Read();

            if (Session["user_email"] != null)
            {
                lbl_AccountName.Text = "  " + reader["user_name"].ToString();
                lbl_AccountName2.Text = reader["user_name"].ToString();
            }

            else
            {
                lbl_AccountName.Text = " Account";
            }

            user_edit.Text = reader["user_name"].ToString();
            email_edit.Text = Session["user_email"].ToString();
            phone_edit.Text = reader["user_phone"].ToString();

            reader.Close();
            con.Close();
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Account.aspx");
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            SqlCommand cmd = new SqlCommand("UPDATE Users SET user_name='" + user_edit.Text + "' , user_email='" + email_edit.Text + "', user_phone = '" + phone_edit.Text + "' WHERE user_id ='" + Session["user_id"] + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Account.aspx");
        }
        protected void Search_Click(object sender, EventArgs e)
        {
            String search = searchbar.Text;
            Session["search"] = search;
            Server.Transfer("../SearchPage.aspx");
        }
    }
}