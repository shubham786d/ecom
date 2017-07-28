<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ecom._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <!-- bootstrap file -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- bxSlider Javascript file -->

    <script src="js/jquery.bxslider.min.js"></script>

    <!-- bxSlider CSS file -->
    <link href="css/jquery.bxslider.css" rel="stylesheet" />

    <script>
    $(document).ready(
					function()
					{
						$('.bxslider').bxSlider({
							auto: true,
							adaptiveHeight: true,
							
							pager:false
							});
					}
					
					
				);
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Button" />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Button" />
        <div id="slider">
            <ul id="slide" class="bxslider" runat="server">
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
    </div>
    </form>
</body>
</html>
