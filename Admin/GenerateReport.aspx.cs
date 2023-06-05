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
    public partial class GenerateReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataList();
            BindData1List();
            BindData2List();
            BindData3List();
            BindData4List();
            BindData5List();
            BindData6List();
        }

        protected void BindDataList()
        {
            SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            con.Open();
            SqlCommand cmdImageupload = new SqlCommand("SELECT CONVERT(DATE, orderbuy_date) AS Date, SUM(CAST([orderbuy_total] AS FLOAT)) AS Total FROM OrderBuy GROUP BY CONVERT(DATE, orderbuy_date)", con);
            SqlDataAdapter daImageupload = new SqlDataAdapter(cmdImageupload);
            SqlDataAdapter da = new SqlDataAdapter(cmdImageupload);
            DataTable dt = new DataTable();
            da.Fill(dt);

            Chart1.DataSource = dt;
            Chart1.DataBind();
        }

        protected void BindData1List()
        {
            SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            con.Open();
            SqlCommand cmdImageupload = new SqlCommand("if exists (SELECT COUNT(orderbuy_id) AS todaybuy FROM OrderBuy WHERE CONVERT(DATE, orderbuy_date) = CAST( GETDATE() AS Date ) GROUP BY CONVERT(DATE, orderbuy_date)) SELECT COUNT(orderbuy_id) AS todaybuy FROM OrderBuy WHERE CONVERT(DATE, orderbuy_date) = CAST( GETDATE() AS Date ) GROUP BY CONVERT(DATE, orderbuy_date) else select 0 as todaybuy;", con);
            SqlDataAdapter daImageupload = new SqlDataAdapter(cmdImageupload);
            SqlDataAdapter da = new SqlDataAdapter(cmdImageupload);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
        protected void BindData2List()
        {
            SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            con.Open();
            SqlCommand cmdImageupload = new SqlCommand("if exists (SELECT COUNT(orderrent_id) AS todayrent FROM OrderRent WHERE CONVERT(DATE, orderrent_date) = CAST(GETDATE() AS Date) GROUP BY CONVERT(DATE, orderrent_date)) SELECT COUNT(orderrent_id) AS todayrent FROM OrderRent WHERE CONVERT(DATE, orderrent_date) = CAST(GETDATE() AS Date) GROUP BY CONVERT(DATE, orderrent_date) else select 0 as todayrent; ", con);
            SqlDataAdapter daImageupload = new SqlDataAdapter(cmdImageupload);
            SqlDataAdapter da = new SqlDataAdapter(cmdImageupload);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataList2.DataSource = dt;
            DataList2.DataBind();
        }
        protected void BindData3List()
        {
            SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            con.Open();
            SqlCommand cmdImageupload = new SqlCommand("SELECT SUM(CONVERT(float, ISNULL(a.orderbuy_total,0))) + SUM(CONVERT(float, ISNULL(b.orderrent_total,0)))AS todaysale FROM OrderBuy a FULL JOIN OrderRent b ON CONVERT(DATE, a.orderbuy_date) = CONVERT(DATE, b.orderrent_date) WHERE CONVERT(DATE, orderbuy_date) = CAST(GETDATE() AS Date) GROUP BY CONVERT(DATE, orderbuy_date); ", con);
            SqlDataAdapter daImageupload = new SqlDataAdapter(cmdImageupload);
            SqlDataAdapter da = new SqlDataAdapter(cmdImageupload);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataList3.DataSource = dt;
            DataList3.DataBind();
        }

        protected void BindData4List()
        {
            SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            con.Open();
            SqlCommand cmdImageupload = new SqlCommand("SELECT CONVERT(DATE, orderbuy_date) AS Date, COUNT(orderbuy_id) AS Count FROM OrderBuy GROUP BY CONVERT(DATE, orderbuy_date)", con);
            SqlDataAdapter daImageupload = new SqlDataAdapter(cmdImageupload);
            SqlDataAdapter da = new SqlDataAdapter(cmdImageupload);
            DataTable dt = new DataTable();
            da.Fill(dt);

            Chart2.DataSource = dt;
            Chart2.DataBind();
        }

        protected void BindData5List()
        {
            SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            con.Open();
            SqlCommand cmdImageupload = new SqlCommand("SELECT CONVERT(DATE, orderrent_date) AS Date, SUM(CAST([orderrent_total] AS FLOAT)) AS Total FROM OrderRent GROUP BY CONVERT(DATE, orderrent_date)", con);
            SqlDataAdapter daImageupload = new SqlDataAdapter(cmdImageupload);
            SqlDataAdapter da = new SqlDataAdapter(cmdImageupload);
            DataTable dt = new DataTable();
            da.Fill(dt);

            Chart3.DataSource = dt;
            Chart3.DataBind();
        }

        protected void BindData6List()
        {
            SqlConnection con = new SqlConnection("Data Source = localhost; Initial Catalog = QuadaceGamestore;  Integrated Security = True; Pooling = False");
            con.Open();
            SqlCommand cmdImageupload = new SqlCommand("SELECT CONVERT(DATE, orderrent_date) AS Date, COUNT(orderrent_id) AS Count FROM OrderRent GROUP BY CONVERT(DATE, orderrent_date)", con);
            SqlDataAdapter daImageupload = new SqlDataAdapter(cmdImageupload);
            SqlDataAdapter da = new SqlDataAdapter(cmdImageupload);
            DataTable dt = new DataTable();
            da.Fill(dt);

            Chart4.DataSource = dt;
            Chart4.DataBind();
        }
    }
}