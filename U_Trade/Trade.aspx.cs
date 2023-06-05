using QuadaceGamestore.Class;
using System;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Globalization;

namespace QuadaceGamestore
{
    public partial class Trade : System.Web.UI.Page
    {
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
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
        protected void Search_Click(object sender, EventArgs e)
        {
            String search = searchbar.Text;
            Session["search"] = search;
            Server.Transfer("../SearchPage.aspx");
        }
        protected void Trade_Click(object sender, EventArgs e)
        {
            string fileName = Path.GetFileName(imageAdd.PostedFile.FileName);
            fileName = Guid.NewGuid() + fileName;
            if (Path.GetExtension(imageAdd.PostedFile.FileName) == ".jpg" || Path.GetExtension(imageAdd.PostedFile.FileName) == ".jpeg" || Path.GetExtension(imageAdd.PostedFile.FileName) == ".png" || Path.GetExtension(imageAdd.PostedFile.FileName) == ".bmp")
            {
                SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
                SqlCommand cmd = new SqlCommand("INSERT INTO Trade VALUES ('" + tradeName.Text + "','" + tradeType.Text + "','" + tradeCondition.Text + "','" + fileName + "','" + tradeRemarks.Text + "','pending', '' ,'"+ Session["user_id"] +"')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                if (Directory.Exists(Server.MapPath("~/Images")))
                {
                    string s = Server.MapPath("~/Images/" + fileName);

                    imageAdd.PostedFile.SaveAs(s);
                }
                ClientScript.RegisterStartupScript(typeof(System.Web.UI.Page), "Script", "<Script>alert ('Product Added Sucessfuly')</Script>");
                Server.Transfer("Trade.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(typeof(System.Web.UI.Page), "Script", "<Script>alert ('Please Upload Only .Jpg .Jpeg .Bmp .Png File')</Script>");
            }
        }
    }
}