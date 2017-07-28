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
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Request.QueryString["UserId"]);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {   string path="database.accdb";
        OleDbConnection cn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("database.accdb") + ";");
            
            cn.Open();
            OleDbCommand cmd = new OleDbCommand( "select * from usertable",cn);
           

            OleDbDataReader rd = cmd.ExecuteReader();

            rd.Read();

            Response.Write(rd[1].ToString());
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            OleDbConnection cn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("database.accdb") + ";");

            cn.Open();
            OleDbCommand cmd = new OleDbCommand("SELECT DISTINCT top 9 pid FROM products_index WHERE index like '%t%'", cn);

            OleDbDataAdapter da = new OleDbDataAdapter(cmd);

            DataSet ds = new DataSet();
            DataSet productds = new DataSet();
            da.Fill(ds, "2 tbl");

           
            

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {

                OleDbCommand cmd1 = new OleDbCommand("select * from products where pid=" + ds.Tables[0].Rows[i].ItemArray[0], cn);

                OleDbDataAdapter da1 = new OleDbDataAdapter(cmd1);

                da1.Fill(productds, i+" tbl");
                

                Response.Write(ds.Tables[0].Rows[i][0]+"<br>");
                Response.Write(productds.Tables[i].Rows[0][1]);
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        { 
            slide.InnerHtml=slide.InnerHtml+"<li><img src='img\\product_image\\1.jpeg' /></li>";
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Label lbl = new Label();
            lbl.Text = "<li><img src='img\\product_image\\1.jpeg' /></li>";
            slide.Controls.Add(lbl);



        }
    }
}
