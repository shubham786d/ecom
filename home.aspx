<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="ecom.home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E cart</title>
    <!-- bootstrap file -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="js\jquery\jquery-3.2.1.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- bxSlider Javascript file -->

    <script src="js/jquery.bxslider.min.js"></script>

    <!-- bxSlider CSS file -->
    <link href="css/jquery.bxslider.css" rel="stylesheet" />
    <!-- nav css-->
    <link href="css/navbar.css" rel="stylesheet" />

    <script>
             $(window).on('load',
					function()
					{
						$('.topslider').bxSlider({
							auto: true,
							adaptiveHeight: true,
							
							pager:false
							});
							
						$('.dealslider').bxSlider({
						
						    slideWidth: 200,
						    pager:false,
						    minSlides: 2,
                            maxSlides: 3,
                            moveSlides: 1,
                            slideMargin: 10,
                            adaptiveHeight: true
						});
					}
					
					
				);
				
				$(window).on('load',function() {
                    $(".loader").fadeOut("slow");
                })
                
                function redirect() 
                {
                    window.location="search.aspx?src="+document.getElementById("src_txt").value;
                }
    </script>

    <style>
        body
        {
            background-color: #f3f3f3;
            font-family: Roboto,Arial,sans-serif;
            letter-spacing: 0;
            overflow-x: hidden;
        }
        .dealname
        {
            font-size: 30px;
            line-height: 1.38;
            font-weight: 400;
            text-align: center;
            display: block
        }
        .dealbox
        {
            background-color: #fff;
            border-radius: 2px;
            box-shadow: 0 2px 4px 0 rgba(0,0,0,.08);
            margin: 10px;
            clear: both;
            width: 100%;
            display: inline-flex;
        }
        .viewallbtn
        {
            background: #2874f0;
            color: #fff;
            box-shadow: 0 2px 4px 0 rgba(0,0,0,.2);
            border: none;
            margin: 10% auto;
            display: block;
            border-radius: 2px;
            padding: 10px 20px;
            font-size: 13px;
            font-weight: 500;
            transition: box-shadow .2s ease;
            vertical-align: super;
            cursor: pointer;
            outline: none;
            
        }
        
        .loader {
	        position: fixed;
	        left: 0px;
	        top: 0px;
	        width: 100%;
	        height: 100%;
	        z-index: 9999;
	        background: url('img/Preloader_3.gif') 50% 50% no-repeat rgb(249,249,249);
        }
    </style>
</head>
<body>
    <div class="loader"></div>
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
                            width="100%" height="300px" scrolling="no"></iframe>
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
			              <a class="" href="#"><img class=".img-responsive" src="img/logo.png" style="width:150px;padding-top:10px" ></img></a>
        			      <ul class="nav nav-pills navbar-right " style="display: inline-table" >
							<li ID="login_btn" runat="server"><a  href="#"><asp:Label  runat=server ID='asd' Text="Log In"></asp:Label></a></li>
							<li ID="signup_btn" runat="server"><a  href="#"><asp:Label  runat=server ID='Label1' Text="Signup"></asp:Label></a></li>
							
						  </ul>
						  <li ID="User_menu"  style=" list-style:none" class="navbar-right" runat="server">
                                      <div class="dropdown">
                                      <a style="  text-decoration:none;" href="#" class="" data-toggle="dropdown"><asp:Label  runat=server ID='User_menu_name' Text="">
							          </asp:Label>
                                      <span class="caret" style=" margin-right:15px;"></span></a></button>
                                      <ul class="dropdown-menu">
                                        <li><a href="/Myorders.aspx">My orders</a></li>
                                        <li><a href="#">CSS</a></li>
                                        <li><a href="#"><asp:Button ID="logout_btn" runat="server" Text="Log out" 
                                                onclick="logout_btn_Click"></asp:Button></li>
                                      </ul>
                                    </div>  
							</li>
			              <div style="padding:20px;" class="input-group text-center">
                            <input runat="server" id="src_txt" type="text" class="form-control" placeholder="Search for Products, Brands and More">
                            <div class="input-group-btn ">
                               <asp:LinkButton  ID="src_btn"  runat=server   href="javascript:redirect();"  style="vertical-align: inherit;" CssClass="btn btn-default " ><span style="line-height: inherit;" aria-hidden="true" class="glyphicon glyphicon-search"></span></asp:LinkButton>
                              <asp:LinkButton  ID="LinkButton1"   runat=server  href="#" CssClass="btn btn btn-info " ><span aria-hidden="true" class="glyphicon glyphicon-shopping-cart"></span>Cart</asp:LinkButton>
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
            <div class="row">
                <ul class="topslider">
                    <li>
                        <img src="img\home banner\ (1).jpg" /></li>
                    <li>
                        <img src="img\home banner\ (2).jpg" /></li>
                    <li>
                        <img src="img\home banner\ (3).jpg" /></li>
                    <li>
                        <img src="img\home banner\(4).jpg" /></li>
                    <li>
                        <img src="img\home banner\ (5).jpg" /></li>
                </ul>
            </div>
            <div runat="server" id="dealdiv">
            </div>
            <div class="footer" style="background-color: black; color: White;" id="footer">
                <div class="row">
                    <div class="col-sm-9" style="text-align: center; padding: 20px;">
                        <span><b>Created By:Shubham Dwivedi</b> |  Returns Policy | Terms of use | Security | Privacy | Infringement © 2007-2020</span>
                    </div>
                    <div class="col-sm-3" style="padding: 10px;">
                        <img src="img\socialicon\fb.png" width="31px" height="31px" />
                        <img src="img\socialicon\twt.png" width="31px" height="31px" />
                        <img src="img\socialicon\g+.png" width="31px" height="31px" />
                        <img src="img\socialicon\yt.png" width="31px" height="31px" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
