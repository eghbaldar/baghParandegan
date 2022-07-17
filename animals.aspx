<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="animals.aspx.vb" Inherits="animals" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 97%;
        }
        .style2
        {
            text-align: right;
            font-family: Tahoma;
            font-size: 11px;
        }
        .style3
        {
            text-align: right;
            font-family: Tahoma;
            font-size: 12px;
            font-weight: bold;
        }
        .style4
        {
            width: 100%;
        }
        .style5
        {
            width: 832px;
        }
        .style6
        {
            width: 82px;
        }
        .style7
        {
            background-color: #D9E6DA;
        }
        .style8
        {
            width: 82px;
            background-color: #D9E6DA;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style3">
                :لیست حیوانات ارائه شده
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" 
                    DataSourceID="SqlDataSource1" RepeatColumns="3" Width="941px">
                    <ItemTemplate>
                        <table class="style4">
                            <tr>
                                <td class="style5">
                                    <table class="style4">
                                        <tr>
                                            <td class="style8">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name", "{0}") %>'></asp:Label>
                                            </td>
                                            <td class="style7">
                                                :نام</td>
                                        </tr>
                                        <tr>
                                            <td class="style6">
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price", "{0}") %>'></asp:Label>
                                            </td>
                                            <td>
                                                :قیمت</td>
                                        </tr>
                                        <tr>
                                            <td class="style6">
                                                &nbsp;</td>
                                            <td>
                                                <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#245B49" 
                                    NavigateUrl='<%# Eval("ID", "~\detailanimals.aspx?id={0}") %>' 
                                    style="font-family: Tahoma; font-size: 11px;text-decoration:none;">... توضیحات بیشتر</asp:HyperLink>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <asp:Image ID="Image1" runat="server" BorderColor="#A4A4A4" BorderWidth="3px" 
                                        Height="82px" 
                                        ImageUrl='<%# Eval("ThumbnailName", "~\images\birdpicture\{0}") %>' 
                                        Width="108px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                    
                    SelectCommand="SELECT * FROM [vw_ListAnimals] WHERE ([CategoryID] = @CategoryID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="CategoryID" QueryStringField="ID" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

