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
    public partial class product_page1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string str=" <li><img src='images/slideshow/slider2.jpg' /></li>"+
				            "<li><img src='images/slideshow/dance_girls.jpg' /></li>"+
				            "<li><img src='images/slideshow/slider7.jpg' /></li>";

            if (!string.IsNullOrEmpty(Request.QueryString["pid"]))
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
                
                
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully"+ Request.QueryString["pid"].ToString()+"')" , true);
                ViewState["pid"] = Request.QueryString["pid"].ToString();

                OleDbConnection cn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("database.accdb") + ";");

                cn.Open();
                OleDbCommand cmd = new OleDbCommand("select * from products where pID=@id", cn);

                cmd.Parameters.Add("@id", Request.QueryString["pid"].ToString());

                OleDbDataReader rd = cmd.ExecuteReader();

                if (rd.Read()) //product found
                {
                    pro_img_1.InnerHtml = "<img src='" + rd["imglink1"].ToString() + "' class='center-block' style=' max-width: 300px; max-height: 300px; ' />";
                    pro_img_2.InnerHtml = "<img src='" + rd["imglink2"].ToString() + "' class='center-block' style=' max-width: 300px; max-height: 300px; ' />";
                    pro_img_3.InnerHtml = "<img src='" + rd["imglink3"].ToString() + "' class='center-block' style=' max-width: 300px; max-height: 300px; '/>";
                    pro_img_4.InnerHtml = "<img src='" + rd["imglink4"].ToString() + "' class='center-block' style=' max-width: 300px; max-height: 300px; ' />";

                    //product_gen_detail

                    Table tbl = new Table();

                    product_gen_detail.Controls.Add(tbl);
                    //row1 name
                    TableRow row = new TableRow();
                    tbl.Rows.Add(row);
                    TableCell cell1 = new TableCell();
                    Label pro_name = new Label();
                    pro_name.Text = rd[1].ToString() + "<hr>";
                    pro_name.Attributes.Add("style", "padding: 0;line-height: 1.4;font-size: 20px;font-weight: inherit;display: inline-block;margin-right: 5px;");
                    cell1.Controls.Add(pro_name);
                    row.Controls.Add(cell1);
                    //row2
                    TableRow row2 = new TableRow();
                    tbl.Rows.Add(row2);
                    TableCell cell2 = new TableCell();
                    Label dis_rate = new Label();
                    dis_rate.Text = "<img src='http://i.stack.imgur.com/nGbfO.png' width='8' height='10'>" + rd[4].ToString();
                    dis_rate.Attributes.Add("style", "font-size: 28px;vertical-align: sub;");
                    cell2.Controls.Add(dis_rate);
                    row2.Controls.Add(cell2);


                    TableCell cell3 = new TableCell();
                    Label rate = new Label();
                    rate.Text = "<img src='img/rs.png' width='8' height='10'><del>" + rd[3].ToString() + "</del>";
                    rate.Attributes.Add("style", "font-size: 16px;margin-left: 12px;vertical-align: middle;color: #878787;");
                    cell3.Controls.Add(rate);
                    row2.Controls.Add(cell3);

                    TableCell cell4 = new TableCell();
                    Label rateper = new Label();
                    rateper.Text = "&nbsp;" + rd[9].ToString();
                    rateper.Attributes.Add("style", "margin-left: 12px;font-size: 16px;font-weight: 500;color: #388e3c;vertical-align: middle;");
                    cell4.Controls.Add(rateper);
                    row2.Controls.Add(cell4);

                    //new table for attrib

                    Table attribtbl = new Table();
                    attribtbl.CssClass = "table table-bordered";
                    product_gen_detail.Controls.Add(attribtbl);

                    TableRow row1;

                    //adding qnty dropdown 
                    row1 = new TableRow();

                    TextBox qntylbl = new TextBox();
                    qntylbl.ID = "ProductQntylbl";
                    qntylbl.Text = "Quantity";
                    qntylbl.Attributes.Add("readonly", "readonly");
                    qntylbl.Attributes.Add("style", "border:none");
                    TableCell cell = new TableCell();
                    cell.Controls.Add(qntylbl);
                    row1.Cells.Add(cell);



                    DropDownList qtydropdown = new DropDownList();
                    qtydropdown.Items.Add("Select");
                    qtydropdown.ID = "ProductQnty";
                    qtydropdown.CssClass = "validate";
                    int maxqnty = Convert.ToInt32(rd["maxQty"].ToString());

                    for (int k = 1; k <= maxqnty; k++)
                    {
                        qtydropdown.Items.Add(k.ToString());
                    }

                    cell = new TableCell();
                    cell.Controls.Add(qtydropdown);
                    row1.Cells.Add(cell);
                    attribtbl.Controls.Add(row1);

                    //finding  arrib type name
                    OleDbCommand cmdd = new OleDbCommand("select distinct attrib.id,aname from attrib,product_attrib where attrib.id=product_attrib.attribid and pid=@id", cn);
                    cmdd.Parameters.Add("@id", Request.QueryString["pid"].ToString());
                    OleDbDataAdapter da = new OleDbDataAdapter(cmdd);

                    DataSet ds = new DataSet();
                    da.Fill(ds, "2 tbl");

                    ViewState["viewStateOfAttribCount"] = ds.Tables[0].Rows.Count;

                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        row1 = new TableRow();
                        ViewState["Attrib_id_" + i] = ds.Tables[0].Rows[i][0].ToString();
                        TextBox title_lbl = new TextBox();
                        title_lbl.ID = "AttribDynamicName_" + i;
                        title_lbl.Text = ds.Tables[0].Rows[i][1].ToString();
                        title_lbl.Attributes.Add("readonly", "readonly");
                        title_lbl.Attributes.Add("style", "border:none");
                        cell = new TableCell();
                        cell.Controls.Add(title_lbl);
                        row1.Cells.Add(cell);

                        cell = new TableCell();
                        //finding atrib detail 
                        OleDbCommand cmd3 = new OleDbCommand("select adetail from attrib,product_attrib where attrib.id=product_attrib.attribid and pid=@id and aname='" + ds.Tables[0].Rows[i][1] + "'", cn);
                        cmd3.Parameters.Add("@id", Request.QueryString["pid"].ToString());
                        OleDbDataAdapter da1 = new OleDbDataAdapter(cmd3);
                        da1.Fill(ds, "tbl 2");

                        DropDownList attriblist_ddl = new DropDownList();
                        attriblist_ddl.Items.Add("Select");
                        attriblist_ddl.CssClass = "validate";
                        attriblist_ddl.ID = "AttribDynamicDropdown_" + i;


                        for (int j = 0; j < ds.Tables[1].Rows.Count; j++)
                        {
                            attriblist_ddl.Items.Add(ds.Tables[1].Rows[j][0].ToString());
                        }
                        cell.Controls.Add(attriblist_ddl);
                        row1.Cells.Add(cell);
                        attribtbl.Controls.Add(row1);
                        ds.Tables[1].Clear();
                    }
                }
                else
                {
                    Response.Redirect("home.aspx");
                }
            }
            else
            {
                Response.Redirect("home.aspx");
            }
            
                  
        }

        protected void buynowbtn_Click(object sender, EventArgs e)
        {
            if (Session["userid"] != null) //logged in
            {
                if (!string.IsNullOrEmpty(Request.QueryString["pid"]))
                {
                    Session["sessionOfattribTotal"] = ViewState["viewStateOfAttribCount"].ToString();
                    Session["sessionOfProductQnty"] = Request.Form["ProductQnty"];
                    int totalcontrol= Convert.ToInt32( ViewState["viewStateOfAttribCount"].ToString());
                    for (int i = 0; i < totalcontrol; i++)
                    {
                        Session["sessionOfAttrib_id_" + i] = ViewState["Attrib_id_" + i].ToString();
                        Session["sessionOfAttribDynamicDropdown_" + i] = Request.Form["AttribDynamicDropdown_" + i].ToString();
                    }
                    Session["productid"]=Request.QueryString["pid"].ToString();
                    Response.Redirect("BuyingPageStepByStep.aspx");
                }
            }
            else 
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Login')", true);
            }
        }

        protected void logout_btn_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("home.aspx");
        }
        
    }
}
