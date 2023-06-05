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
    public partial class Account : System.Web.UI.Page
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
                lbl_AccountName.Text = "  "+ reader["user_name"].ToString(); 
                lbl_AccountName2.Text = reader["user_name"].ToString();
                lbl_username.Text = reader["user_name"].ToString();
                lbl_phone.Text = reader["user_phone"].ToString();
            }

            else
            {
                lbl_AccountName.Text = " Account";
                lbl_username.Text = " Account";
            }


            reader.Close();
            con.Close();

            lbl_email.Text = "" +Session["user_email"];

        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountEdit.aspx");
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            String search = searchbar.Text;
            Session["search"] = search;
            Server.Transfer("../SearchPage.aspx");
        }
    }
}