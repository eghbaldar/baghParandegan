<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="sale.aspx.vb" Inherits="sale" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 95%;
        }
        .style2
        {
            font-family: Tahoma;
            font-size: 12px;
            font-weight: bold;
            color: #342C25;
        }
        .style3
        {
            color: #342C25;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td style="text-align: right">
                <span class="style3">:</span><span class="style2">گروه بندی حیوانات</span></td>
        </tr>
        <tr>
            <td style="text-align: right">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" 
                    DataSourceID="SqlDataSource1" Width="932px">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            style="font-family: Tahoma; font-size: 11px;text-decoration:none; color: #266A4A;" 
                            Text='<%# Eval("CategoryName", "{0}") %>' 
                            NavigateUrl='<%# Eval("ID", "animals.aspx?id={0}") %>'></asp:HyperLink>
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                    SelectCommand="SELECT * FROM [Tbl_BirdCategory] ORDER BY [ID] DESC">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

