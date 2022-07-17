<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ShowProfileUser.aspx.vb" Inherits="Presentation_Modules_Login_ShowProfileUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    
    <style type="text/css">
        .style1
        {
            width: 192px;
        }
        .style9
        {
            width: 100%;
            height: 159px;
        }
        .style2
        {
            width: 359px;
        }
        .style6
        {
            text-align: right;
            width: 234px;
        }
        .style4
        {
            text-align: right;
        }
        .style8
        {
            width: 36px;
        }
        .style7
        {
            width: 42px;
        }
        .style10
        {
            width: 100%;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource1" 
            style="font-family: Tahoma; font-size: 11px; text-align: left">
            <ItemTemplate>
                <br />
                <table class="style9">
                    <tr>
                        <td>
                            <table align="right" class="style2">
                                <tr>
                                    <td>
                                        <table class="style2">
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="نام_کاربریLabel" runat="server" 
                                                        Text='<%# Eval("[نام کاربری]") %>' />
                                                </td>
                                                <td class="style4">
                                                    :نام کاربری
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="نامLabel" runat="server" 
                                                        Text='<%# IIF(Eval("نام")=""," - - - - - -",Eval("نام")) %>' />
                                                </td>
                                                <td class="style4">
                                                    :نام</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    &nbsp;</td>
                                                <td class="style4">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="نام_خانوادگیLabel" runat="server" 
                                                        Text='<%# IIF(Eval("[نام خانوادگی]")=""," - - - - - -",Eval("[نام خانوادگی]")) %>' />
                                                </td>
                                                <td class="style4">
                                                    :نام خانوادگی
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="جنسیتLabel" runat="server" 
                                                        Text='<%# IIF(Eval("جنسیت")=0,"مرد","زن") %>' />
                                                </td>
                                                <td class="style4">
                                                    :جنیت</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="وضعیت_تاهلLabel" runat="server" 
                                                        Text='<%# IIF(Eval("[وضعیت تاهل]")=0,"مجرد","متاهل") %>' />
                                                </td>
                                                <td class="style4">
                                                    :وضعیت تاهل</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <table class="style12">
                                                        <tr>
                                                            <td class="style13">
                                                                <asp:Label ID="سال_تولدLabel" runat="server" Text='<%# Eval("[سال تولد]") %>' />
                                                            </td>
                                                            <td class="style8">
                                                                /</td>
                                                            <td>
                                                                <asp:Label ID="ماه_تولدLabel" runat="server" Text='<%# Eval("[ماه تولد]") %>' />
                                                            </td>
                                                            <td class="style7">
                                                                /</td>
                                                            <td>
                                                                <asp:Label ID="روز_تولدLabel" runat="server" Text='<%# Eval("[روز تولد]") %>' />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td class="style4">
                                                    :تاریخ تولد</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="موبایلLabel" runat="server" 
                                                        Text='<%# IIF(Eval("موبایل")=""," - - - - - -",Eval("موبایل")) %>' />
                                                </td>
                                                <td class="style4">
                                                    :موبایل</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="کد_ملیLabel" runat="server" 
                                                        Text='<%# IIF(Eval("[کد ملی]")=""," - - - - - -",Eval("[کد ملی]")) %>' />
                                                </td>
                                                <td class="style4">
                                                    :کد ملی</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="نام_پدرLabel" runat="server" 
                                                        Text='<%# IIF(Eval("[نام پدر]")=""," - - - - - -",Eval("[نام پدر]")) %>' />
                                                </td>
                                                <td class="style4">
                                                    :نام پدر</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="تلفنLabel" runat="server" 
                                                        Text='<%# IIF(Eval("تلفن")=""," - - - - - -",Eval("تلفن")) %>' />
                                                </td>
                                                <td class="style4">
                                                    :تلفن</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="تحصیلاتLabel" runat="server" 
                                                        Text='<%# IIF(Eval("تحصیلات")=""," - - - - - -",Eval("تحصیلات")) %>' />
                                                </td>
                                                <td class="style4">
                                                    :تحصیلات</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="ملیتLabel" runat="server" 
                                                        Text='<%# IIF(Eval("ملیت")=""," - - - - - -",Eval("ملیت")) %>' />
                                                </td>
                                                <td class="style4">
                                                    :ملیت</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="شهرLabel" runat="server" 
                                                        Text='<%# IIF(Eval("شهر")=""," - - - - - -",Eval("شهر")) %>' />
                                                </td>
                                                <td class="style4">
                                                    :شهر</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="آدرسLabel" runat="server" 
                                                        Text='<%# IIF(Eval("آدرس")=""," - - - - - -",Eval("آدرس")) %>' />
                                                </td>
                                                <td class="style4">
                                                    :آدرس</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="کد_پستیLabel" runat="server" 
                                                        Text='<%# IIF(Eval("[کد پستی]")=""," - - - - - -",Eval("[کد پستی]")) %>' />
                                                </td>
                                                <td class="style4">
                                                    :کد پستی</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="مذهبLabel" runat="server" 
                                                        Text='<%# IIF(Eval("مذهب")=""," - - - - - -",Eval("مذهب")) %>' />
                                                </td>
                                                <td class="style4">
                                                    :مذهب</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="تعدد_بچهLabel" runat="server" 
                                                        Text='<%# IIF(Eval("[تعدد بچه]")=""," - - - - - -",Eval("[تعدد بچه]")) %>' />
                                                </td>
                                                <td class="style4">
                                                    :تعداد بچه</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="شغلLabel" runat="server" 
                                                        Text='<%# IIF(Eval("شغل")=""," - - - - - -",Eval("شغل")) %>' />
                                                </td>
                                                <td class="style4">
                                                    :شغل</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="قدLabel" runat="server" 
                                                        Text='<%# IIF(Eval("قد")=""," - - - - - -",Eval("قد")) %>' />
                                                </td>
                                                <td class="style4">
                                                    :قد</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="مزنLabel" runat="server" 
                                                        Text='<%# IIF(Eval("مزن")=""," - - - - - -",Eval("مزن")) %>' />
                                                </td>
                                                <td class="style4">
                                                    :وزن</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="آدرس_الکترونیکی_یکLabel" runat="server" 
                                                        Text='<%# IIF(Eval("[آدرس الکترونیکی یک]")=""," - - - - - -",Eval("[آدرس الکترونیکی یک]")) %>' />
                                                </td>
                                                <td class="style4">
                                                    :آدرس الکترونیکی اول</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="آدرس_الکترونیکی_دوLabel" runat="server" 
                                                        Text='<%#IIf(Eval("[آدرس الکترونیکی دو]") = "", " - - - - - -", Eval("[آدرس الکترونیکی دو]"))%>' />
                                                </td>
                                                <td class="style4">
                                                    :آدرس الکترونیکی دوم</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:HyperLink ID="HyperLink1" runat="server" 
                                                        NavigateUrl='<%# Eval("[آدرس وب سایت]", "{0}") %>' 
                                                        Text='<%# Eval("[آدرس وب سایت]", "{0}") %>'></asp:HyperLink>
                                                </td>
                                                <td class="style4">
                                                    :آدرس وب سایت</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <table class="style10">
                                <tr>
                                    <td>
                                        <asp:Image ID="Image1" runat="server" Height="241px" 
                                            ImageUrl='<%# Eval("Image", "{0}") %>' Width="174px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    
    </div>
    <table class="style1">
        <tr>
            <td>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetData" 
                    TypeName="DS_MembershipTableAdapters.Select_Row_DetailUserTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="" Name="username" 
                            QueryStringField="UserID" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Username" Type="String" />
                        <asp:Parameter Name="fn" Type="String" />
                        <asp:Parameter Name="ln" Type="String" />
                        <asp:Parameter Name="Tavalod_sal" Type="String" />
                        <asp:Parameter Name="Tavalod_mah" Type="String" />
                        <asp:Parameter Name="Tavalod_roz" Type="String" />
                        <asp:Parameter Name="CodeMeli" Type="String" />
                        <asp:Parameter Name="Pedar" Type="String" />
                        <asp:Parameter Name="Tel" Type="String" />
                        <asp:Parameter Name="Mobile" Type="String" />
                        <asp:Parameter Name="Tahsilat" Type="String" />
                        <asp:Parameter Name="Job" Type="String" />
                        <asp:Parameter Name="Ghad" Type="String" />
                        <asp:Parameter Name="Vazn" Type="String" />
                        <asp:Parameter Name="MF" Type="Boolean" />
                        <asp:Parameter Name="Tahol" Type="Boolean" />
                        <asp:Parameter Name="Bache" Type="String" />
                        <asp:Parameter Name="Din" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="Country" Type="String" />
                        <asp:Parameter Name="WebPage" Type="String" />
                        <asp:Parameter Name="Email_1" Type="String" />
                        <asp:Parameter Name="Email_2" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="code_posti" Type="String" />
                        <asp:Parameter Name="Image" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </form>
</body>
</html>
