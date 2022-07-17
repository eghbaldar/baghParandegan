<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="AddCategory.aspx.vb" Inherits="Presentation_CMS_Bird_AddCategory" title="افزودن دسته بندی" %>
<%@ Register src="ctlMenuBar.ascx" tagname="ctlMenuBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ctlMenuBar ID="ctlMenuBar1" runat="server" />
    <table style="padding-right:20px;">
        <tr>
            <td colspan="4" style="height:25px;">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="False" ForeColor="Red" 
                    Visible="False" >خطا در ذخیره سازی داده !!! </asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:50px;">
                نام گروه :
            </td>
            <td>
                <asp:TextBox ID="txtCategory" runat="server" ValidationGroup="InsertData"></asp:TextBox>
            </td>
            <td style="width:30px;">
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtCategory" ErrorMessage="*" ValidationGroup="InsertData"></asp:RequiredFieldValidator>
                
            </td>
            
            <td>
                <asp:Button ID="btnSave" runat="server" Text="ذخیره" Width="60px" 
                    ValidationGroup="InsertData" />
            </td>
            
        </tr>
    </table>
    <br />
    <hr />
    <br />    
    <div style="margin:10px;padding-right:20px;">
        <asp:GridView ID="gvBirdCategory" runat="server" DataSourceID="ObjectDataSource1" 
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
            DataKeyNames="ID">
            <RowStyle BackColor="#E3EAEB" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Presentation/CMS/Bird/Image/Arrow.gif" />
                    </ItemTemplate>
                </asp:TemplateField>            
                <asp:BoundField DataField="ID" HeaderText="ID" Visible="False" />
                <asp:BoundField DataField="CategoryName" HeaderText="دسته" />
                <asp:TemplateField HeaderText="حذف">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" OnClientClick="return confirm('آیا میخواهید این مقاله حذف شود؟');"
                            CommandName="Delete" ImageUrl="~/Presentation/CMS/Bird/Image/Delete.gif" Text="Delete" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                
                <asp:CommandField ButtonType="Image" 
                    CancelImageUrl="~/Presentation/CMS/Bird/Image/Cancel.png" CancelText="انصراف" 
                    EditImageUrl="~/Presentation/CMS/Bird/Image/Edit.gif" EditText="ویرایش" 
                    HeaderText="ویرایش رکورد" ShowEditButton="True" 
                    UpdateImageUrl="~/Presentation/CMS/Bird/Image/Update.png" 
                    UpdateText="بروز رسانی">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:CommandField>
            </Columns>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            DeleteMethod="Delete" InsertMethod="Insert" 
            SelectMethod="SelectAll" 
            TypeName="BirdCategory" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="CategoryName" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
            <asp:LinkButton ID="LinkButton1" runat="server" 
        PostBackUrl="~/Presentation/ManagerWebsite.aspx">بازگشت</asp:LinkButton>
    </div>

</asp:Content>

