<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="Category_News.aspx.vb" Inherits="Presentation_CMS_News_Category_News" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 97%;
        }
        .style6
        {
            width: 100%;
        }
        .style7
        {
            width: 73px;
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
                <asp:GridView ID="DG_NewsCategory" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataKeyNames="Code_Category" DataSourceID="SDS_Category" ForeColor="Black" 
                    GridLines="Horizontal" PageSize="7" Width="762px">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <Columns>
                    
                        <asp:BoundField DataField="Name_Category" HeaderText="نام گروه" 
                            SortExpression="Name_Category" >
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        
                        <asp:BoundField DataField="Code_Category" HeaderText="Code_Category" 
                            InsertVisible="False" ReadOnly="True" SortExpression="Code_Category" 
                            Visible="False" />
                        <asp:CommandField CancelText="لغو" EditText="ویرایش گروه" ShowEditButton="True" 
                            UpdateText="بروز رسانی" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:CommandField>
                         
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                            
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                    CommandArgument='<%# Eval("Code_Category","{0}") %>' 
                                    ImageUrl="~/Content/Images/delete.gif" 
                                    OnClientClick="return confirm('با حذف این گروه تمام خبر های زیر مجموعه آن نیز حذف می گردند');" 
                                    OnCommand="Delete_NewsCategory" />
                                    
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <EmptyDataTemplate>
                        رکوردی برای نمایش وجود ندارد
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                        <asp:SqlDataSource ID="SDS_Category" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                            
                            
                    
                            
                            
                            SelectCommand="SELECT * FROM [Tbl_NewsCategory] ORDER BY [Code_Category] DESC" 
                            UpdateCommand="UPDATE Tbl_NewsCategory SET Name_Category = @Name_Category WHERE (Code_Category = @code_category)">
                            <UpdateParameters>
                                <asp:Parameter Name="Name_Category" />
                                <asp:Parameter Name="code_category" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <img alt="" src="../../../Content/Images/ADD_God.jpg" 
                    style="width: 763px; height: 45px" /></td>
        </tr>
        <tr>
            <td>
                <table class="style5">
                    <tr>
                        <td>
                            نام گروه:</td>
                        <td>
                            <asp:TextBox ID="txt_NameCategory" runat="server" 
                                style="text-align: right; font-family: Tahoma; font-size: 11px" Width="233px">
                                </asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txt_NameCategory" ErrorMessage="*" ValidationGroup="C">
                                </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btn_insertCategory" runat="server" 
                                style="font-family: Tahoma; font-size: 11px" Text="ارسال" ValidationGroup="C" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lbl_statuseCategory" runat="server" style="color: #FF0000"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; background-color: #FFFFFF">
                <asp:ImageButton ID="btn_back" runat="server" 
                    ImageUrl="~/Content/Images/back.gif" />
                <br />
            </td>
        </tr>
    </table>

            
     

</asp:Content>

