<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="ecom.product_page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
    <!-- nav css-->
    <link href="css/navbar.css" rel="stylesheet" />

    <title>Untitled Page</title>
    <style>
    .disprice
    {
    font-size: 16px;
    font-weight: 500;
    color: #212121;
    }
    
    
     body
        {
            background-color: #f3f3f3;
        }
        .box
        {
            background-color: #fff;
            border-radius: 1px;
            box-shadow: 0 2px 4px 0 rgba(0,0,0,.08);
            margin-bottom:5px;
        }
        .box:hover
        {
        	box-shadow: 3px 3px 16px 3px rgba(0,0,0,.50);
        	
        }
    </style>
    <script>
                function redirect(id) 
                            {
                                window.location="product_page.aspx?pid="+id;
                            }
                
                function selfredirect() 
                {
                    window.location="search.aspx?src="+document.getElementById("src_txt").value;
                }
                
                function pricebtnclick()
                {
                    if(document.getElementById("src_txt").value!="" && document.getElementById("mintxt").value!="" && document.getElementById("maxtxt").value!="" && (document.getElementById("mintxt").value<document.getElementById("maxtxt").value))
                    {
                     window.location="search.aspx?src="+document.getElementById("src_txt").value+"&min="+document.getElementById("mintxt").value+"&max="+document.getElementById("maxtxt").value;
                    }
                }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <!--MODAL-->
            <cc1:ModalPopupExtender ID="btn_ModalPopupExtender" runat="server" TargetControlID="login_btn"
                BehaviorID="modalBehavior" Drag="true" PopupControlID="Panel1">
            </cc1:ModalPopupExtender>
            <div id="Panel1" style="display: none; width: 50%; margin: auto; height: auto" class="ModalPopupBG">
                <div>
                    <div id="modalhead" style="background-color: #2874f0; color: #fff; font-size: 15px;">
                        <p style="margin-left: 5px">
                            LogIn</p>
                    </div>
                    <div style="background-color: white; margin: auto;">
                        <iframe class="embed-responsive-item" id="frameeditexpanse" frameborder="0" src="login.aspx"
                            width="50%" height="300px" scrolling="no"></iframe>
                    </div>
                    <div class="popup_Buttons" style="">
                        <hr />
                        <input id="btnCancel" value="Cancel" type="button" onclick="hidemodal();" />
                    </div>
                </div>
            </div>
            <style>
                #modalhead
                {
                    background-color: #C2C2C2;
                    border: solid black 1px;
                    font-weight: bold;
                }
                .ModalPopupBG
                {
                    background-color: #FFFFFF;
                    border: solid black 1px;
                    width: 700px;
                    height: 500px;
                }
                .popup_Buttons
                {
                    margin: 10px;
                }
            </style>

            <script>
                   function hidemodal()
                    {

                        $find("modalBehavior").hide();
                        location.reload();
                    }
                    
            </script>

            <!--MODAL-->
            <nav class="navbar navbar-inverse " style="margin-bottom: 10px; color: white">
		      
                    <div class="navbar-header">			      
			              <a class="" href="/home.aspx"><img class=".img-responsive" src="img/logo.png" style="width:150px;padding-top:10px" ></img></a>
        			      <ul class="nav nav-pills navbar-right " style="display: inline-table" >
							<li ID="login_btn" runat="server"><a  href="#"><asp:Label  runat=server ID='asd' Text="Log In"></asp:Label></a></li>
							<li ID="signup_btn" runat="server"><a  href="#"><asp:Label  runat=server ID='Label1' Text="Signup"></asp:Label></a></li>
							<li ID="User_menu" runat="server">
                                      <div class="dropdown">
                                      <a style="  text-decoration:none;" href="#" class="" data-toggle="dropdown"><asp:Label  runat=server ID='User_menu_name' Text="">
							          </asp:Label></a>
                                      <span class="caret" style=" margin-right:15px;"></span></button>
                                      <ul class="dropdown-menu">
                                        <li><a href="/Myorders.aspx">My orders</a></li>
                                        <li><a href="#">CSS</a></li>
                                        <li><a href="#"><asp:Button ID="logout_btn" runat="server" Text="Log out" 
                                                onclick="logout_btn_Click"></asp:Button></li>
                                      </ul>
                                    </div>
							     
							</li>
						  </ul>
						  
			              <div style="padding:20px;" class="input-group text-center">
                            <input runat="server" id="src_txt" type="text" class="form-control" placeholder="Search for Products, Brands and More">
                            <div class="input-group-btn ">
                               <asp:LinkButton  ID="src_btn"  runat=server   href="javascript:selfredirect();"  style="vertical-align: inherit;" CssClass="btn btn-default " ><span style="line-height: inherit;" aria-hidden="true" class="glyphicon glyphicon-search"></span></asp:LinkButton>
                              <asp:LinkButton ID="LinkButton1"   runat=server   CssClass="btn btn btn-info " ><span aria-hidden="true" class="glyphicon glyphicon-shopping-cart"></span>Cart</asp:LinkButton>
                            </div>
                          </div>
                          
			              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar2">
				            MENU
				            <span class="glyphicon glyphicon-menu-hamburger"></span>
				            
			              </button> 
			            </div>
			           
			         <div class="collapse navbar-collapse" id="myNavbar2">
				        <ul class="nav navbar-nav " style="font-size: 13px;">
					        <li class="active" ><a href="#">Home</a></li>
					        <li class="active" ><a href="#">Electronics</a></li>
					        <li class="active" ><a href="#">Appliances</a></li>
					        <li class="active" ><a href="#">Men</a></li>
					        <li class="active" ><a href="#">Women</a></li>
					        <li class="active" ><a href="#">Baby & Kids</a></li>
					        <li class="active" ><a href="#">Home & Furniture</a></li>
					        <li class="active" ><a href="#">Books & More</a></li>
				        </ul>
			         </div>
		    </nav>		    
		   <div  class="row" >
		        <div   class="col-sm-3 box">
		            <p>Price</p>
		            <span>Min:</span>
                    <input id="mintxt" type="text" />
                    <span>Max:</span>
                    <input id="maxtxt" type="text" />
                    <input id="pricebtn" type="button" value="Search" onclick="pricebtnclick()" />
		        </div>
		        
		        <div  id="product_list" runat=server  class="col-sm-9">
		            
		        </div>
		   </div>
		   <div class="footer" style="background-color: black;color:White;" id="footer">
                
                <div class="row">
                    <div class="col-sm-9" style="text-align: center;padding: 20px;">
                        <span>Returns Policy | Terms of use | Security | Privacy | Infringement © 2007-2020</span>
                    </div>
                    <div class="col-sm-3" style="padding: 10px;">
                        <img src="img\socialicon\fb.png" width="31px" height="31px"/>
                        <img src="img\socialicon\twt.png" width="31px" height="31px"/>
                        <img src="img\socialicon\g+.png" width="31px" height="31px"/>
                        <img src="img\socialicon\yt.png" width="31px" height="31px"/>
                    </div>
                </div>
               
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
