<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Presentation_CMS_Bird_Default" title="Untitled Page" %>

<%@ Register src="ctlMenuBar.ascx" tagname="ctlMenuBar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ctlMenuBar ID="ctlMenuBar1" runat="server" />
    <asp:LinkButton ID="LinkButton1" runat="server" 
        PostBackUrl="~/Presentation/ManagerWebsite.aspx">بازگشت</asp:LinkButton>
</asp:Content>

