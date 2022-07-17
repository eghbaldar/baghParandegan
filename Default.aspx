<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 328px;
        }
        .style3
        {
            text-align: right;
        }
        .style4
        {
            text-align: right;
            width: 458px;
        }
        .style5
        {
            width: 407px;
        }
        .style6
        {
            width: 381px;
        }
        .style7
        {
            font-family: Tahoma;
            font-size: 11px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

                
                    <div id="text_etealat">
                        
                        اطلاعیه ها</div>
                    <img src="images/etelaei.gif" id="etelaei" />
                    <div id="text_animal">
                        حیوانات باغ</div>
                    <img src="images/animal.gif" id="animal" />
                    <div id="content_etalie">

                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" 
                            Width="351px">
                            <ItemTemplate>
                                <table class="style1">
                                    <tr>
                                        <td class="style2" style="text-align: right">
                                        
                                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                                NavigateUrl='<%# Eval("ID", "~\news.aspx?id={0}") %>' 
                                                style="font-size: 11px; font-family: Tahoma;color:Black;text-decoration:none;" 
                                                Text='<%# Eval("title_news", "{0}") %>'>
                                            </asp:HyperLink>
                                            
                                        </td>
                                        <td style="text-align: right">
                                            <img alt="" src="images/bird_icon.jpg" style="width: 21px; height: 19px" /></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                            SelectCommand="SELECT top 10 [title_news], [ID] FROM [Tbl_News] WHERE ([Flag] = @Flag) order by [id] desc">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="Flag" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>
                    <div id="content_animal">
<asp:DataList ID="DataList2" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource1" 
                            RepeatColumns="2" RepeatDirection="Horizontal" Width="567px">
    <ItemTemplate>
        <table class="style1">
            <tr>
                <td class="style4">
                    <table class="style1">
                        <tr>
                            <td class="style5">
                                <asp:Label ID="NameLabel" runat="server" 
                                    style="font-family: Tahoma; font-size: 11px" Text='<%# Eval("Name") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                <table class="style1">
                                    <tr>
                                        <td class="style6">
                                            <asp:Label ID="PriceLabel" runat="server" 
                                                style="font-family: Tahoma; font-size: 11px" Text='<%# Eval("Price") %>' />
                                        </td>
                                        <td class="style7">
                                            :قیمت</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#245B49" 
                                    NavigateUrl='<%# Eval("ID", "~\detailanimals.aspx?id={0}") %>' 
                                    style="font-family: Tahoma; font-size: 11px;text-decoration:none;">... 
                                توضیحات بیشتر</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="style3">
                    <asp:Image ID="Image1" runat="server" BorderColor="#A4A4A4" BorderWidth="3px" 
                        Height="82px" 
                        ImageUrl='<%# Eval("ThumbnailName", "~\images\birdpicture\{0}") %>' 
                        Width="108px" />
                </td>
            </tr>
        </table>
    </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                            SelectCommand="SELECT * FROM [vw_BirdDefault]"></asp:SqlDataSource>
                    </div>

                
</asp:Content>

