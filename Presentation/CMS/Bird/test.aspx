<%@ Page Language="VB" AutoEventWireup="false" CodeFile="test.aspx.vb" Inherits="Presentation_CMS_Bird_test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
 <style type="text/css">
    .OuterPanel
    {
     float:left  ;
     border:solid 10px silver;
     background-color:#A6A6A6;
    }
    .ItemPanel
    {
     float:left;/*to keep the items in horizontal*/
     border:solid 1px gray;
     background-color:silver;
     margin:2px;
     /*padding:5px 2px 5px 2px;*/
     padding:10px 10px 10px 10px;
     color:#606060;
     font:Calibri;
     font-size:small;
    }
    </style>    
</head>
<body>
    <form id="form1" runat="server">
    
<%--    <div class="OuterPanel">
    
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="ItemPanel">
                    <a href=#>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name_Category")%>'></asp:Label>
                    </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
            SelectCommand="SELECT [Name_Category] FROM [Tbl_GoodsCategory]">
        </asp:SqlDataSource>
    
    </div>
--%>    

<div class="OuterPanel">

        <div class="ItemPanel">
            <a href=#>افزودن گروه</a>
        </div>
        <div class="ItemPanel">
            <a href=#>افزودن مشخصات حیوانات</a>
        </div>
        <div class="ItemPanel">
            <a href=#>لیست کلیه حیوانات باغ</a>
        </div>
        <div class="ItemPanel">
            <a href=#>لیست حیوانات فروشی</a>
        </div>
        <div class="ItemPanel">
            <a href=#>گالری تصاویر حیوانات</a>
        </div>
        <div class="ItemPanel">
            <a href=#>لیست درخواست های خرید</a>
        </div>
    
    </div>

 </form>
</body>
</html>
