using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BorrowHub
{
    public partial class AdminRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // protect page
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            // if you still want the label version:
            // if (!IsPostBack)
            // {
            //     lblAdminEmail.Text = Session["Email"] as string;
            // }
        }

        protected void btnLogoutAdmin_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}
