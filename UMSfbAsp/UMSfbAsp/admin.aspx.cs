using System;
using System.Data;
using System.Web.UI.WebControls;

namespace UMSfbAsp
{
    public partial class Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDepartments();
                LoadAdvisors();
                LoadStudents();
            }
        }

        private void LoadDepartments()
        {
            // Populate Department dropdown (dummy data)
            ddlDepartment.Items.Add(new ListItem("Select Department", ""));
            ddlDepartment.Items.Add(new ListItem("Computer Science", "1"));
            ddlDepartment.Items.Add(new ListItem("Cyber Security", "2"));
            ddlDepartment.Items.Add(new ListItem("Artificial Intelligence", "3"));
        }

        private void LoadAdvisors()
        {
            // Populate Advisor dropdown (dummy data)
            ddlAdvisor.Items.Add(new ListItem("Select Advisor", ""));
            ddlAdvisor.Items.Add(new ListItem("Dr. Smith", "1"));
            ddlAdvisor.Items.Add(new ListItem("Dr. Johnson", "2"));
        }

        private void LoadStudents()
        {
            // Example: Bind GridView with dummy data
            DataTable dt = new DataTable();
            dt.Columns.Add("student_id");
            dt.Columns.Add("name");
            dt.Columns.Add("email");
            dt.Columns.Add("department_name");
            dt.Columns.Add("advisor_name");
            dt.Columns.Add("enrollment_date");

            dt.Rows.Add("1", "John Doe", "john.doe@example.com", "Computer Science", "Dr. Smith", "2022-09-01");
            dt.Rows.Add("2", "Jane Smith", "jane.smith@example.com", "Cyber Security", "Dr. Johnson", "2022-09-15");

            //gvStudents.DataSource = dt;
           // gvStudents.DataBind();
          
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Save student details (implement DB logic here)
            string name = txtStudentName.Text;
            string email = txtStudentEmail.Text;
            string enrollmentDate = txtEnrollmentDate.Text;
            string department = ddlDepartment.SelectedValue;
            string advisor = ddlAdvisor.SelectedValue;

            // Example: Show success message (replace with DB save logic)
            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Student {name} saved successfully!');", true);

            // Reload the student list
            LoadStudents();
        }
    }
}
