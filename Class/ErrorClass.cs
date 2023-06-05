using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuadaceGamestore.Class
{
    public class ErrorClass
    {
        public static string ErrorMessage(int code, string source)
        {
            if (source == "user")
            {
                if (code == 2627)
                {
                    return "*Duplicated User Email.";
                }
            }

            return "Error occured. Please contact system administrator";
        }
    }
}