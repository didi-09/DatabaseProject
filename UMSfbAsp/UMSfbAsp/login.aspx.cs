using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Text.RegularExpressions;

namespace UMSfbAsp
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string userEmail = email.Text;
            string userPassword = txtPassword.Text;

            // Example logic to validate email and password
            if (IsValidEmail(userEmail) && ValidateUser(userEmail, userPassword))
            {
                // Redirect to dashboard or homepage
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                // Display an error message
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid email or password.');", true);
            }
        }
        private bool IsValidEmail(string email)
        {
            return Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$");
        }

        private bool ValidateUser(string email, string password)
        {
            // Replace this with database validation
            return email == "test@example.com" && password == "password123";
        }

    }
}
