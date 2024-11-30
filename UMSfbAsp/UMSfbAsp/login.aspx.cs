using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;

namespace UMSfbAsp
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Replace with your authentication logic
            if (username == "admin" && password == "password")
            {
                Response.Redirect("dashboard.aspx");
            }
            else
            {
                // Handle invalid login
                Response.Write("<script>alert('Invalid username or password');</script>");
            }
        }

    }
}
