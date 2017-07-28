<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="ecom.signup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <!-- bootstrap file -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">function signbtn_onclick() {

}

</script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="container">
            <div class="form-group">
                <label for="email">
                    Your Name:</label>
                <input runat=server type="Text" class="form-control" id="name" placeholder="Enter Name">
            </div>
            <div class="form-group">
                <label for="email">
                    Email:</label>
                <input runat=server type="Text" class="form-control" id="email" placeholder="Enter email">
            </div>
            <div class="form-group">
                <label for="pwd">
                    Mobile no:</label>
                <input  runat=server type="password" class="form-control" id="mobileno" placeholder="Enter Mobile no">
            </div>
            <div class="form-group">
                <label for="pwd">
                    Password:</label>
                <input runat=server type="password" class="form-control" id="pwd" placeholder="Enter password">
            </div>
            <asp:Button class="btn form-control" id="signbtn" 
                style="background: #fb641b;color: #fff;font-size: 15px;"  Text="Sign Up" 
                runat=server onclick="signbtn_Click"/>
        </div>
        <br />
    </div>
    </form>
</body>
</html>
