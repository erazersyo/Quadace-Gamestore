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

namespace QuadaceGamestore.Admin
{
    public partial class ManageOrderTradeAccepted : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataList();
            }
        }

        protected void BindDataList()
        {
            SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            con.Open();
            SqlCommand cmdImageupload = new SqlCommand("Select * FROM Trade WHERE trade_status='accepted'", con);
            SqlDataAdapter daImageupload = new SqlDataAdapter(cmdImageupload);
            SqlDataAdapter da = new SqlDataAdapter(cmdImageupload);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataList2.DataSource = dt;
            DataList2.DataBind();
        }

        protected void Pending(object sender, EventArgs e)
        {
            Response.Redirect("ManageOrderTrade.aspx");
        }
        protected void Accepted(object sender, EventArgs e)
        {
            Response.Redirect("ManageOrderTradeAccepted.aspx");
        }
        protected void Declined(object sender, EventArgs e)
        {
            Response.Redirect("ManageOrderTradeDeclined.aspx");
        }
    }
}