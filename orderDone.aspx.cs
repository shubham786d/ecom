using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace ecom
{
    public partial class orderDone : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] != null) //logged in
            {
                Control cntrol;
                cntrol = (Control)FindControl("User_menu");
                cntrol.Visible = true;

                Label namelbl = (Label)FindControl("User_menu_name");
                namelbl.Visible = true;
                namelbl.Text = "Welcome " + Session["username"].ToString();


            }
            else // not logged in
            {
                Response.Redirect("home.aspx");
            }
        }
        protected void logout_btn_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("home.aspx");
        }
    }
}
