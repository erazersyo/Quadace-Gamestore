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
    public class ProductRentClass
    {
        private SqlCommand cmd = null;

        public DataSet GetProductRentList()
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM ProductRent";
            DataSet ds = db.GetDataSet(cmd, "ProductRent");
            return ds;
        }
        public DataSet GetSearchList(string search)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM ProductRent where productrent_name LIKE '%" + search + "%' OR productrent_category LIKE '%" + search + "%' OR productrent_id LIKE '%" + search + "%'";
            DataSet ds = db.GetDataSet(cmd, "ProductRent");
            return ds;
        }

        public int UpdateProductRent(string productrent_id, string productrent_image, string productrent_name, string productrent_category, string productrent_price, string productrent_quantity, string productrent_description)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("UPDATE ProductRent SET productrent_id='" + productrent_id + "' , productrent_image='" + productrent_image + "', productrent_name = '" + productrent_name + "', productrent_category = '" + productrent_category + "', productrent_price = '" + productrent_price + "', productrent_quantity = '" + productrent_quantity + "', productrent_description = '" + productrent_description + "'" + "WHERE " + "productrent_id ='" + productrent_id + "'");
            return db.ExecuteNonQuery(cmd);
        }

        public int DeleteProductRent(string productrent_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("DELETE FROM ProductRent WHERE productrent_id='" + productrent_id + "'");
            return db.ExecuteNonQuery(cmd);
        }
    }
}