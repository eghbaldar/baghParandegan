<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="contact.aspx.vb" Inherits="contact" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            font-family: Tahoma;
            font-size: 11px;
            text-align: left;
        }
        .style3
        {
            font-family: Tahoma;
            font-size: 11px;
            text-align: right;
            width: 574px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="style1">
        <tr>
            <td class="style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtFnLn" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtFnLn" runat="server" Width="200px" 
                    style="text-align: right"></asp:TextBox>
            </td>
            <td class="style2">
                :نام و نام خانوادگی
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtMail" ErrorMessage="*" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txtMail" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style2">
                :پست الکترونیکی
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtSubject" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtSubject" runat="server" Width="200px" 
                    style="text-align: right"></asp:TextBox>
            </td>
            <td class="style2">
                :موضوع
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtMessage" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtMessage" runat="server" Height="199px" TextMode="MultiLine" 
                    Width="200px" style="text-align: right"></asp:TextBox>
            </td>
            <td class="style2">
                :متن             </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Button ID="btnSend" runat="server" 
                    style="font-family: Tahoma; font-size: 11px" Text="ارسال" />
            </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="lblError" runat="server" style="color: #CC0000"></asp:Label>
            </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
    </table>

</asp:Content>

