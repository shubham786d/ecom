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
    public partial class home : System.Web.UI.Page
    {

        protected void logout_btn_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("home.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["userid"] != null) //logged in
            {
                Control cntrol = (Control)FindControl("login_btn");
                cntrol.Visible = false;

                cntrol = (Control)FindControl("signup_btn");
                cntrol.Visible = false;

                cntrol = (Control)FindControl("User_menu");
                cntrol.Visible = true;

                Label namelbl = (Label)FindControl("User_menu_name");
                namelbl.Visible = true;
                namelbl.Text = "Welcome " + Session["username"].ToString() ;
                
                
            }
            else // not logged in
            {

                Control cntrol = (Control)FindControl("User_menu");
                cntrol.Visible = false;

            }


            OleDbConnection cn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("database.accdb") + ";");

            cn.Open();
            OleDbCommand cmd = new OleDbCommand("select * from deals", cn);

            OleDbDataReader rd = cmd.ExecuteReader();


            int k = 0;//tblnum
            while (rd.Read())
            {

                OleDbCommand cmd2 = new OleDbCommand("select products.pid,imglink1  from products,deal_detail where deal_detail.did=" + rd[0].ToString() + " and products.pid=deal_detail.pid", cn);

                OleDbDataAdapter da = new OleDbDataAdapter(cmd2);

                DataSet ds = new DataSet();
                DataSet productds = new DataSet();
                da.Fill(ds, "tbl" + k);

                //row
                Panel rowpnl = new Panel();
                rowpnl.CssClass = "row";
                dealdiv.Controls.Add(rowpnl);
                rowpnl.CssClass = "dealbox";
                //col1
                Panel colpnl1 = new Panel();
                colpnl1.CssClass = "col-sm-4";
                rowpnl.Controls.Add(colpnl1);


                Label lbl1 = new Label();
                lbl1.Text = rd[1].ToString() + "</br>";
                colpnl1.Controls.Add(lbl1);
                lbl1.CssClass = "dealname";
                


                Button btn = new Button();
                btn.Text = "VIEW ALL";
                btn.CssClass = "viewallbtn";
                btn.Attributes.Add("disabled","disabled");
                colpnl1.Controls.Add(btn);

                //col2
                Panel colpnl2 = new Panel();
                colpnl2.CssClass = "col-sm-8";
                rowpnl.Controls.Add(colpnl2);


                Label txt = new Label();
                txt.Text = "<ul class='dealslider'>";

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {

                    txt.Text = txt.Text + "<li><div style='height: 200px; width: 200px;'><a href='/product_page.aspx?pid=" + ds.Tables[k].Rows[i][0].ToString() + "'><img  class='img-responsive' style='margin: auto;max-width: 100%;max-height: 100%;' src='" + ds.Tables[k].Rows[i][1].ToString() + "' ></a></li>";
                }
                txt.Text = txt.Text + "</ul>";

                colpnl2.Controls.Add(txt);

            }

        }
    }
}
