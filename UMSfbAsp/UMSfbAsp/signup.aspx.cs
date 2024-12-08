using System;
using System.Web.UI;

namespace UMSfbAsp
{
    public partial class Signup : Page
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string phone = txtPhone.Text;
            string department = ddlDepartment.SelectedValue;

            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(password) || string.IsNullOrWhiteSpace(phone) ||
                string.IsNullOrWhiteSpace(department))
            {
                // Display an error message
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please fill out all fields.');", true);
                return;
            }

            // Save to database logic (example using pseudo-code)
            bool success = SaveToDatabase(name, email, password, phone, department);

            if (success)
            {
                // Redirect to Login page
                Response.Redirect("Default.aspx");
            }
            else
            {
                // Display an error message
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Signup failed. Try again later.');", true);
            }
        }

        private bool SaveToDatabase(string name, string email, string password, string phone, string department)
        {
            // Example database saving logic
            try
            {
                // Database connection and saving logic goes here
                return true; // Return true if successful
            }
            catch (Exception ex)
            {
                // Log error
                return false; // Return false if there was an error
            }
        }
    }
}
