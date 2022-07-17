<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="ManagerWebsite.aspx.vb" Inherits="Presentation_Modules_ManagementWebsite_Default" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style6
        {
            text-align: center;
        }
        .style5
        {
            width: 92px;
            height: 102px;
        }
        .style7
        {
            width: 100%;
        }
        .style14
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
            <td class="style6">
                <table class="style5">
                    <tr>
                        <td class="style6">
                            <img alt="" src="images_Items/On/show_Home.png" 
                                style="width: 64px; height: 64px" /></td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:LinkButton ID="btn_ShowSite" runat="server">نمایش سایت</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align: center">
                <table class="style5">
                    <tr>
                        <td class="style6">
                            <img alt="" src="images_Items/On/StopPage.png" 
                                style="width: 64px; height: 64px" /></td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:HyperLink ID="HyperLink2" runat="server" 
                                NavigateUrl="~/Presentation/CMS/OutOfLimit/OutOfLimit.aspx" 
                                Enabled="False">صفحه خارج از دسترس</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align: center">
                <table class="style5">
                    <tr>
                        <td class="style6">
                            <img alt="" src="images_Items/On/news.png" style="width: 64px; height: 64px" /></td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:HyperLink ID="HyperLink3" runat="server" 
                                NavigateUrl="~/Presentation/CMS/News/News.aspx" Enabled="False">ماژول اخبار</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align: center">
                <table class="style5">
                    <tr>
                        <td class="style6">
                            <img alt="" src="images_Items/On/Pictures.png" 
                                style="width: 48px; height: 48px" /></td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:HyperLink ID="HyperLink4" runat="server" 
                                NavigateUrl="~/Presentation/CMS/Gallery_Pictures/Gallery_Pictures.aspx">ماژول تصاویر</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <table class="style5">
                    <tr>
                        <td class="style6">
                            <img alt="" src="images_Items/On/login.png" style="width: 64px; height: 64px" /></td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:HyperLink ID="HyperLink5" runat="server" 
                                NavigateUrl="~/Presentation/CMS/Login/ManagerPart.aspx">تنظیمات کاربران</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align: center">
                <table class="style5">
                    <tr>
                        <td class="style6">
                            <img alt="" src="images_Items/On/goods.png" style="width: 64px; height: 64px" /></td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:HyperLink ID="HyperLink6" runat="server" 
                                NavigateUrl="~/Presentation/CMS/Bird/Default.aspx">فروش حیوانات</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align: center">
                <table class="style7">
                    <tr>
                        <td>
                            <img alt="" src="images_Items/On/Movies.png" 
                                style="width: 83px; height: 78px" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HyperLink ID="HyperLink7" runat="server" 
                                NavigateUrl="~/Presentation/CMS/Movie/Movie.aspx" Enabled="False">ماژول فیلم</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align: center">
                <table class="style7">
                    <tr>
                        <td>
                            <img alt="" src="images_Items/On/exit.png" style="width: 73px; height: 72px" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="btn_SingOut" runat="server">خروج</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style6">
                <table class="style5">
                    <tr>
                        <td class="style6">
                            <img alt="" src="images_Items/On/Article.png" 
                                style="width: 48px; height: 48px" /></td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:HyperLink ID="HyperLink8" runat="server" 
                                NavigateUrl="~/Presentation/CMS/Article/Article.aspx" Enabled="False">ماژول مقالات</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align: center">
                <table class="style7">
                    <tr>
                        <td>
                            <img alt="" src="images_Items/On/fielmanager.png" 
                                style="width: 64px; height: 64px" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HyperLink ID="HyperLink9" runat="server" 
                                NavigateUrl="~/Presentation/CMS/FileManager/FileManager.aspx" 
                                Enabled="False">مدیریت فابل ها</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align: center">
                <table class="style7">
                    <tr>
                        <td>
                            <img alt="" src="images_Items/On/AboutUS.png" 
                                style="width: 64px; height: 64px" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HyperLink ID="HyperLink10" runat="server" 
                                NavigateUrl="~/Presentation/CMS/AboutUS/AboutUS.aspx">درباره ما</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align: center">
                <table class="style7">
                    <tr>
                        <td>
                            <img alt="" src="images_Items/On/Contact.png" 
                                style="width: 64px; height: 64px" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HyperLink ID="HyperLink11" runat="server" 
                                NavigateUrl="~/Presentation/CMS/Contact/Contact.aspx">تماس با ما</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style6">
                <table class="style7">
                    <tr>
                        <td>
                            <img alt="" src="images_Items/On/Dont_Enter.png" 
                                style="width: 64px; height: 64px" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HyperLink ID="HyperLink13" runat="server" 
                                NavigateUrl="~/Presentation/CMS/IP/IP.aspx" Enabled="False">جلوگیری از ورود با IP کاربران</asp:HyperLink>
                        </td>
                    </tr>
                </table>
                <table class="style7">
                    </table>
            </td>
            <td style="text-align: center">
                &nbsp;</td>
            <td style="text-align: center">
                <table class="style7">
                    </table>
            </td>
            <td style="text-align: center">
                <table class="style14">
                    </table>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

