<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Myorders.aspx.cs" Inherits="ecom.Myorders" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    
    <!-- bootstrap file -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- nav css-->
    <link href="css/navbar.css" rel="stylesheet" />
    
    <style>
    body
        {
            background-color: #f3f3f3;
        }
        .box
        {
            background-color: #fff;
            border-radius: 2px;
            box-shadow: 0 2px 4px 0 rgba(0,0,0,.08);
            margin: 10px;
            clear: both;
            width: 100%;
            display: inline-flex;
        }
    </style>
    
    <script>
    
                function redirect() 
                {
                    window.location="search.aspx?src="+document.getElementById("src_txt").value;
                }
    </script>
</head>
<body>
    
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse " style="margin-bottom: 10px; color: white">
		      
                    <div class="navbar-header">			      
			              <a class="" href="/home.aspx"><img class=".img-responsive" src="img/logo.png" style="width:150px;padding-top:10px" ></img></a>
        			      <ul class="nav nav-pills navbar-right " style="display: inline-table" >
							
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
                               <asp:LinkButton  ID="src_btn"  runat=server   href="javascript:redirect();"  style="vertical-align: inherit;" CssClass="btn btn-default " ><span style="line-height: inherit;" aria-hidden="true" class="glyphicon glyphicon-search"></span></asp:LinkButton>
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

        <div id="outerDiv" runat=server style="margin: 0 5%;" >
            
        </div>
    </form>
</body>
</html>
