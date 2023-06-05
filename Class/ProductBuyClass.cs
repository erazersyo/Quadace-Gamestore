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
    public class ProductBuyClass
    {
        private SqlCommand cmd = null;

        public DataSet GetProductBuyList()
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM ProductBuy";
            DataSet ds = db.GetDataSet(cmd, "ProductBuy");
            return ds;
        }
        public DataSet GetSearchList(string search)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM ProductBuy where productbuy_name LIKE '%" + search + "%' OR productbuy_category LIKE '%" + search + "%' OR productbuy_id LIKE '%" + search + "%'";
            DataSet ds = db.GetDataSet(cmd, "ProductBuy");
            return ds;
        }

        public int UpdateProductBuy(string productbuy_id, string productbuy_image, string productbuy_name, string productbuy_category, string productbuy_price, string productbuy_quantity, string productbuy_description)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("UPDATE ProductBuy SET productbuy_id='" + productbuy_id + "' , productbuy_image='" + productbuy_image + "', productbuy_name = '" + productbuy_name + "', productbuy_category = '" + productbuy_category + "', productbuy_price = '" + productbuy_price + "', productbuy_quantity = '" + productbuy_quantity + "', productbuy_description = '" + productbuy_description + "'" + "WHERE " + "productbuy_id ='" + productbuy_id + "'");
            return db.ExecuteNonQuery(cmd);
        }

        public int DeleteProductBuy(string productbuy_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("DELETE FROM ProductBuy WHERE productbuy_id='" + productbuy_id + "'");
            return db.ExecuteNonQuery(cmd);
        }    
    }
}