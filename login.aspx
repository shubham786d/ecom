<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ecom.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <!-- bootstrap file -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
   
    <div>
        <div class="container">
            <div class="form-group">
                <label for="emailid">
                    Email:</label>
                
                <asp:TextBox class="form-control" ID="emailid" placeholder="Enter email"  runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="pwd">
                    Password:</label>
                
                <asp:TextBox  TextMode=Password class="form-control"  ID="pwd" placeholder="Enter password" runat="server"></asp:TextBox>
            </div>
            
            <asp:Button  runat="server" class="btn form-control" id="loginbtn" style="background: #fb641b;
                color: #fff; font-size: 15px;" Text="Login" onclick="loginbtn_Click" />
        </div>
    </div>
    </form>
</body>
</html>
