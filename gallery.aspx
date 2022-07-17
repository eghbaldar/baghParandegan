<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="gallery.aspx.vb" Inherits="gallery" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td style="text-align: right; margin-left: 40px;">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource1"
                    Width="450px" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div style="direction:rtl">
                        
                         <a href='<%# Eval("PicName","images\birdpicture\{0}") %>' target="_blank">
                            <asp:Image ID="Image1" runat="server" BorderColor="#A4A4A4" BorderWidth="3px" Height="82px"
                                ImageUrl='<%# Eval("picname", "~\images\birdpicture\{0}") %>' Width="108px" />
                         </a>
                                
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>"
                    SelectCommand="SELECT * FROM [Tbl_BirdGallery]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
