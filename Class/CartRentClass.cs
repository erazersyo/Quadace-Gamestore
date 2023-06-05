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
    public class CartRentClass
    {
        private SqlCommand cmd = null;
        public DataSet GetCartRentList(string userid)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT b.[cart_id], a.[productrent_id], a.[productrent_image], a.[productrent_name], a.[productrent_price], b.[quantity], b.date_from, b.date_to, DATEDIFF(day, b.date_from, b.date_to) AS renting_period, a.[productrent_price]*b.[quantity]*DATEDIFF(day, b.date_from, b.date_to) AS [total_price]" +
                "FROM [QuadaceGamestore].[dbo].[ProductRent] a LEFT JOIN [QuadaceGamestore].[dbo].[CartRent] b ON a.[productrent_id] = b.[productrent_id] WHERE b.[user_id]= '" + userid + "'";
            DataSet ds = db.GetDataSet(cmd, "CartBuy");
            return ds;
        }

        public int UpdateCartRent(string quantity, string from, string to, string cart_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("UPDATE CartRent SET quantity='" + quantity + "', date_from = '" + from + "' , date_to = '" + to + "' WHERE cart_id ='" + cart_id + "'");
            return db.ExecuteNonQuery(cmd);
        }
        public int DeleteCartRent(string cart_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("DELETE FROM CartRent WHERE cart_id='" + cart_id + "'");
            return db.ExecuteNonQuery(cmd);
        }
    }
}