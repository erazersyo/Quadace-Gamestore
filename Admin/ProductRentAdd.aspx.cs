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

namespace QuadaceGamestore.Admin
{
    public partial class ProductRentAdd : System.Web.UI.Page
    {
        private SqlCommand cmd = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Add_Click(object sender, EventArgs e)
        {
            string fileName = Path.GetFileName(imageAdd.PostedFile.FileName);
            fileName = Guid.NewGuid() + fileName;
            if (Path.GetExtension(imageAdd.PostedFile.FileName) == ".jpg" || Path.GetExtension(imageAdd.PostedFile.FileName) == ".jpeg" || Path.GetExtension(imageAdd.PostedFile.FileName) == ".png" || Path.GetExtension(imageAdd.PostedFile.FileName) == ".bmp")
            {
                //string filename = imageAdd.PostedFile.FileName;
                //string filepath = "Images/" + imageAdd.FileName;
                SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
                SqlCommand cmd = new SqlCommand("INSERT INTO ProductRent VALUES ('" + fileName + "','" + nameAdd.Text + "','" + categoryAdd.Text + "','" + priceAdd.Text + "','" + quantityAdd.Text + "','" + descriptionAdd.Text + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                if (Directory.Exists(Server.MapPath("~/Images")))
                {
                    string s = Server.MapPath("~/Images/" + fileName);

                    imageAdd.PostedFile.SaveAs(s);
                }
                ClientScript.RegisterStartupScript(typeof(System.Web.UI.Page), "Script", "<Script>alert ('Product Added Sucessfuly')</Script>");
                Server.Transfer("ManageProductRent.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(typeof(System.Web.UI.Page), "Script", "<Script>alert ('Please Upload Only .Jpg .Jpeg .Bmp .Png File')</Script>");
            }
        }
        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageProductRent.aspx");
        }
    }
}