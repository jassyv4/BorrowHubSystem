using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BorrowHub
{
    public partial class AdminInventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var email = Session["Email"] as string;
                lblAdminEmail.Text = string.IsNullOrEmpty(email)
                    ? "admin@borrowhub.com"
                    : email;
            }
        }

        protected void btnLogoutAdmin_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}