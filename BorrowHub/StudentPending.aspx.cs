using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BorrowHub
{
    public partial class StudentPending : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Email"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                lblStudentEmail.Text = Session["Email"] as string;
            }
        }

        protected void btnLogoutStudent_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}