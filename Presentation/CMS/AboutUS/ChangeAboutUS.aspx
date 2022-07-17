<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="ChangeAboutUS.aspx.vb" Inherits="Presentation_CMS_AboutUS_ChangeAboutUS" title="Untitled Page" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 98%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table class="style5">
        <tr>
            <td>
                <img alt="" src="../../../Content/Images/M_Show.jpg" 
                    style="width: 763px; height: 45px" /></td>
        </tr>
        <tr>
            <td>
                <table class="style5">
                    <tr>
                        <td>
                            عبارتی که به عنوان متن <b>درباره ما </b>برای کاربر قابل مشاهده خواهد بود</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <FCKeditorV2:FCKeditor ID="FCK_text" runat="server" 
                                BasePath="~/Content/fckeditor/" Height="400px">
                            </FCKeditorV2:FCKeditor>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btn_send" runat="server" 
                                style="font-family: Tahoma; font-size: 11px" Text="ارسال" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:Label ID="lbl" runat="server" style="color: #FF0000"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; background-color: #FFFFFF">
                            <asp:ImageButton ID="btn_back" runat="server" 
                                ImageUrl="~/Content/Images/back.gif" 
                                PostBackUrl="~/Presentation/CMS/AboutUS/AboutUS.aspx" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

