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
    public class OrderRentClass
    {
        private SqlCommand cmd = null;

        public DataSet GetOrderRentToShipList()
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderRent WHERE orderrent_status = 'toship' ORDER BY orderrent_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderRent");
            return ds;
        }

        public DataSet GetOrderRentShippingList()
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderRent WHERE orderrent_status = 'shipping' ORDER BY orderrent_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderRent");
            return ds;
        }

        public DataSet GetOrderRentRentingList()
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderRent WHERE orderrent_status = 'renting' ORDER BY orderrent_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderRent");
            return ds;
        }

        public DataSet GetOrderRentReturnedList()
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderRent WHERE orderrent_status = 'returned' ORDER BY orderrent_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderRent");
            return ds;
        }
        public DataSet GetOrderRentCancelledList()
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderRent WHERE orderrent_status = 'cancelled' ORDER BY orderrent_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderRent");
            return ds;
        }

        public DataSet GetSearchList(string search)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderRent where orderrent_id LIKE '%" + search + "%' OR user_id LIKE '%" + search + "%' OR orderrent_name LIKE '%" + search + "%' ORDER BY orderrent_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderRent");
            return ds;
        }

        public int CancelOrderRent(string orderrent_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("UPDATE OrderRent SET orderrent_status = 'cancelled' WHERE orderrent_id='" + orderrent_id + "'");
            return db.ExecuteNonQuery(cmd);
        }

        public DataSet GetOrderRentDetailsList(string orderId)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT a.productrent_id, b.productrent_image, b.productrent_name, b.productrent_category, b.productrent_price, a.quantity, a.date_from, a.date_to, DATEDIFF(day, a.date_from, a.date_to) AS renting_period, b.[productrent_price]*a.[quantity]*DATEDIFF(day, a.date_from, a.date_to) AS [total_price]" +
                "FROM [QuadaceGamestore].[dbo].[ProductRent] b LEFT JOIN [QuadaceGamestore].[dbo].[OrderProductRent] a ON a.productrent_id = b.productrent_id WHERE a.orderrent_id = '" + orderId + "'";
            DataSet ds = db.GetDataSet(cmd, "OrderRent");
            return ds;
        }

        public DataSet GetTrackingList(string tracking)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderRentTracking WHERE orderrent_tracking = '" + tracking + "' ORDER BY orderrent_trackingtime DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderRentTracking");
            return ds;
        }

        public DataSet GetOrderRentToShipUserList(string userid)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderRent WHERE orderrent_status = 'toship' AND user_id = '" + userid + "' ORDER BY orderrent_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderRent");
            return ds;
        }

        public DataSet GetOrderRentShippingUserList(string userid)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderRent WHERE orderrent_status = 'shipping' AND user_id = '" + userid + "' ORDER BY orderrent_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderRent");
            return ds;
        }

        public DataSet GetOrderRentRentingUserList(string userid)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderRent WHERE orderrent_status = 'renting' AND user_id = '" + userid + "' ORDER BY orderrent_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderRent");
            return ds;
        }

        public DataSet GetOrderRentReturnedUserList(string userid)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderRent WHERE orderrent_status = 'returned' AND user_id = '" + userid + "' ORDER BY orderrent_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderRent");
            return ds;
        }

        public DataSet GetOrderRentCancelledUserList(string userid)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM OrderRent WHERE orderrent_status = 'cancelled' AND user_id = '" + userid + "' ORDER BY orderrent_date DESC";
            DataSet ds = db.GetDataSet(cmd, "OrderRent");
            return ds;
        }
    }
}