<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="SaleList.aspx.vb" Inherits="Presentation_CMS_Bird_SaleList" title="لیست حیوانات فروشی" %>
<%@ Register src="ctlMenuBar.ascx" tagname="ctlMenuBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ctlMenuBar ID="ctlMenuBar1" runat="server" />
    <br />
    <div style="padding-right:20px;padding-bottom:20px;">
    <asp:GridView ID="gvBirdList" runat="server" CellPadding="4" 
        DataSourceID="ObjectDataSource1" ForeColor="#333333" 
        AutoGenerateColumns="False" DataKeyNames="ID" AllowPaging="True" 
            EnableTheming="True">
        <RowStyle BackColor="#E3EAEB" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Presentation/CMS/Bird/Image/Arrow.gif" />
                </ItemTemplate>
            </asp:TemplateField>            
        
            <asp:BoundField DataField="ID" HeaderText="شماره" Visible="False" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="CategoryName" HeaderText="دسته بندی" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="نام" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="ScinceName" HeaderText="نام علمی" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Food" HeaderText="نوع تغذیه" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Zone" HeaderText="منطقه زیست" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="وضعیت فروش">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bol2Str(Eval("IsSale")) %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:BoundField DataField="Count" HeaderText="تعداد">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Price" HeaderText="قیمت">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            
            <asp:HyperLinkField DataNavigateUrlFields="ID" 
                DataNavigateUrlFormatString="ShowBird.aspx?id={0}" HeaderText="مشاهده مشخصات" 
                Text="مشاهد...">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:HyperLinkField>

            <asp:HyperLinkField DataNavigateUrlFields="ID" 
                DataNavigateUrlFormatString="EditBird.aspx?id={0}" HeaderText="ویرایش مشخصات" 
                Text="ویرایش...">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:HyperLinkField>
            
                <asp:TemplateField HeaderText="حذف اطلاعات">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" OnClientClick="return confirm('آیا میخواهید این مقاله حذف شود؟');"
                            CommandName="Delete" ImageUrl="~/Presentation/CMS/Bird/Image/Delete.gif" Text="Delete" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
            
        </Columns>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        DeleteMethod="Delete" 
        SelectMethod="SelectSaleList" TypeName="Bird">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
        <asp:LinkButton ID="LinkButton1" runat="server" 
        PostBackUrl="~/Presentation/ManagerWebsite.aspx">بازگشت</asp:LinkButton>
    </div>
</asp:Content>

