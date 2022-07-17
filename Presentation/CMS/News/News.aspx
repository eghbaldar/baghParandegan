<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="News.aspx.vb" Inherits="Presentation_CMS_News_News" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
    <style type="text/css">
        .style15
        {
            width: 62%;
        }
        .style9
        {
            width: 68%;
        }
        .style14
        {
            text-align: center;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
<%----%>
    <img alt="" src="../../images_Items/Header.jpg" 
        style="width: 560px; height: 45px" /></div>
    <table class="style15">
        <tr>
            <td>
    
    <table class="style9">
        <tr>
            <td>
                <table class="style9">
                    <tr>
                        <td style="text-align: center">
                            <img alt="" src="../../images_Items/On/show.png" 
                                style="width: 128px; height: 128px" /></td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:LinkButton ID="btn_showNews" runat="server" 
                                PostBackUrl="~/Presentation/CMS/News/ShowNews.aspx">مشاهده خبر ها</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table class="style9">
                    <tr>
                        <td style="text-align: center">
                            <img alt="" src="../../images_Items/On/add.png" 
                                style="width: 128px; height: 128px" /></td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:LinkButton ID="btn_insertNews" runat="server" 
                                PostBackUrl="~/Presentation/CMS/News/Add_News.aspx">اضافه کردن خبر</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table class="style9">
                    <tr>
                        <td class="style14">
                            <img alt="" src="../../images_Items/On/edit.png" 
                                style="width: 128px; height: 128px" /></td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:LinkButton ID="btn_editNews" runat="server" 
                                PostBackUrl="~/Presentation/CMS/News/Edit_News.aspx">ویرایش خبر ها</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table class="style9">
                    <tr>
                        <td class="style14">
                            <img alt="" src="../../images_Items/On/group.png" 
                                style="width: 128px; height: 128px" /></td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:LinkButton ID="btn_groupNews" runat="server" 
                                PostBackUrl="~/Presentation/CMS/News/Category_News.aspx">گروهبندی خبر ها</asp:LinkButton>
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
                بازگشت<asp:ImageButton ID="btn_back" runat="server" 
                    ImageUrl="~/Content/Images/prev.gif" />
            </td>
        </tr>
    </table>
    
    </asp:Content>

