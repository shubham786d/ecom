<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product_page.aspx.cs" Inherits="ecom.product_page1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <!-- bootstrap file -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- nav css-->
    <link href="css/navbar.css" rel="stylesheet" />
    <title>Untitled Page</title>
    <style>
        .cartbtn
        {
            font-family: Roboto,Arial,sans-serif;
            letter-spacing: 0;
            padding: 18px 8px;
            box-shadow: 0 1px 2px 0 rgba(0,0,0,.2);
            width: 100%;
            border-radius: 2px;
            border: none;
            float: left;
            background: #ff9f00;
            color: #fff;
        }
    </style>

    <script>
     function validate_allDD()
            { 
            var state=1;
            
             $(".validate").each( function(){
                  if($(this).val()=="Select")
                  {
                  alert("Please Select All Options");
                  state=0;
                  return false;
                  }
                });

          if(state==0)
           {
           return false;
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
            <div class="row">
                <div class="col-sm-6" style="border: dottedhttp://www.menucool.com/ 2px black">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                            <li data-target="#myCarousel" data-slide-to="3"></li>
                        </ol>
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner " role="listbox">
                            <div id="pro_img_1" runat=server class="item active">
                                <img src="images/slideshow/dance.jpg" alt="Chania">
                            </div>
                            <div id="pro_img_2" runat=server class="item">
                                <img src="images/slideshow/dance_girls.jpg" alt="Chania">
                            </div>
                            <div id="pro_img_3" runat=server class="item">
                                <img src="images/slideshow/fashion2.jpg" alt="Flower">
                            </div>
                            <div id="pro_img_4" runat=server class="item">
                                <img src="images/slideshow/fashion2.jpg" alt="Flower">
                            </div>
                        </div>
                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">
                                Previous</span> </a><a class="right carousel-control" href="#myCarousel" role="button"
                                    data-slide="next"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true">
                                    </span><span class="sr-only">Next</span> </a>
                    </div>
                    
                    <div id="row">
                        <asp:LinkButton ID="LinkButton2"   runat=server CssClass="btn cartbtn" ><span aria-hidden="true" class="glyphicon glyphicon-shopping-cart"></span>&nbsp;ADD TO CART</asp:LinkButton>
                        <asp:LinkButton ID="buynowbtn"   
                            runat=server  style="background: #fb641b;"  CssClass="btn cartbtn " 
                             OnClientClick="return validate_allDD()" onclick="buynowbtn_Click" ><span aria-hidden="true" class="glyphicon glyphicon-briefcase"></span>&nbsp;BUY NOW</asp:LinkButton>
                        
                    </div>
                </div> 
                <div  style="" class="col-sm-6">
                   <div id="product_gen_detail" runat="server">
                   
                   </div>
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
