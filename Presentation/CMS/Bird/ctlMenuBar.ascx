<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctlMenuBar.ascx.vb" Inherits="Presentation_CMS_Bird_ctlMenuBar" %>

  <style type="text/css">
    .OuterPanel
    {
     /*float:left;*/
     margin:15px;
     border:solid 2px silver;
     background-color:#A6A6A6;
    }
    .ItemPanel
    {
     float:right;/*to keep the items in horizontal*/
     border:solid 1px gray;
     background-color:silver;
     margin:2px;
     padding:10px 10px 10px 10px;
     color:#606060;
     font:Calibri;
     font-size:small;
    }
      .style1
      {
          width: 100%;
      }
    </style>
   
<table class="OuterPanel">
    <tr>
        <td class="ItemPanel">
            <a href="AddCategory.aspx">افزودن گروه</a> 
        </td>
        <td class="ItemPanel">
            <a href="AddBird.aspx">افزودن مشخصات حیوانات</a>
        </td>
        <td class="ItemPanel">
            <a href="BirdList.aspx">لیست کلیه حیوانات باغ</a>
        </td>
        <td class="ItemPanel">
            <a href="SaleList.aspx">لیست حیوانات فروشی</a>
        </td>
        <td class="ItemPanel">
            <a href="Add2Gallery.aspx">مدیریت گالری تصاویر</a>
        </td>
    </tr>
</table>