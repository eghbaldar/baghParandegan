<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ChangePicture.aspx.vb" Inherits="Presentation_Modules_Login_ChangePicture" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">

        .style2
        {
            width: 100%;
        }
        .style5
        {
            text-align: right;
            font-family: Tahoma;
            font-size: 11px;
        }
        .style16
        {
            text-align: right;
        }
        .style32
        {
            width: 315px;
            font-family: Tahoma;
            font-size: 11px;
            text-align: right;
        }
        .style33
        {
            width: 400px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:MultiView ID="M_picture" runat="server" ActiveViewIndex="0">
        <asp:View ID="V" runat="server">
            <table class="style2">
                <tr>
                    <td style="background-color: #4D6682">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style5">
                        <table style="width: 495px">
                            <tr>
                                <td style="text-align: center">
                                    <table class="style2">
                                        <tr>
                                            <td class="style33" style="text-align: right">
                                                <asp:Label ID="lbl_username" runat="server" 
                                                    style="font-weight: 700; font-size: 13px; color: #CC0000"></asp:Label>
                                            </td>
                                            <td class="style16">
                                                :نام کاربری</td>
                                        </tr>
                                        <tr>
                                            <td class="style33" style="text-align: right">
                                                <asp:Label ID="lbl_fn" runat="server"></asp:Label>
                                            </td>
                                            <td class="style16">
                                                :نام</td>
                                        </tr>
                                        <tr>
                                            <td class="style33" style="text-align: right">
                                                <asp:Label ID="lbl_ln" runat="server"></asp:Label>
                                            </td>
                                            <td class="style16">
                                                :نام خانوادگی</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <asp:Image ID="Im" runat="server" Height="186px" Width="145px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style16">
                                    <asp:Label ID="Label7" runat="server" 
                                        style="font-family: Tahoma; font-size: 11px; color: #FF0000" 
                                        Text="عکس باید از 70 کلیو بایت کمتر باشد"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style16">
                                    <asp:Label ID="Label8" runat="server" 
                                        style="font-family: Tahoma; font-size: 11px; color: #FF0000" 
                                        Text="اگر در این مرحله عکسی انتخاب نشود , عکس پیش فرض لحاظ خواهد شد"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <table class="style2">
                                        <tr>
                                            <td class="style32">
                                                <asp:FileUpload ID="File" runat="server" />
                                            </td>
                                            <td>
                                                :عکس جدید</td>
                                        </tr>
                                        <tr>
                                            <td class="style32">
                                                <asp:Button ID="btn_send" runat="server" 
                                                    style="font-family: Tahoma; font-size: 11px" Text="ارسال" />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style32">
                                                <asp:Label ID="lbl_wrong" runat="server" style="color: #FF0000"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
    
    </div>
    </form>
</body>
</html>
