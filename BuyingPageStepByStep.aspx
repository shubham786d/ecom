<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyingPageStepByStep.aspx.cs"
    Inherits="ecom.BuyingPageStepByStep" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <!-- bootstrap file -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
        .heading
        {
            width:100%;
            font-size: 18px;
            padding: 11px 20px 11px 25px;
            margin: 0 0 0 0;
            color: #fff;
            background-color: #16b594;
        }
        .box
        {
            padding: 25px;
            background-color: White;
            margin-left: 8px;
            margin-right: 8px;
        }
        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th
        {
            vertical-align: middle;
        }
    </style>

    <script>
            function validate()
            {
    	        if($("#nametxt").val()!="" && $("#mobnotxt").val()!="" && $("#pincodetxt").val()!="" && $("#Addresstxt").val()!="")
    	        {
    	            if($("#mobnotxt").val().replace(/ /g,'').length==10)
    	            {
    	              if($("#pincodetxt").val().replace(/ /g,'').length==6)
    	              {
    	                return true;
    	              }
    	              else
    	              {
    	              alert("Pincode must be of 6 digits");
    	              return false;
    	              }
    	            
    	            }
    	            else
    	            {
    	            alert("Mobile Number must be of 10 digits");
    	            return false;
    	            }
    	        }
    	        else
    	        {
    	            alert("Please Fill All Delivery Detail");
    	            return false;
    	        }
    	    }
    	    
    	    function checkNum(x) {

            var s_len = x.value.length;
            var s_charcode = 0;
            for (var s_i = 0; s_i < s_len; s_i++) {
                s_charcode = x.value.charCodeAt(s_i);
                if (!((s_charcode >= 48 && s_charcode <= 57) || s_charcode == 46)) {
                    alert("Only Numeric Values Allowed");
                    x.value = '';
                    x.focus();
                    return false;
                }
            }
            return true;
        }
    </script>

</head>
<body style="background: #ccc;">
    <form id="form1" runat="server">
    <!-- Payment Method -->
    <div id="paymentMethodDiv" runat="server">
        <h2 class="heading">
            <asp:Label ID="Label1" runat="server" Text="1. Payment Method"></asp:Label>
        </h2>
        <div class="row box">
            <div class="col-sm-8" style="border-radius: 4px; border: 1px #ddd solid; background-color: white;
                padding: 14px 18px;">
                <asp:RadioButtonList ID="paymentMetodRadioList" runat="server">
                    <asp:ListItem Text="Cash on Delivery (COD)." Value="1"></asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
    </div>
    <!-- Address -->
    <h2 class="heading">
        <asp:Label ID="Label2" runat="server" Text="2.DELIVERY ADDRESS"></asp:Label>
    </h2>
    <div id="addressDiv" runat="server">
        <div class="container-fluid box">
            <div class="form-group">
                <label for="nametxt">
                    Full name:</label>
                <asp:TextBox class="form-control" MaxLength=30 ID="nametxt" placeholder="Enter Full Name" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="mobnotxt">
                    Mobile number:</label>
                <asp:TextBox onchange='checkNum(this);'  MaxLength=10 class="form-control" ID="mobnotxt" placeholder="Enter Mobile Number"
                    runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="pincodetxt">
                    Pincode:</label>
                <asp:TextBox  onchange='checkNum(this);' class="form-control" ID="pincodetxt"  MaxLength=6 placeholder="Enter Pincode"
                    runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                Address<label for="Addresstxt">:</label>
                <asp:TextBox class="form-control" ID="Addresstxt" MaxLength="150" placeholder="Enter Address" runat="server"
                    TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>
    </div>
    <!-- ORDER SUMMARY -->
    <h2 class="heading">
        <asp:Label ID="Label3" runat="server" Text="3. ORDER SUMMARY"></asp:Label>
    </h2>
    <div runat="server" id="orderSumPage" class="container-fluid box">
    </div>
    <div class="container-fluid row box">
        <div class="col-sm-4">
            <asp:Button runat="server" class="btn form-control" ID="page2_conti_btn" Style="background: #fc8332;
                color: #fff; font-size: 15px;" Text="Confirm Order" OnClientClick="return validate()" OnClick="page2_conti_btn_Click" />
        </div>
        <div id="totalAmountDiv" class="col-sm-8" runat=server>
            
        </div>
    </div>
    </form>
</body>
</html>
