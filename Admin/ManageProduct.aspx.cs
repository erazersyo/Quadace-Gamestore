using QuadaceGamestore.Class;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace QuadaceGamestore.Admin
{
    public partial class ManageProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupProductBuy();
            }
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductBuyAdd.aspx");
        }

        protected void SearchProduct_Click(object sender, EventArgs e)
        {
            dgProductBuy.ShowFooter = true;

            String search = search_product.Text;

            if (String.IsNullOrEmpty(search))
            {
                SetupProductBuy();
            }

            else
            {
                ProductBuyClass productbuy = new ProductBuyClass();
                DataSet ds = productbuy.GetSearchList(search);
                dgProductBuy.DataSource = ds;
                dgProductBuy.DataBind();
            }
        }

        public void SetupProductBuy()
        {
            dgProductBuy.ShowFooter = true;

            ProductBuyClass user = new ProductBuyClass();
            DataSet ds = user.GetProductBuyList();
            dgProductBuy.DataSource = ds;
            dgProductBuy.DataBind();
        }
        protected void dgProductBuy_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgProductBuy.CurrentPageIndex = e.NewPageIndex;
            SetupProductBuy();
        }

        protected void dgProductBuy_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.FindControl("btnDeleteProductBuy") != null)
            {
                ((Button)e.Item.FindControl("btnDeleteProductBuy")).Attributes.Add("onClick", "return confirm('Are you sure wish to delete the data?');");
            }
        }

        protected void dgEdit_ProductBuy(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgProductBuy.EditItemIndex = e.Item.ItemIndex;
            SetupProductBuy();
        }

        protected void dgCancel_ProductBuy(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgProductBuy.EditItemIndex = -1;
            SetupProductBuy();
        }

        protected void dgProductBuy_ItemCommand(object sender, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            ProductBuyClass productbuy = new ProductBuyClass();

            if (e.CommandName == "DeleteProductBuy")
            {
                // to do check subject or can rely MSSQL to do the checking
                Label _id = (Label)e.Item.Cells[0].FindControl("IDProductBuy");
                int result = productbuy.DeleteProductBuy(_id.Text);
                if (result > 0)
                {
                    //lblAttention.Text = ErrorClass.ErrorMessage(result, "student");
                }
                else
                {
                    Server.Transfer("ManageProduct.aspx");
                }
            }
        }
        protected void dgUpdate_ProductBuy(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            Label productbuy_id = (Label)e.Item.Cells[0].FindControl("IDProductBuy");
            FileUpload fup = (FileUpload)e.Item.Cells[0].FindControl("FileUploadGV");
            TextBox productbuy_name = (TextBox)e.Item.Cells[0].FindControl("txt_ProductBuy_Name");
            DropDownList productbuy_category = (DropDownList)e.Item.Cells[0].FindControl("ddledit_ProductBuy");
            TextBox productbuy_price = (TextBox)e.Item.Cells[0].FindControl("txt_ProductBuy_Price");
            TextBox productbuy_quantity = (TextBox)e.Item.Cells[0].FindControl("txt_ProductBuy_Quantity");
            TextBox productbuy_description = (TextBox)e.Item.Cells[0].FindControl("txt_ProductBuy_Description");

            string fileName = System.IO.Path.GetFileName(fup.PostedFile.FileName);
            fileName = Guid.NewGuid() + fileName;

            if (System.IO.Path.GetExtension(fup.PostedFile.FileName) == ".jpg" || System.IO.Path.GetExtension(fup.PostedFile.FileName) == ".jpeg" || System.IO.Path.GetExtension(fup.PostedFile.FileName) == ".bmp" || Path.GetExtension(fup.PostedFile.FileName) == ".png")
            {


                if (Directory.Exists(Server.MapPath("~/Images")))
                {
                    string s = Server.MapPath("~/Images/" + fileName);
                    fup.PostedFile.SaveAs(s);
                }

                SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
                SqlCommand cmd = new SqlCommand("UPDATE ProductBuy SET productbuy_image='" + fileName + "', productbuy_name = '" + productbuy_name.Text + "', productbuy_category = '" + productbuy_category.Text + "', productbuy_price = '" + productbuy_price.Text + "', productbuy_quantity = '" + productbuy_quantity.Text + "', productbuy_description = '" + productbuy_description.Text + "'" + "WHERE productbuy_id =" + productbuy_id.Text, con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Server.Transfer("ManageProduct.aspx");

            }

        }

    }
}