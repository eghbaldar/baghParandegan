<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="Add2Gallery.aspx.vb" Inherits="Presentation_CMS_Bird_Add2Gallery" title="گالری تصاویر" %>
<%@ Register src="ctlMenuBar.ascx" tagname="ctlMenuBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ctlMenuBar ID="ctlMenuBar1" runat="server" />
        <div style="padding-right:20px;">
        <table cellspacing="4">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblMsg_Picture" runat="server" Font-Bold="False" ForeColor="Red" 
                            Visible="False">خطا در ذخیره سازی داده !!! </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        عنوان :</td>
                    <td>
                        <asp:TextBox ID="txtTitle" runat="server" ValidationGroup="4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtTitle" ErrorMessage="*" ValidationGroup="4"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        ادرس عکس :</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="262px" />
                    </td>
                </tr>
                <tr style="height:50px;">
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnSendPic" runat="server" Text="ارسال عکس" />
                    </td>
                </tr>
                <tr>
                    
                    <td colspan="2">
                        <asp:GridView ID="gvPicture" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" DataSourceID="SqlDataSource1" 
                            ForeColor="#333333" DataKeyNames="ID">
                            <RowStyle BackColor="#E3EAEB" />
                            <Columns>
                                
<%--                                <asp:TemplateField HeaderText="حذف">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" OnClientClick="return confirm('آیا میخواهید این مقاله حذف شود؟');"
                                            CommandName="Delete" ImageUrl="~/Presentation/CMS/Bird/Image/Delete.gif" Text="Delete" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
--%>                            
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" 
                                            ImageUrl="~/Presentation/CMS/Bird/Image/Arrow.gif" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="ID" Visible="False" />
                                <asp:BoundField DataField="Title" HeaderText="عنوان عکس" SortExpression="Title">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ThumbnailName" HeaderText="عکس" 
                                    SortExpression="ThumbnailName" Visible="False" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" 
                                            ImageUrl='<%# Eval("ThumbnailName", "~\images\BirdPicture\{0}") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:CommandField ButtonType="Button" 
                                    DeleteImageUrl="~/Presentation/CMS/Bird/Image/Delete.gif" DeleteText="حذف" 
                                    EditText="ویرایش" ShowDeleteButton="True" HeaderText="حذف عکس" >

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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                            
                            SelectCommand="SELECT [ID], [Title], [ThumbnailName] FROM [Tbl_BirdGallery]" 
                            DeleteCommand="DELETE FROM Tbl_BirdGallery WHERE (ID = @ID)">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="gvPicture" Name="@ID" 
                                    PropertyName="SelectedValue" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </td>
                    
                </tr>
            </table>
                <asp:LinkButton ID="LinkButton1" runat="server" 
        PostBackUrl="~/Presentation/ManagerWebsite.aspx">بازگشت</asp:LinkButton>
        </div>
</asp:Content>

