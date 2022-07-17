<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="Maniplute_Contact.aspx.vb" Inherits="Presentation_CMS_Contact_Maniplute_Contact" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 85%;
        }
    </style>
    
    <script language="javascript" type="text/javascript">
        function ShowInfo(str){
        window.open("Detail_Contact.aspx?ID="+str ,'nwwin', 'toolbar=0,location=0,directories=0,status=0,menubar=no,scrollbars=yes,resizable=no,width=355,height=400');        
        return false;
        }
    </script>
    
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
                <asp:GridView ID="DG" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" 
                    GridLines="Horizontal" Width="763px">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="Name" HeaderText="نام فرستنده" SortExpression="Name">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="آدرس الکرونیکی" 
                            SortExpression="Email">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="subject" HeaderText="موضوع" SortExpression="subject">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Text" HeaderText="متن" SortExpression="Text" 
                            Visible="False">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IP" HeaderText="آی پی فرستنده" SortExpression="IP">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        
                        <asp:TemplateField HeaderText="" SortExpression="ID">
                            <ItemTemplate>
                                <asp:LinkButton 
                                OnClientClick='<%# Eval("ID","return ShowInfo(""{0}"")") %>'
                                ID="LinkButton1" runat="server">نمایش</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField SortExpression="ID">
                            <ItemTemplate>
                                <asp:ImageButton ID="Image_Delete" runat="server" CausesValidation="False" 
                                CommandArgument='<% #Eval("ID","{0}") %>' 
                                OnCommand="Delete_Contact"
                                ImageUrl="~/Content/Images/delete.gif" 
                                OnClientClick="return confirm('آیا میخواهید این رکورد حذف شود؟');" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                    SelectCommand="SELECT * FROM [Tbl_Contact] ORDER BY [ID] DESC">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; background-color: #FFFFFF">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/Content/Images/back.gif" 
                    PostBackUrl="~/Presentation/CMS/Contact/Contact.aspx" />
            </td>
        </tr>
        </table>

</asp:Content>

