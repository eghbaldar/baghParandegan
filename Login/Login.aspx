<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Presentation_Modules_Login_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="../Content/CSS/Login/login.css" type="text/css" rel="stylesheet" />
        <style type="text/css">
            .style1
            {
                width: 100%;
            }
            .style2
            {
                width: 202px;
            }
            .style3
            {
                color: #FFFFFF;
            }
            .style4
            {
                text-decoration: none;
            }
            .style5
            {
                color: #CCCCCC;
            }
            .style6
            {
                text-align: center;
            }
        </style>
</head>
	<form id="form1" runat="server">
	<div id="body">
    	<div id="center">
                    <table id="Table_01" width="342" height="211" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                    <td>
                    <img src="../Content/Images/Login/images/login_01.jpg" width="88" height="211" alt=""></td>
                    <td>
                    <img src="../Content/Images/Login/images/login_02.jpg" width="83" height="211" alt=""></td>
                    <td>
                    <img src="../Content/Images/Login/images/login_03.jpg" width="79" height="211" alt=""></td>
                    <td>
                    <img src="../Content/Images/Login/images/login_04.jpg" width="92" height="211" alt=""></td>
                    </tr>
                    </table>
            <div id="title"></div>
            <div id="content">
                <asp:Login ID="Login1" runat="server" Height="103px" Width="314px" 
                    FailureText="شما در ورود نا موفق بوده اید دوباره تلاش کنید"  
                    DestinationPageUrl="~/Presentation/ManagerWebsite.aspx">
                    
                    <LayoutTemplate>
                        <table border="0" cellpadding="1" cellspacing="0" 
                            style="border-collapse:collapse;">
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0" 
                                        style="height:103px;width:314px; font-family: Tahoma; font-size: 11px;">
                                        <tr>
                                            <td align="right">
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                    ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                    ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <table class="style1">
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="UserName" runat="server" Width="210px"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" 
                                                                style="color: #FFFFFF">:نام کاربری</asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                    ControlToValidate="Password" ErrorMessage="Password is required." 
                                                    ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <table class="style1">
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="210px"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" 
                                                                style="color: #FFFFFF">:کلمه عبور</asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table class="style1">
                                                    <tr>
                                                        <td class="style2">
                                                            &nbsp;</td>
                                                        <td>
                                                            <asp:CheckBox ID="RememberMe" runat="server" style="color: #FFFFFF" 
                                                                Text="یادآوری در آینده" />
                                                        </td>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="color:Red;">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="ورود" 
                                                    ValidationGroup="Login1"  />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style6" colspan="2">
                                                <br />
                                                <span class="style5">&nbsp;Copyright 2011 by</span><span class="style3">
                                                <a class="style4" href="http://CaspianTeam.com"><span class="style3">CaspianTeam.com</span></a></span></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:Login>
            </div>
            <div id="footer"></div>
        </div>
    </div>
<body>
        </form>
</body>
</html>

