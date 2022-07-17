<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="Add_News.aspx.vb" Inherits="Presentation_CMS_News_Add_News" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
    <style type="text/css">
        .style5
        {
            width: 97%;
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
                    style="width: 763px; height: 45px" /><asp:GridView ID="DG" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" 
                    GridLines="Horizontal" Width="761px">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="title_news" HeaderText="عنوان خبر" 
                            SortExpression="title_news" >
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="lid_news" HeaderText="متن کوتاه" HtmlEncode="False" 
                            HtmlEncodeFormatString="False" SortExpression="lid_news" >
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="news" HeaderText="news" SortExpression="news" 
                            Visible="False" />
                        <asp:BoundField DataField="tarikh" HeaderText="تاریخ درج خبر" 
                            SortExpression="tarikh" >
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" 
                            Visible="False" />
                        <asp:BoundField DataField="Username" HeaderText="Username" 
                            SortExpression="Username" Visible="False" />
                        <asp:BoundField DataField="Code_Category" HeaderText="Code_Category" 
                            SortExpression="Code_Category" Visible="False" />
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
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                    SelectCommand="SELECT * FROM [Tbl_News] ORDER BY [ID] DESC">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="lbl_DG" runat="server" style="color: #FF0000"></asp:Label>
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
                        <td class="style7">
                            گروه خبر:</td>
                        <td class="style9">
                            <asp:DropDownList ID="cmb_category" runat="server" 
                                DataSourceID="ObjectDataSource1" DataTextField="Name_Category" 
                                DataValueField="Code_Category" Height="22px" 
                                style="font-family: Tahoma; font-size: 12px" Width="465px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style9">
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                                OldValuesParameterFormatString="original_{0}" SelectMethod="SelectAllCategory" 
                                TypeName="News_" DeleteMethod="Delete_NewsCategory" 
                                InsertMethod="Insert_NewsCategory" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Code" Type="Int64" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="title" Type="String" />
                                    <asp:Parameter Name="lid" Type="String" />
                                    <asp:Parameter Name="news" Type="String" />
                                    <asp:Parameter Name="E" Type="Int32" />
                                    <asp:Parameter Name="UN" Type="String" />
                                    <asp:Parameter Name="Code_Cat" Type="Int64" />
                                    <asp:Parameter Name="id" Type="Int32" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            عنوان خبر :</td>
                        <td class="style9">
                            <asp:TextBox ID="txt_title_news" runat="server" Height="19px" 
                                style="font-family: Tahoma; font-size: 11px" Width="465px"></asp:TextBox>
                            </span>
                            <span dir="rtl" onkeypress="FKeyPress()">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txt_title_news" ErrorMessage="*" 
                                ValidationGroup="insert_news"></asp:RequiredFieldValidator>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            متن کوتاه خبر:</td>
                        <td class="style9">
                            <FCKeditorV2:FCKeditor ID="txt_matnkotah_news" runat="server" 
                                BasePath="~/Content/fckeditor/" ToolbarSet="Short">
                            </FCKeditorV2:FCKeditor>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            متن کامل خبر:</td>
                        <td class="style9">
                            <FCKeditorV2:FCKeditor ID="FCK_News" runat="server" 
                                BasePath="~/Content/fckeditor/" Height="400px" Width="100%">
                            </FCKeditorV2:FCKeditor>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            وضعیت خبر:</td>
                        <td class="style9">
                            <table class="style5">
                                <tr>
                                    <td>
                            <asp:RadioButton ID="rb_enable" runat="server" Checked="True" GroupName="E" 
                                Text="نمایش داده شود" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                            <asp:RadioButton ID="rb_disable" runat="server" GroupName="E" Text="نمایش داده نشود" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style9">
                            <asp:Button ID="btn_news" runat="server" 
                                style="font-family: Tahoma; font-size: 11px" Text="ارسال" 
                                ValidationGroup="insert_news" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            &nbsp;</td>
                        <td class="style9">
                            <asp:Label ID="lbl_news" runat="server" style="color: #FF0000"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; background-color: #FFFFFF">
                <asp:ImageButton ID="btn_back" runat="server" 
                    ImageUrl="~/Content/Images/back.gif" />
            </td>
        </tr>
    </table>

            

</asp:Content>

