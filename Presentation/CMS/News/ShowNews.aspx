<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="ShowNews.aspx.vb" Inherits="Presentation_CMS_News_ShowNews" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 95%;
        }
        .style6
        {
            width: 88px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="style5">
        <tr>
            <td>
                <img alt="" src="../../../Content/Images/M_Show.jpg" 
                    style="width: 763px; height: 45px" /></td>
        </tr>
        <tr>
            <td>
                <table class="style5">
                    <tr>
                        <td class="style6">
                            گروه:</td>
                        <td>
                            <asp:DropDownList ID="cmb" runat="server" DataSourceID="SqlDataSource1" 
                                DataTextField="Name_Category" DataValueField="Code_Category" Width="400px" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                                SelectCommand="SELECT * FROM [Tbl_NewsCategory] ORDER BY [Code_Category] DESC">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Horizontal" 
                    Width="764px" DataKeyNames="news">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" Visible="False">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="title_news" HeaderText="عنوان خبر" 
                            SortExpression="title_news">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="lid_news" HeaderText="متن کوتاه" 
                            SortExpression="lid_news" HtmlEncode="False" 
                            HtmlEncodeFormatString="False">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        
                        
                        <asp:TemplateField HeaderText="news" SortExpression="news" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="lblnews" runat="server" Text='<%# Bind("news") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                            
                        <asp:BoundField DataField="tarikh" HeaderText="تاریخ ایجاد" 
                            SortExpression="tarikh">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="time" HeaderText="زمان ایجاد" SortExpression="time">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        
                         <asp:TemplateField HeaderText="وضعیت نمایش" SortExpression="flag">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" 
                                ImageUrl='<%# IIF(Eval("flag")=0,"~/Presentation/images_Items/NoShow.gif","~/Presentation/images_Items/YesShow.gif") %>' />
                            </ItemTemplate>                                           
                            <HeaderStyle HorizontalAlign="Right" />                   
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="Username" HeaderText="توسط" 
                            SortExpression="Username" >
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        
                        <asp:BoundField DataField="Code_Category" HeaderText="Code_Category" SortExpression="Code_Category" 
                            Visible="False" />
                            
                        <asp:CommandField SelectText="نمایش" ShowSelectButton="True" />
                    </Columns>
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <EmptyDataTemplate>
                        رکوردی برای نمایش وجود ندارد
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                    SelectCommand="SELECT * FROM [Tbl_News] WHERE ([Code_Category] = @Code_Category) ORDER BY [ID] DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmb" Name="Code_Category" 
                            PropertyName="SelectedValue" Type="Int64" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="background-color: #CCCCCC">
                <asp:Label ID="lblShow" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; background-color: #FFFFFF">
                <asp:ImageButton ID="btn_back" runat="server" 
                    ImageUrl="~/Content/Images/back.gif" Height="35px" />
            </td>
        </tr>
    </table>

</asp:Content>

