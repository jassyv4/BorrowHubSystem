using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BorrowHub
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // SIGN IN
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Just to prove the button is firing:
            lblDebug.Text = "Sign In clicked";

            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            // demo accounts
            if (email == "admin@borrowhub.com" && password == "admin123")
            {
                Session["Role"] = "Admin";
                Session["Email"] = email;
                Response.Redirect("AdminDashboard.aspx");
            }
            else if (email == "student@borrowhub.com" && password == "student123")
            {
                Session["Role"] = "Student";
                Session["Email"] = email;
                Response.Redirect("StudentDashboard.aspx");
            }
            else
            {
                lblDebug.Text = "Invalid email or password.";
            }
        }

        // SIGN UP
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string name = txtRegName.Text.Trim();
            string email = txtRegEmail.Text.Trim();
            string password = txtRegPass.Text;

            // later: save to DB; for now auto-login as student
            Session["Role"] = "Student";
            Session["Email"] = email;
            Session["Name"] = name;

            Response.Redirect("StudentDashboard.aspx");
        }
    }
}