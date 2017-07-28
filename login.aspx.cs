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
using System.Data.OleDb;
namespace ecom
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            OleDbConnection cn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("database.accdb") + ";");

            cn.Open();

            OleDbCommand cmd = new OleDbCommand("select * from usertable where emailid=@emailidd and pass=@Pass", cn);
            cmd.Parameters.Add("@emailidd",emailid.Text);
            cmd.Parameters.Add("@Pass", pwd.Text);
            OleDbDataReader rd = cmd.ExecuteReader();

            if (rd.HasRows)
            {
                rd.Read();
                Session["userid"] = rd[0].ToString();
                Session["username"] = rd[1].ToString();
                Session["usertype"] = rd[5].ToString();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "parent.hidemodal();", true);
            
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Wrong id/pass')", true);
            }
        }
    }
}
