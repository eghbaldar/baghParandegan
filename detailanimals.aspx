<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="detailanimals.aspx.vb" Inherits="detailanimals" title="Untitled Page" %>

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
            width: 100%;
        }
        .style4
        {
            width: 808px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" 
                    DataSourceID="SqlDataSource1" Width="937px">
                    <ItemTemplate>
                        <table class="style3">
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                </td>
                                <td>
                                    :نام حیوان</td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="ScinceNameLabel" runat="server" 
                                        Text='<%# Eval("ScinceName") %>' />
                                </td>
                                <td>
                                    :نام علمی حیوان</td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="FoodLabel" runat="server" Text='<%# Eval("Food") %>' />
                                </td>
                                <td>
                                    :تغذیه</td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="ZoneLabel" runat="server" Text='<%# Eval("Zone") %>' />
                                </td>
                                <td>
                                    :محیط زیست</td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="CountLabel" runat="server" Text='<%# Eval("Count") %>' />
                                </td>
                                <td>
                                    &nbsp;:تعداد برای فروش
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                                </td>
                                <td>
                                    :قیمت</td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                    SelectCommand="SELECT * FROM [Tbl_Bird] WHERE ([ID] = @ID) ORDER BY [ID] DESC">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2">
            
                <div style="direction:rtl;">
                    <asp:DataList ID="DataList2" runat="server" DataKeyField="ID" 
                    DataSourceID="ObjectDataSource1" RepeatColumns="8" 
                    RepeatDirection="Horizontal" Width="391px">
                    <ItemTemplate>
                    
                    <a href='<%# Eval("PicName","images\birdpicture\{0}") %>' target="_blank">
                        <asp:Image ID="Image1" runat="server" BorderColor="#A4A4A4" BorderWidth="3px" 
                        Height="82px" 
                        ImageUrl='<%# Eval("ThumbnailName", "~\images\birdpicture\{0}") %>' 
                        Width="108px" />    
                    </a>
                        
                    </ItemTemplate>
                </asp:DataList>
                </div>
                
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DS_BirdTableAdapters.Tbl_BPTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_ID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="BirdID" Type="Int32" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="PicName" Type="String" />
                        <asp:Parameter Name="ThumbnailName" Type="String" />
                        <asp:Parameter Name="Original_ID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="b" QueryStringField="ID" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="BirdID" Type="Int32" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="PicName" Type="String" />
                        <asp:Parameter Name="ThumbnailName" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

