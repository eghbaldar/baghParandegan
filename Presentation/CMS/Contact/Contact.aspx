<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="Contact.aspx.vb" Inherits="Presentation_CMS_Contact_Contact" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 16%;
        }
        .style6
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table class="style5">
        <tr>
            <td>
                <img alt="" src="../../images_Items/Header.jpg" 
                    style="width: 144px; height: 45px" /></td>
        </tr>
        <tr>
            <td style="text-align: center">
                <table class="style6">
                    <tr>
                        <td>
                            <img alt="" src="../../images_Items/On/show.png" 
                                style="width: 128px; height: 128px" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                PostBackUrl="~/Presentation/CMS/Contact/Maniplute_Contact.aspx">مشاهده تماس 
                            با ما</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; background-color: #FFFFFF">
                <asp:ImageButton ID="btn_back" runat="server" 
                    ImageUrl="~/Content/Images/back.gif" 
                    PostBackUrl="~/Presentation/ManagerWebsite.aspx" />
            </td>
        </tr>
    </table>
</asp:Content>

