<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="ManagerPart.aspx.vb" Inherits="Presentation_CMS_Login_ManagerPart" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style6
        {
            width: 53%;
        }
        .style5
        {
            width: 53%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="style6">
        <tr>
            <td>

    <table class="style5">
    <tr>
<img alt="" src="../../images_Items/Header.jpg"  style="width: 420px; height: 45px" />
</tr>
        <tr>
            <td style="text-align: center">
                <table class="style5">
                    <tr>
                        <td>
                            <img alt="" src="Images/Root/CteateUser.png" 
                                style="width: 128px; height: 128px" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                PostBackUrl="~/Presentation/CMS/Login/Create.aspx">ایجاد کاربر</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align: center">
                <table class="style5">
                    <tr>
                        <td>
                            <img alt="" src="Images/Root/ManagementUser.png" 
                                style="width: 128px; height: 128px" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton2" runat="server" 
                                PostBackUrl="~/Presentation/CMS/Login/ManagementUser.aspx">مدیریت کاربران</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align: center">
                <table class="style5">
                    <tr>
                        <td>
                            <img alt="" src="Images/Root/Roles.png" style="width: 128px; height: 128px" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton3" runat="server" 
                                PostBackUrl="~/Presentation/CMS/Login/Roles.aspx">مدیریت نقش ها</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        
    </table>

            </td>
        </tr>
        <tr>
            <td style="text-align: left; background-color: #FFFFFF">
&nbsp;بازگشت<asp:ImageButton ID="btn_back" runat="server" 
                    ImageUrl="~/Content/Images/prev.gif" />
            </td>
        </tr>
    </table>

</asp:Content>

