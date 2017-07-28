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
    public partial class BuyingPageStepByStep : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //Response.Write(Session["productid"].ToString()+"adasdasd");

            if (Session["userid"] != null) //logged in
            {

                if (Session["productid"] != null) //coming for buynow
                {
                    ViewState["productid"] = Session["productid"].ToString();
                    Session.Remove("productid");

                    ViewState["ProductQnty"] = Session["sessionOfProductQnty"].ToString();
                    Session.Remove("ProductQnty");

                    if (Session["sessionOfattribTotal"] != null) //product page attrib total
                    {

                        ViewState["viewStateOfAttribCount"] = Session["sessionOfattribTotal"].ToString();
                        int totalcontrol = Convert.ToInt32(ViewState["viewStateOfAttribCount"].ToString());
                        Session.Remove("sessionOfattribTotal");

                        for (int i = 0; i < totalcontrol; i++) //converting all session of previos page to view state
                        {
                            ViewState["Attrib_id_" + i] = Session["sessionOfAttrib_id_" + i].ToString();
                            ViewState["AttribDynamicDropdown_" + i] = Session["sessionOfAttribDynamicDropdown_" + i].ToString();
                            Session.Remove("sessionOfAttrib_id_" + i);
                            Session.Remove("sessionOfAttribDynamicDropdown_" + i);
                            Response.Write(ViewState["Attrib_id_" + i].ToString() + " ");
                            Response.Write(ViewState["AttribDynamicDropdown_" + i] + "<br>");
                        }
                    }
                }
                OleDbConnection cn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("database.accdb") + ";");

                cn.Open();
                   
                if (!IsPostBack)
                {
                    paymentMetodRadioList.SelectedIndex = 0;
                    OleDbCommand cmd = new OleDbCommand("select * from  userAddress where aid=(select addressid from usertable where ID=" + Session["userid"].ToString() + " )", cn);
                    OleDbDataReader rd = cmd.ExecuteReader();

                    if (rd.HasRows)
                    {
                        rd.Read();
                        ViewState["addressid"] = rd[0].ToString();
                        nametxt.Text = rd[1].ToString();
                        mobnotxt.Text = rd[2].ToString();
                        pincodetxt.Text = rd[3].ToString();
                        Addresstxt.Text = rd[4].ToString();
                    }
                    rd.Close();
                }
                OleDbCommand cmd2;
                OleDbDataReader rd2;

                if (ViewState["productid"] != null)
                {

                    cmd2 = new OleDbCommand("select pname,rate,discountrate,imglink1,discountRatePercent,Deliverycost,Deliverytime from products where pid=" + ViewState["productid"].ToString(), cn);
                    rd2 = cmd2.ExecuteReader();

                    Table tbl = new Table();
                    tbl.CssClass = "table table-hover";
                    TableHeaderRow headrow = new TableHeaderRow();
                    Label headlvl;

                    TableHeaderCell headcell=new TableHeaderCell();
                    headlvl = new Label();
                    headlvl.Text = "ITEM";
                    headcell.Controls.Add(headlvl);
                    headrow.Controls.Add(headcell);


                    headcell = new TableHeaderCell();
                    headlvl = new Label();
                    headlvl.Text = "ITEM NAME";
                    headcell.Controls.Add(headlvl);
                    headrow.Controls.Add(headcell);

                    headcell = new TableHeaderCell();
                    headlvl = new Label();
                    headlvl.Text = "QTY";
                    headcell.Controls.Add(headlvl);
                    headrow.Controls.Add(headcell);

                    headcell = new TableHeaderCell();
                    headlvl = new Label();
                    headlvl.Text = "PRICE";
                    headcell.Controls.Add(headlvl);
                    headrow.Controls.Add(headcell);

                    headcell = new TableHeaderCell();
                    headlvl = new Label();
                    headlvl.Text = "DELIVERY DETAILS";
                    headcell.Controls.Add(headlvl);
                    headrow.Controls.Add(headcell);

                    headcell = new TableHeaderCell();
                    headlvl = new Label();
                    headlvl.Text = "SUBTOTAL";
                    headcell.Controls.Add(headlvl);
                    headrow.Controls.Add(headcell);

                    tbl.Controls.Add(headrow);


                    orderSumPage.Controls.Add(tbl);
                    TableRow row;
                    TableCell cell;
                    Image img;
                    Label lbl;
                    TextBox txtbox ;
                    if (rd2.Read())
                    {
                        row = new TableRow();
                        //image
                        cell = new TableCell();
                        img = new Image();
                        img.ImageUrl = rd2[3].ToString();
                        img.Attributes.Add("style", "max-width: 60px;,max-height: 60px;");

                        cell.Controls.Add(img);
                        row.Controls.Add(cell);
                        //name
                        cell = new TableCell();
                        lbl = new Label();
                        lbl.Text = rd2[0].ToString();

                        cell.Controls.Add(lbl);
                        row.Controls.Add(cell);
                        //qnty
                        cell = new TableCell();
                        txtbox = new TextBox();
                        txtbox.Text = ViewState["ProductQnty"].ToString();
                        txtbox.Attributes.Add("readonly", "readonly");
                        txtbox.Attributes.Add("style", "width: 22px;");

                        cell.Controls.Add(txtbox);
                        row.Controls.Add(cell);

                        //Price
                        cell = new TableCell();
                        lbl = new Label();
                        lbl.Text = "<img src='img/rs.png' width='8' height='10'>"+rd2[2].ToString();

                        cell.Controls.Add(lbl);
                        row.Controls.Add(cell);

                        //DELIVERY DETAILS
                        cell = new TableCell();
                        lbl = new Label();
                        int deliverycost;
                        if (Convert.ToInt16(rd2[5].ToString()) == 0)
                        {
                            deliverycost = 0;
                            lbl.Text = " FREE Delivery with in " + rd2[6].ToString() + " Days";
                        }
                        else
                        {
                            deliverycost = Convert.ToInt16(rd2[5].ToString());
                            lbl.Text = "<img src='img/rs.png' width='8' height='10'>" + rd2[5].ToString() + " Delivery with in " + rd2[6].ToString() + " Days";
                        }
                        cell.Controls.Add(lbl);
                        row.Controls.Add(cell);

                        //SubTotal
                        cell = new TableCell();
                        lbl = new Label();
                        ulong qnty =  Convert.ToUInt64(ViewState["ProductQnty"].ToString());
                        ulong subtotal = qnty * Convert.ToUInt64(rd2[2].ToString());
                        subtotal = subtotal+Convert.ToUInt64(deliverycost);
                        lbl.Text = "<img src='img/rs.png' width='8' height='10'>" + subtotal.ToString();

                        cell.Controls.Add(lbl);
                        row.Controls.Add(cell);

                        tbl.Controls.Add(row);
                        
                        //Total amount
                        lbl = new Label();
                        lbl.Text = "Amount Payable: <i style='font-size: 20px;color: #54a442'>  RS." + subtotal + "</i>";
                        totalAmountDiv.Controls.Add(lbl);
                    }
                }
                else if (false) //cart
                { 
                
                }
                
            }
            else
            {
                Session.RemoveAll();
                Response.Redirect("home.aspx");
                
            }

        }

        protected void page1_conti_btn_Click(object sender, EventArgs e)
        {
            //if (paymentMetodRadioList.SelectedItem != null)
            //{
            //    if (paymentMetodRadioList.SelectedItem.Text == "Cash on Delivery (COD).")
            //    {
            //        Session["PaymentMethod"] = "COD";
            //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "page1conticlick()", true);
                    
            //    }
                
            //}
        }

        protected void page2_conti_btn_Click(object sender, EventArgs e)
        {
            //updating address
            OleDbConnection cn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("database.accdb") + ";");

            cn.Open();

            OleDbCommand cmd = new OleDbCommand("UPDATE userAddress SET Fullname=@name ,Mobilenumber=@mobno ,Pincode=@pinno ,Address=@add  where aid=" + ViewState["addressid"].ToString(), cn);
            cmd.Parameters.Add("@name", nametxt.Text);
            cmd.Parameters.Add("@mobno", mobnotxt.Text);
            cmd.Parameters.Add("@pinno", pincodetxt.Text);
            cmd.Parameters.Add("@add", Addresstxt.Text);
            cmd.ExecuteNonQuery();
            
            
            
            // Doing order
            
            int orderid;
            
            //finding max order id 
            cmd = new OleDbCommand("select max(orderid) from orders", cn);
            OleDbDataReader rd = cmd.ExecuteReader();
            rd.Read();
            if (String.IsNullOrEmpty(rd[0].ToString()))
            {
                orderid = 1;
            }
            else
            {
                orderid = Convert.ToInt16(rd[0].ToString()) + 1;
            }
            rd.Close();



            string productRate="";
            string Deliverycost="";
            string totalamount="";
            int maxqnty=0;

            
            if (ViewState["productid"] != null) // coming from BUY NOW
            {
                cmd = new OleDbCommand("select discountrate,Deliverycost,maxQty from products where pID=" + ViewState["productid"].ToString(), cn);
                rd = cmd.ExecuteReader();

                if (rd.Read())
                {
                    productRate = rd[0].ToString();
                    Deliverycost = rd[1].ToString();
                    maxqnty = Convert.ToInt16(rd[2].ToString());

                    totalamount = (( Convert.ToInt16(ViewState["ProductQnty"].ToString())* Convert.ToInt16(productRate)) + Convert.ToInt16(Deliverycost)).ToString();
                    
                }
                rd.Close();


                //insert new order in table
                cmd = new OleDbCommand("insert into orders values(" + orderid + "," + Session["userid"].ToString() + ",'" + Deliverycost + "','" + totalamount+"')", cn);
                cmd.ExecuteNonQuery();

                //insert new order detail
                cmd = new OleDbCommand("select max(productAttribid) from orderDetail", cn);
                rd = cmd.ExecuteReader();
                
                
                int productAttribid;
                rd.Read();
                if (String.IsNullOrEmpty(rd[0].ToString()))
                {
                    productAttribid = 1;
                }
                else
                {
                    productAttribid = Convert.ToInt16(rd[0].ToString()) + 1;
                }
                rd.Close();

                cmd = new OleDbCommand("insert into orderDetail values(" + orderid + "," + ViewState["productid"].ToString() + "," + productAttribid + ",'" + productRate + "')", cn);
                cmd.ExecuteNonQuery();
                
                //insert in orderproductattrib
                int totalcontrol = Convert.ToInt32(ViewState["viewStateOfAttribCount"].ToString());
                
                for(int i=0;i<totalcontrol;i++)
                {
                cmd = new OleDbCommand("insert into orderProductAttrib values("+productAttribid + "," + ViewState["Attrib_id_" + i].ToString() + ",'"+ViewState["AttribDynamicDropdown_" + i].ToString() +"')", cn);
                cmd.ExecuteNonQuery();
                }

                Response.Redirect("orderDone.aspx");
            }

           // Response.Write(ViewState["ProductQnty"].ToString() + "adsdas " + orderid + " " + productAttribid + productRate);
        }
    }
}
