<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="Roles.aspx.vb" Inherits="Presentation_CMS_Login_Roles" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 100%;
        }
        .style6
        {
            color: #000000;
        }
        .style7
        {
            color: #FF0000;
        }
        .style8
        {
            text-align: center;
        }
        .style10
        {
            width: 108px;
        }
        .style11
        {
            color: #000000;
            width: 108px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table class="style1">
            <tr>
                <td style="text-align: right; font-family: Tahoma; font-size: 11px">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table class="style2">
                                <tr>
                                    <td>
                                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                                        </asp:ScriptManager>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:MultiView ID="MultiView" runat="server">
                                            <asp:View ID="V_Full" runat="server">
                                                <table class="style2">
                                                    <tr>
                                                        <td style="background-color: #DF5F00; color: #000000;">
                                                            لیست&nbsp; کامل مدیران سایت ... اعم از مدیران و غیره&nbsp;:<br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background-color: #CCCCCC">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:GridView ID="DG_Users" runat="server" AutoGenerateColumns="False" 
                                                                CellPadding="4" DataSourceID="OSD_AllUser" ForeColor="Black" GridLines="Horizontal" 
                                                                Width="464px" AllowPaging="True" AllowSorting="True" PageSize="5" 
                                                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                                <Columns>
                                                                    <asp:BoundField DataField="username" HeaderText="نام کاربری" 
                                                                        SortExpression="username" />
                                                                    <asp:BoundField DataField="email" HeaderText="آدرس الکترونیکی" 
                                                                        SortExpression="email" />
                                                                    <asp:BoundField DataField="lastlogindate" HeaderText="آخرین تاریخ ورود" 
                                                                        SortExpression="lastlogindate" />
                                                                    <asp:BoundField DataField="createdate" HeaderText="تاریخ ایجاد کاربر" 
                                                                        SortExpression="createdate" />
                                                                    <asp:TemplateField HeaderText="حق دسترسی">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="Button1" runat="server" Text="... دیدن" 
                                                                            CommandArgument='<%# Eval("username","{0}") %>'
                                                                            OnCommand="ShowRoles"
                                                                            />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                            </asp:GridView>
                                                            <asp:ObjectDataSource ID="OSD_AllUser" runat="server" 
                                                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                                                TypeName="DS_MembershipTableAdapters.SelectAllUserTableAdapter">
                                                            </asp:ObjectDataSource>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lbl_username_full" runat="server" 
                                                                style="font-weight: 700; color: #006600"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:GridView ID="DG_Roles" runat="server" CellPadding="4" ForeColor="#333333" 
                                                                GridLines="None" ShowHeader="False" Width="464px">
                                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                <EditRowStyle BackColor="#999999" />
                                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background-color: #DF5F00; color: #000000;">
                                                            مدیریت حق دسترسی:</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background-color: #CCCCCC">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background-color: #CCCCCC">
                                                            <table class="style2">
                                                                <tr>
                                                                    <td class="style7">
                                                                        <asp:RadioButton ID="Rb_Delete" runat="server" AutoPostBack="True" 
                                                                            GroupName="Roles" Text="حذف حق دسترسی" style="color: #000000" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButton ID="Rb_Create" runat="server" AutoPostBack="True" 
                                                                            Checked="True" GroupName="Roles" Text="اضافه کردن حق دسترسی" 
                                                                            style="color: #000000" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table class="style5">
                                                                <tr>
                                                                    <td class="style10">
                                                                        <span class="style6">کاربر:</span></td>
                                                                    <td>
                                                                        <asp:DropDownList ID="Cmb_Users" runat="server" AutoPostBack="True">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style11">
                                                                        حق دسترسی به:</td>
                                                                    <td>
                                                                        <asp:DropDownList ID="cmb_Roles" runat="server">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style11">
                                                                        &nbsp;</td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Button ID="btn_acceptRole_Full" runat="server" 
                                                                style="font-family: Tahoma; font-size: 11px" Text="دادن حق دسترسی" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lbl_ShowUSerBeforDelete" runat="server" 
                                                                style="color: #006600; font-weight: 700"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="lbl_acceptGetRole_Full" runat="server" style="color: #FF0000"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:GridView ID="DG_RoleUser_Full" runat="server" CellPadding="4" 
                                                                ForeColor="#333333" GridLines="None" ShowHeader="False" Width="462px">
                                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                <EditRowStyle BackColor="#999999" />
                                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background-color: #DF5F00; color: #000000;">
                                                            توضیح در مورد حق دسترسی ها:</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background-color: #CCCCCC">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                                                CellPadding="4" DataSourceID="SDS_DetailRole" ForeColor="Black" 
                                                                GridLines="Horizontal" Width="463px" BackColor="White" 
                                                                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                                <Columns>
                                                                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                                                        ReadOnly="True" SortExpression="id" Visible="False" />
                                                                    <asp:BoundField DataField="Role" HeaderText="نام حق دسترسی" 
                                                                        SortExpression="Role" />
                                                                    <asp:BoundField DataField="Page" HeaderText="اسم صفحه" SortExpression="Page" />
                                                                    <asp:BoundField DataField="Detail" HeaderText="توضیحات" 
                                                                        SortExpression="Detail" />
                                                                </Columns>
                                                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                </table>
                                            </asp:View>
                                            <asp:View ID="V_Custom" runat="server">
                                                <table class="style2">
                                                    <tr>
                                                        <td>
                                                            <table class="style5">
                                                                <tr>
                                                                    <td class="style6">
                                                                        نام کاربری:</td>
                                                                    <td>
                                                                        <asp:TextBox ID="txt_username" runat="server" ReadOnly="True" 
                                                                            style="text-align: left" Width="198px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style6">
                                                                        حق دسترسی بصورت:</td>
                                                                    <td>
                                                                        <asp:DropDownList ID="Cmd_Roles_Custom" runat="server" style="text-align: left">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style6">
                                                                        &nbsp;</td>
                                                                    <td>
                                                                        <asp:Button ID="btn_acceptRole" runat="server" 
                                                                            style="font-family: Tahoma; font-size: 11px" Text="دادن حق دسترسی" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style6">
                                                                        &nbsp;</td>
                                                                    <td>
                                                                        <asp:Label ID="lbl_acceptGetRole" runat="server" style="color: #FF0000"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right; background-color: #DF5F00; color: #000000;">
                                                            لیست حق دسترسی های داده شده به این کاربر عبارتند از:</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right; background-color: #CCCCCC;">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            <asp:GridView ID="DG_RoleUser" runat="server" CellPadding="4" 
                                                                ForeColor="#333333" GridLines="None" ShowHeader="False" style="font-size: 12px" 
                                                                Width="463px">
                                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                <EditRowStyle BackColor="#999999" />
                                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background-color: #DF5F00; color: #000000;">
                                                            توضیح در مورد حق دسترسی ها:</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background-color: #CCCCCC">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                                                                CellPadding="4" DataSourceID="SDS_DetailRole" ForeColor="Black" 
                                                                GridLines="Horizontal" Width="463px">
                                                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                                <Columns>
                                                                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                                                        ReadOnly="True" SortExpression="id" Visible="False" />
                                                                    <asp:BoundField DataField="Role" HeaderText="نام حق دسترسی" 
                                                                        SortExpression="Role" />
                                                                    <asp:BoundField DataField="Page" HeaderText="اسم صفحه" SortExpression="Page" />
                                                                    <asp:BoundField DataField="Detail" HeaderText="توضیحات" 
                                                                        SortExpression="Detail" />
                                                                </Columns>
                                                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                            </asp:GridView>
                                                            <asp:SqlDataSource ID="SDS_DetailRole" runat="server" 
                                                                ConnectionString="<%$ ConnectionStrings:ModulesConnectionString %>" 
                                                                SelectCommand="SELECT * FROM [Tbl_DetailRoles]"></asp:SqlDataSource>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background-color: #333333">
                                                            <span class="style4"><span class="style7">نکته:</span><br />
                                                            </span>&nbsp;بصورت تکی بکار میروند<asp:Label ID="Label1" runat="server" 
                                                                Text="Adminstrator  و Guest"></asp:Label>
                                                            &nbsp;هر کدام از حق دسترسی های<br />
                                                            و با حق دسترسی دیگر دسترسی نمی آیند.</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Button ID="btn_CompleteList" runat="server" 
                                                                OnClientClick="return confirm('با رفتن به بخش {لیست کامل کاربران} دیگر به این صفحه باز نمی گردید','توجه');" 
                                                                style="font-family: Tahoma; font-size: 11px" Text="دیدن لیست کامل کاربران" 
                                                                Width="155px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:View>
                                            <br />
                                            <br />
                                        </asp:MultiView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
                                            AssociatedUpdatePanelID="UpdatePanel1">
                                            <ProgressTemplate>
                                                <div class="style8">
                                                    <span class="style7">&nbsp;در حال بارگذاری...
                                                    <img alt="" class="style7" src="../../../Content/Images/loading1.gif" 
                                                        style="width: 18px; height: 17px" /></span></div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="style2">
                                            <tr>
                                                <td style="text-align: right">
                                                    <asp:Button ID="btn_CreateUser_2" runat="server" 
                                                        style="font-family: Tahoma; font-size: 11px" Text="ایجاد کاربر" />
                                                    <asp:Button ID="btn_JumpManager_2" runat="server" 
                                                        style="font-family: Tahoma; font-size: 11px" Text="بخش مدیریت کاربران" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
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

