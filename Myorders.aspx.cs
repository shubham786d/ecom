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
    public partial class Myorders : System.Web.UI.Page
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



                Panel pnl;
                Table tbl;
                TableRow row;
                TableCell cell;
                TableHeaderRow headrow;
                TableHeaderCell headcell;
                Label lbl;
                Image img;
                OleDbConnection cn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("database.accdb") + ";");
                
                cn.Open();
                //finding all orders
                OleDbCommand cmd = new OleDbCommand("select * from orders where userid=" + Session["userid"].ToString() + " order by orderid desc", cn);
                OleDbDataReader rd = cmd.ExecuteReader();
                DataSet ds = new DataSet();

                int ordercount=0;
                while (rd.Read())
                {
                    
                    pnl = new Panel();
                    pnl.CssClass="box";
                    tbl = new Table();
                    tbl.CssClass = "table table-hover";
                    row = new TableRow();
                    tbl.Controls.Add(row);

                    //Head
                    headrow = new TableHeaderRow();

                    headcell = new TableHeaderCell();
                    
                    lbl = new Label();
                    lbl.Text = "<h6 style='background: #2874f0;border: 1px solid #2874f0;padding: 8px 12px;border-radius: 2px;color:white;width:150px;'>Order ID : " + rd[0].ToString() + "</h6>";

                    headcell.Controls.Add(lbl);
                    headrow.Controls.Add(headcell);
                    tbl.Controls.Add(headrow);



                    cmd = new OleDbCommand("select orderdetail.*,pname,imglink1 from orderdetail,products where  orderid=" + rd[0].ToString() +" and pid=productid", cn);
                    OleDbDataAdapter da = new OleDbDataAdapter(cmd);
                    da.Fill(ds, "tbl" + ordercount);

                    for (int i = 0; i < ds.Tables[ordercount].Rows.Count; i++)
                    {
                        row = new TableRow();
                        
                        //image
                        cell = new TableCell();
                        cell.Attributes.Add("style", "width: 30px;");
                        img = new Image();
                        img.ImageUrl = ds.Tables[ordercount].Rows[i][5].ToString();
                        img.Attributes.Add("style", "max-width: 60px;,max-height: 60px;");

                        cell.Controls.Add(img);
                        row.Controls.Add(cell);

                        //name
                        cell = new TableCell();
                        lbl = new Label();
                        lbl.Text = ds.Tables[ordercount].Rows[i][4].ToString();

                        cell.Controls.Add(lbl);
                        row.Controls.Add(cell);

                        //Price
                        cell = new TableCell();
                        lbl = new Label();
                        lbl.Text = "<img src='img/rs.png' width='8' height='10'>" + ds.Tables[ordercount].Rows[i][3].ToString();

                        cell.Controls.Add(lbl);
                        row.Controls.Add(cell);


                        tbl.Controls.Add(row);
                    }
                    //order total
                    row = new TableRow();
                    cell = new TableCell();
                    lbl = new Label();
                    lbl.Text = "Order Total : <img src='img/rs.png' width='8' height='10'>" + rd[3].ToString();

                    cell.Controls.Add(lbl);
                    row.Controls.Add(cell);


                    tbl.Controls.Add(row);

                    pnl.Controls.Add(tbl);
                    outerDiv.Controls.Add(pnl);
                    ordercount++;
                }
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
