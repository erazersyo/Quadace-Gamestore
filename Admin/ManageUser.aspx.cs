using QuadaceGamestore.Class;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuadaceGamestore.Admin
{
    public partial class ManageUser : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupUser();
            }
        }
        protected void Search_Click(object sender, EventArgs e)
        {
            dgUser.ShowFooter = true;

            String search = search_user.Text;

            if (String.IsNullOrEmpty(search))
            {
                SetupUser();
            }

            else
            {
                UserClass user = new UserClass();
                DataSet ds = user.GetSearchList(search);
                dgUser.DataSource = ds;
                dgUser.DataBind();
            }
        }

        public void SetupUser()
        {
            dgUser.ShowFooter = true;

            UserClass user = new UserClass();
            DataSet ds = user.GetUserList();
            dgUser.DataSource = ds;
            dgUser.DataBind();
        }

        protected void dgUser_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgUser.CurrentPageIndex = e.NewPageIndex;
            SetupUser();
        }

        protected void dgUser_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.FindControl("btnDeleteUser") != null)
            {
                ((Button)e.Item.FindControl("btnDeleteUser")).Attributes.Add("onClick", "return confirm('Are you sure wish to delete the data?');");
            }
        }

        protected void dgEdit_User(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgUser.EditItemIndex = e.Item.ItemIndex;
            SetupUser();
        }

        protected void dgCancel_User(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgUser.EditItemIndex = -1;
            SetupUser();
        }

        protected void dgUser_ItemCommand(object sender, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            UserClass user = new UserClass();

            if (e.CommandName == "AddUser")
            {
                TextBox txtTempNameUser = (TextBox)e.Item.Cells[0].FindControl("txt_User_Name_New");
                TextBox txtTempEmailUser = (TextBox)e.Item.Cells[0].FindControl("txt_User_Email_New");
                TextBox txtTempPassUser = (TextBox)e.Item.Cells[0].FindControl("txt_User_Pass_New");
                if (txtTempNameUser.Text.Trim() == "" || txtTempEmailUser.Text.Trim() == "" || txtTempPassUser.Text.Trim() == "")
                {
                    lblAttention.Text = "Please insert all data and do not leave the fields blank.";
                }
                else
                {
                    int result = user.AddUser(txtTempNameUser.Text, txtTempEmailUser.Text, txtTempPassUser.Text);
                    if (result > 0)
                    {
                        lblAttention.Text = ErrorClass.ErrorMessage(result, "user");
                    }
                    else
                    {
                        Server.Transfer("ManageUser.aspx");
                    }
                }
            }

            else if (e.CommandName == "DeleteUser")
            {
                // to do check subject or can rely MSSQL to do the checking
                Label _id = (Label)e.Item.Cells[0].FindControl("IDUser");
                int result = user.DeleteUser(_id.Text);
                if (result > 0)
                {
                    //lblAttention.Text = ErrorClass.ErrorMessage(result, "student");
                }
                else
                {
                    Server.Transfer("ManageUser.aspx");
                }
            }
        }

        protected void dgUpdate_User(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            TextBox userId = (TextBox)e.Item.Cells[0].FindControl("txt_User_ID");
            TextBox userName = (TextBox)e.Item.Cells[0].FindControl("txt_User_Name");
            TextBox userEmail = (TextBox)e.Item.Cells[0].FindControl("txt_User_Email");
            TextBox userPass = (TextBox)e.Item.Cells[0].FindControl("txt_User_Pass");
            UserClass user = new UserClass();

            if (userName.Text.Trim() == "" || userEmail.Text.Trim() == "" || userPass.Text.Trim() == "")
            {
                lblAttention.Text = "Please insert full details!";
            }
            else
            {
                int result = user.UpdateUser(userId.Text, userName.Text, userEmail.Text, userPass.Text);
                if (result > 0)
                {
                    //lblAttention.Text = ErrorClass.ErrorMessage(result, "admin");
                }
                else
                {
                    Server.Transfer("ManageUser.aspx");
                }
            }
        }
    }
}