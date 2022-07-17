<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="news.aspx.vb" Inherits="news" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 98%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="style1">
        <tr>
            <td style="text-align: right">
                <asp:Label ID="lblTitle" runat="server" 
                    style="font-family: Tahoma; font-size: 12px; font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <asp:Label ID="lblNews" runat="server" 
                    style="font-family: Tahoma; font-size: 11px"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>

