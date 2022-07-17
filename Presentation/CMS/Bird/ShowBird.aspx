<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="ShowBird.aspx.vb" Inherits="Presentation_CMS_Bird_ShowBird" title="مشاهده مشخصات" %>
<%@ Register src="ctlMenuBar.ascx" tagname="ctlMenuBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ctlMenuBar ID="ctlMenuBar1" runat="server" />

<table cellspacing="20">
                <tr>
                    <td>
                        گروه :</td>
                    <td>
                        <asp:Label ID="lblCategory" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td style="width:30px;">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        نام حیوان :</td>
                    <td>
                        <asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        نام علمی :</td>
                    <td style="margin-right: 120px">
                        <asp:Label ID="lblScinceName" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        نوع تغذیه :</td>
                    <td>
                        <asp:Label ID="lblFood" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        منطقه زیست :</td>
                    <td>
                        <asp:Label ID="lblZone" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        توضیحات :</td>
                    <td colspan="5">
                        <b>
                            <asp:Literal ID="litDescription" runat="server"></asp:Literal>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td>
                        در معرض فروش :</td>
                    <td>
                        <asp:Label ID="lblIsSale" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        تعداد فروش :</td>
                    <td>
                        <asp:Label ID="lblCount" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        قیمت :</td>
                    <td>
                        <asp:Label ID="lblPrice" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                </table>
                <br />
                <hr style="color:White;" />
                <h3 style="padding-right:20px;">عکس های مرتبط :</h3>
                <asp:DataList ID="DataList1" runat="server" 
                    DataSourceID="ObjectDataSource1"  RepeatColumns="3" 
                    RepeatDirection="Horizontal" CellPadding="20">
                    <ItemTemplate>
                        <a href='<%# Eval("PicName", "../../../images/BirdPicture/{0}") %>' target="_blank">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ThumbnailName", "~\images\BirdPicture\{0}") %>'/>
                        </a>
                    </ItemTemplate>
                </asp:DataList>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="SelectByBirdID" 
        TypeName="BirdPicture">
        <SelectParameters>
            <asp:QueryStringParameter Name="BirdID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
        <asp:LinkButton ID="LinkButton1" runat="server" 
        PostBackUrl="~/Presentation/ManagerWebsite.aspx">بازگشت</asp:LinkButton>
</asp:Content>

