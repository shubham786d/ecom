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
    public partial class product_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["src"] != null)
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
                    namelbl.Text = "Welcome " + Session["username"].ToString();


                }
                else // not logged in
                {

                    Control cntrol = (Control)FindControl("User_menu");
                    cntrol.Visible = false;

                }

                src_txt.Value = Request.QueryString["src"].ToString();
                src_btn_click(null, EventArgs.Empty);

            }
        }

        protected void src_btn_click(object sender, EventArgs e)
        {
            string str = src_txt.Value.ToString();
            var srclist = str.Split(new[] { " " }, StringSplitOptions.None);

            //src_txt.Value = "";
            //for (int i = 0; i < srclist.Length;i++ )
            //    src_txt.Value = src_txt.Value+"+"+srclist[i].ToString();


            OleDbConnection cn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("database.accdb") + ";");

            cn.Open();

            string query = "SELECT DISTINCT pid FROM products_index WHERE index like '%" + srclist[0].ToString() + "%'";

            for (int i = 1; i < srclist.Length; i++)
            {
                query = query + " or index like '%" + srclist[i].ToString() + "%'";
            }

            OleDbCommand cmd = new OleDbCommand(query, cn);

            //for (int i = 0; i < srclist.Length; i++)
            //{
            //    cmd.Parameters.Add("@index" + i, srclist[i].ToString());  
            //}


            OleDbDataAdapter da = new OleDbDataAdapter(cmd);

            DataSet ds = new DataSet();
            DataSet productds = new DataSet();
            da.Fill(ds, "2 tbl");




            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {

                OleDbCommand cmd1 = new OleDbCommand("select * from products where pid=" + ds.Tables[0].Rows[i].ItemArray[0], cn);

                OleDbDataAdapter da1 = new OleDbDataAdapter(cmd1);

                da1.Fill(productds, i + " tbl");

                Panel box = new Panel();
                box.CssClass = "col-sm-3 box";
                //box.Attributes.Add("style", "border:dotted 2px black");

                ImageButton pro_img = new ImageButton();

                pro_img.ImageUrl = productds.Tables[i].Rows[0][5].ToString();
                pro_img.Width = Unit.Pixel(150);
                pro_img.Height = Unit.Pixel(250);
                pro_img.Attributes.Add("style", "margin:auto");
                pro_img.OnClientClick = "redirect(" + ds.Tables[0].Rows[i].ItemArray[0] + ")";

                Panel imagebox = new Panel();
                imagebox.CssClass = "center-block ";
                //imagebox.Attributes.Add("style", "border:dotted 2px black");
                imagebox.Width = pro_img.Width;
                imagebox.Controls.Add(pro_img);


                Label name_lbl = new Label();
                name_lbl.Text = productds.Tables[i].Rows[0][1].ToString();
                name_lbl.Height = Unit.Pixel(60);
                name_lbl.Attributes.Add("style", "display:block;text-align: center;");

                Table tbl = new Table();
                TableRow row = new TableRow();
                tbl.Rows.Add(row);

                TableCell cell3 = new TableCell();
                Label discountrate_lbl = new Label();
                discountrate_lbl.Text = ("<img src='http://i.stack.imgur.com/nGbfO.png' width='8' height='10'>" + productds.Tables[i].Rows[0][4].ToString() + "&nbsp;");
                discountrate_lbl.CssClass = "disprice";
                cell3.Controls.Add(discountrate_lbl);
                row.Cells.Add(cell3);

                TableCell cell2 = new TableCell();
                Label rate_lbl = new Label();
                rate_lbl.Text = "<del>" + productds.Tables[i].Rows[0][3].ToString() + "</del> &nbsp";
                cell2.Controls.Add(rate_lbl);
                row.Cells.Add(cell2);


                //double discountrate=Convert.ToDouble( productds.Tables[i].Rows[0][4].ToString());
                //double rate = Convert.ToDouble(productds.Tables[i].Rows[0][3].ToString());
                //double discount = Math.Round(((rate - discountrate) / rate) * 100);

                TableCell cell = new TableCell();
                Label disc_per_lbl = new Label();
                disc_per_lbl.Text = productds.Tables[i].Rows[0][9].ToString();
                disc_per_lbl.Attributes.Add("style", "color:#388e3c;font-size: 13px;font-weight: 500;");
                cell.Controls.Add(disc_per_lbl);
                row.Cells.Add(cell);

                box.Controls.Add(imagebox);
                box.Controls.Add(name_lbl);
                box.Controls.Add(tbl);

                product_list.Controls.Add(box);


            }

        }

        protected void logout_btn_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("home.aspx");
        }

    }
}
