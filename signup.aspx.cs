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
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signbtn_Click(object sender, EventArgs e)
        {
            OleDbConnection cn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("database.accdb") + ";");

            cn.Open();

            OleDbCommand cmd = new OleDbCommand("select * from usertable where emailid=@emailidd", cn);
            //cmd.Parameters.Add("@emailidd",);

            OleDbDataReader rd = cmd.ExecuteReader();
           
            if (!rd.HasRows)
            {
                rd.Close();


                cmd = new OleDbCommand("select max(id) from usertable", cn);
                rd = cmd.ExecuteReader();
                rd.Read();

                var id = rd[0].ToString();

                rd.Close();

                cmd = new OleDbCommand("insert into usertable values("+ id +",'"+ name.Value +"','"+ pwd+"')", cn);

            }
        }
    }
}
