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
    public class CartBuyClass
    {
        private SqlCommand cmd = null;
        public DataSet GetCartBuyList(string userid)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT b.[cart_id], a.[productbuy_id], a.[productbuy_image], a.[productbuy_name], a.[productbuy_price], b.[quantity], a.[productbuy_price]*b.[quantity] AS [total_price] " +
                "FROM [QuadaceGamestore].[dbo].[ProductBuy] a LEFT JOIN [QuadaceGamestore].[dbo].[CartBuy] b ON a.[productbuy_id] = b.[productbuy_id] WHERE b.[user_id] = '" +userid +"'";
            DataSet ds = db.GetDataSet(cmd, "CartBuy");
            return ds;
        }

        public int UpdateCartBuy(string quantity, string cart_id)
        { 
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("UPDATE CartBuy SET quantity='" + quantity  + "' WHERE cart_id ='" + cart_id + "'");
            return db.ExecuteNonQuery(cmd);
        }
        public int DeleteCartBuy(string cart_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("DELETE FROM CartBuy WHERE cart_id='" + cart_id + "'");
            return db.ExecuteNonQuery(cmd);
        }
    }
}