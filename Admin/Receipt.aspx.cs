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
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;

namespace QuadaceGamestore.Admin
{
    public partial class Receipt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupOrderBuyDetails();
                Totalprice();
            }
        }
        public void SetupOrderBuyDetails()
        {
            string orderId = Session["order_id"].ToString();

            dgOrderBuyDetails.ShowFooter = true;

            OrderBuyClass orderdetailsbuy = new OrderBuyClass();
            DataSet ds = orderdetailsbuy.GetOrderBuyDetailsList(orderId);
            dgOrderBuyDetails.DataSource = ds;
            dgOrderBuyDetails.DataBind();
        }

        private void Totalprice()
        {
            Decimal totalprice = 0;
            for (int i = 0; i < dgOrderBuyDetails.Items.Count; i++)
            {
                Label total = this.dgOrderBuyDetails.Items[i].FindControl("lbl_Total") as Label;
                Decimal VALUE = Convert.ToDecimal(total.Text);
                totalprice = totalprice + VALUE;
            }
            lbl_total_Prices.Text = totalprice.ToString();
        }


        protected void btnExport_Click(object sender, EventArgs e)
        {
            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    this.Page.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                    pdfDoc.Close();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=file1.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
        }
    }
}