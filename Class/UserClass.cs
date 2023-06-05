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
    public class UserClass
    {
        private SqlCommand cmd = null;

        public DataSet GetUserList()
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT user_id ,user_name, user_email, user_pass FROM Users";
            DataSet ds = db.GetDataSet(cmd, "Users");
            return ds;
        }

        public DataSet GetSearchList(string search)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT user_id ,user_name, user_email, user_pass FROM Users where user_name LIKE '%" + search + "%' OR user_email LIKE '%" + search + "%'";
            DataSet ds = db.GetDataSet(cmd, "Users");
            return ds;
        }

        public int UpdateUser(string userId, string userEmail, string userName, string userPass)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("UPDATE Users " + "SET user_name='" + userName + "' , user_email='" + userEmail + "', user_pass = '" + userPass + "'" + "WHERE " + "user_id ='" + userId + "'");
            return db.ExecuteNonQuery(cmd);
        }

        public int AddUser(string userName, string userEmail, string userPass)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"Insert Into Users (user_name , user_email, user_pass) VALUES" +
             "(@P1 , @P2, @P3)");
            cmd.Parameters.AddWithValue("@P1", userName);
            cmd.Parameters.AddWithValue("@P2", userEmail);
            cmd.Parameters.AddWithValue("@P3", userPass);
            return db.ExecuteNonQuery(cmd);
        }

        public int DeleteUser(string userId)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("DELETE FROM Users WHERE user_id='" + userId + "'");
            return db.ExecuteNonQuery(cmd);
        }
    }
}