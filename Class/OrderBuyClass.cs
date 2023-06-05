using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuadaceGamestore.Class
{
    public class OrderBuyClass
    {
        private SqlCommand cmd = null;

        public DataSet GetOrderBuyToShipList()
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderBuy WHERE orderbuy_status = 'toship' ORDER BY orderbuy_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderBuy");
            return ds;
        }

        public DataSet GetOrderBuyShippingList()
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderBuy WHERE orderbuy_status = 'shipping' ORDER BY orderbuy_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderBuy");
            return ds;
        }

        public DataSet GetOrderBuyCompletedList()
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderBuy WHERE orderbuy_status = 'completed' ORDER BY orderbuy_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderBuy");
            return ds;
        }

        public DataSet GetOrderBuyCancelledList()
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderBuy WHERE orderbuy_status = 'cancelled' ORDER BY orderbuy_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderBuy");
            return ds;
        }

        public DataSet GetSearchList(string search)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderBuy where orderbuy_id LIKE '%" + search + "%' OR user_id LIKE '%" + search + "%' OR orderbuy_name LIKE '%" + search + "%' ORDER BY orderbuy_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderBuy");
            return ds;
        }

        public int CancelOrderBuy(string orderbuy_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("UPDATE OrderBuy SET orderbuy_status = 'cancelled' WHERE orderbuy_id='" + orderbuy_id + "'");
            return db.ExecuteNonQuery(cmd);
        }

        public DataSet GetOrderBuyDetailsList(string orderId)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT a.productbuy_id, b.productbuy_image, b.productbuy_name, b.productbuy_category, b.productbuy_price, a.quantity, b.[productbuy_price] * a.[quantity] AS[total_price]" +
                "FROM [QuadaceGamestore].[dbo].[ProductBuy] b LEFT JOIN [QuadaceGamestore].[dbo].[OrderProductBuy] a ON a.productbuy_id = b.productbuy_id WHERE a.orderbuy_id = '" + orderId + "'";
            DataSet ds = db.GetDataSet(cmd, "OrderBuy");
            return ds;
        }

        public DataSet GetTrackingList(string tracking)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderBuyTracking WHERE orderbuy_tracking = '"+ tracking + "' ORDER BY orderbuy_trackingtime DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderBuyTracking");
            return ds;
        }

        public DataSet GetOrderBuyToShipUserList(string userid)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderBuy WHERE orderbuy_status = 'toship' AND user_id = '"+ userid +"' ORDER BY orderbuy_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderBuy");
            return ds;
        }

        public DataSet GetOrderBuyShippingUserList(string userid)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderBuy WHERE orderbuy_status = 'shipping' AND user_id = '" + userid + "' ORDER BY orderbuy_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderBuy");
            return ds;
        }

        public DataSet GetOrderBuyCompletedUserList(string userid)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderBuy WHERE orderbuy_status = 'completed' AND user_id = '" + userid + "' ORDER BY orderbuy_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderBuy");
            return ds;
        }

        public DataSet GetOrderBuyCancelledUserList(string userid)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderBuy WHERE orderbuy_status = 'cancelled' AND user_id = '" + userid + "' ORDER BY orderbuy_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderBuy");
            return ds;
        }

    }
}