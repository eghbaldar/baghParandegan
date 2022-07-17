<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="AddBird.aspx.vb" Inherits="Presentation_CMS_Bird_AddBird" title="افزودن مشخصات حیوانات" %>
<%@ Register src="ctlMenuBar.ascx" tagname="ctlMenuBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ctlMenuBar ID="ctlMenuBar1" runat="server" />
    <asp:HiddenField ID="HiddenField1" runat="server" />
<div style="padding-right:20px;">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table cellspacing="4">
                <tr>
                    <td colspan="6">
                        <asp:Label ID="lblMsg" runat="server" Font-Bold="False" ForeColor="Red" 
                            Visible="False">خطا در ذخیره سازی داده !!! </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        گروه :</td>
                    <td>
                        <asp:DropDownList ID="ddlCategory" runat="server" 
                            DataSourceID="ObjectDataSource1" DataTextField="CategoryName" 
                            DataValueField="ID" Width="120px">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                            OldValuesParameterFormatString="original_{0}" SelectMethod="SelectAll" 
                            TypeName="BirdCategory"></asp:ObjectDataSource>
                    </td>
                    <td style="width:30px;">
                        &nbsp;</td>
                    <td>
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
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtName" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        نام علمی :</td>
                    <td style="margin-right: 120px">
                        <asp:TextBox ID="txtScinceName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtScinceName" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        نوع تغذیه :</td>
                    <td>
                        <asp:TextBox ID="txtFood" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtFood" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        منطقه زیست :</td>
                    <td>
                        <asp:TextBox ID="txtZone" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txtZone" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        توضیحات :</td>
                    <td colspan="5">
                        <asp:TextBox ID="txtDescription" runat="server" Height="83px" Width="227px" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        در معرض فروش :</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Value="true">بلی</asp:ListItem>
                            <asp:ListItem Selected="True" Value="false">خیر</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        &nbsp;</td>
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
                        <asp:TextBox ID="txtCount" runat="server" Width="75px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        قیمت :</td>
                    <td>
                        <asp:TextBox ID="txtPrice" runat="server" Width="75px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr style="height:50px;">
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnSave" runat="server" Text="ذخیره" Width="50px" />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            
        </asp:View>
        <asp:View ID="View2" runat="server">
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
                        <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtTitle" ErrorMessage="*"></asp:RequiredFieldValidator>
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
                                <asp:BoundField DataField="BirdID" HeaderText="BirdID" SortExpression="BirdID" 
                                    Visible="False" />
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
                            
                            SelectCommand="SELECT [ID], [BirdID], [Title], [ThumbnailName] FROM [Tbl_BirdPicture] WHERE ([BirdID] = (select top 1 [id] as LastID from Tbl_bird order by [id] desc))" 
                            DeleteCommand="DELETE FROM Tbl_BirdPicture WHERE (ID = @ID)">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="gvPicture" Name="@ID" 
                                    PropertyName="SelectedValue" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </td>
                    
                </tr>
            </table>        
        </asp:View>
    </asp:MultiView>
        <asp:LinkButton ID="LinkButton1" runat="server" 
        PostBackUrl="~/Presentation/ManagerWebsite.aspx">بازگشت</asp:LinkButton>
</div>
</asp:Content>