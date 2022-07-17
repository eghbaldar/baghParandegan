<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="ManagementUser.aspx.vb" Inherits="Presentation_CMS_Login_ManagementUser" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script language="javascript" type="text/javascript">
        function ShowInfo(str){
        window.open("ShowProfileUser.aspx?UserID="+str ,'nwwin', 'toolbar=0,location=0,directories=0,status=0,menubar=no,scrollbars=yes,resizable=no,width=650,height=495');        
        return false;
        }
    </script>
    <style type="text/css">
        .style5
        {
            width: 100%;
        }
        .style9
        {
            text-align: center;
            color: #000000;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table class="style1">
        <tr>
            <td class="style5">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" >
                    <ContentTemplate>
                        <table class="style2">
                            <tr>
                                <td>
                                    <asp:ScriptManager ID="ScriptManager2" runat="server" >
                                    </asp:ScriptManager>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_pic" runat="server" AutoPostBack="True" 
                                        Text="وضعیت نمایش تصویر کاربران" style="color: #000000" />
                                </td>
                            </tr>
                            <tr>
                                <td>

                                    <asp:GridView ID="DG_AllUser" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="4" DataSourceID="ODS" ForeColor="Black" GridLines="Horizontal" 
                                        Width="515px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
                                        BorderWidth="1px" AllowPaging="True">
                                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                        <Columns>
                                            <asp:BoundField DataField="UN" HeaderText="نام کاربری" SortExpression="UN" />
                                            <asp:BoundField DataField="email" HeaderText="آدرس الکترونیکی" 
                                                SortExpression="email" />
                                            <asp:BoundField DataField="lastlogindate" HeaderText="آخرین ورود" 
                                                SortExpression="lastlogindate" />
                                            <asp:BoundField DataField="createdate" HeaderText="تاریخ ایجاد" 
                                                SortExpression="createdate" />
                                            <asp:TemplateField SortExpression="image" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("image") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" Height="76px" 
                                                        ImageUrl='<%# Eval("image", "{0}") %>' Width="67px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" 
                                                        OnClientClick='<%# Eval("UN","return ShowInfo(""{0}"")") %>' Text="...مشاهده"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton2" runat="server" 
                                                        CommandArgument='<%# Eval("UN","{0}") %>' ImageUrl="~/Content/Images/edit.gif" 
                                                        OnCommand="EditUser" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField SortExpression="UN">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("UN") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" 
                                                        CommandArgument='<%# Eval("UN","{0}") %>' 
                                                        ImageUrl="~/Content/Images/delete.gif" 
                                                        OnClientClick="return confirm('آیا ازحذف این کاربر مطمئن هستید؟');" 
                                                        OnCommand="DeleteUser" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                    </asp:GridView>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ObjectDataSource ID="ODS" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="DS_MembershipTableAdapters.SelectAllUser_ByPictureTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView1" runat="server">
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_satuse" runat="server" style="color: #FF0000"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:MultiView ID="M" runat="server">
                                        <asp:View ID="View1" runat="server">
                                            <table class="style2">
                                                <tr>
                                                    <td>
                                                        &nbsp;<asp:LinkButton class="S"  ID="btn_closeEdit" runat="server" 
                                                            style="color: #FF0000">[ بستن قسمت ویرایش ]</asp:LinkButton>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton class="S" ForeColor="Blue" ID="btn_1" runat="server">ویرایش اطلاعات اصلی</asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton class="S" ForeColor="Blue" ID="btn_2" runat="server">ویرایش اطلاعات ثانویه</asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton class="S" ForeColor="Blue" ID="btn_showChangePic" runat="server">تغییر تصویر کاربر</asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:MultiView ID="M_Edit" runat="server">
                                                            <asp:View ID="V_Orgin" runat="server">
                                                                <table class="style2" style="width: 503px">
                                                                    <tr>
                                                                        <td style="background-color: #333333">
                                                                            <asp:Label ID="Label1" runat="server" style="color: #FFFFFF" 
                                                                                Text="تغییر کلمه عبور:"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <table class="style5">
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="Label2" runat="server" Text="کلمه عبور:" style="color: #000000"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="Pass" runat="server" TextMode="Password" ValidationGroup="PC"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                                                            ControlToValidate="Pass" ErrorMessage="*" ValidationGroup="PC"></asp:RequiredFieldValidator>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="Label3" runat="server" style="color: #000000" 
                                                                                            Text="تکرار کلمه عبور:"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="Again_Pass" runat="server" TextMode="Password" 
                                                                                            ValidationGroup="PC"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                                                            ControlToValidate="Again_Pass" ErrorMessage="*" ValidationGroup="PC"></asp:RequiredFieldValidator>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        &nbsp;</td>
                                                                                    <td>
                                                                                        <asp:Button ID="Btn_ChangePass" runat="server" 
                                                                                            style="font-family: Tahoma; font-size: 11px" Text="تغییر کلمه عبور" 
                                                                                            ValidationGroup="PC" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        &nbsp;</td>
                                                                                    <td>
                                                                                        <asp:Label ID="lbl_changePass" runat="server" style="color: #006600"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        &nbsp;</td>
                                                                                    <td>
                                                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                                                            ControlToCompare="Pass" ControlToValidate="Again_Pass" 
                                                                                            ErrorMessage="کلمه عبور با تکرار آن هم خوانی ندارد" ValidationGroup="PC"></asp:CompareValidator>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <br />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="background-color: #333333">
                                                                            <asp:Label ID="Label4" runat="server" style="color: #FFFFFF" 
                                                                                Text="تغییر آدرس الکترونیکی:"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <table class="style5">
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="Label5" runat="server" style="color: #000000" 
                                                                                            Text="آدرس الکترونیکی جاری:"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lbl_email" runat="server" 
                                                                                            style="color: #0000FF; font-weight: 700"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="Label6" runat="server" style="color: #000000" 
                                                                                            Text="آدرس الکترونیکی جدید:"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="Email" runat="server" ValidationGroup="EC" Width="150px"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                                                            ControlToValidate="Email" ErrorMessage="*" ValidationGroup="EC"></asp:RequiredFieldValidator>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        &nbsp;</td>
                                                                                    <td>
                                                                                        <asp:Button ID="Btn_ChangeEmail" runat="server" 
                                                                                            style="font-family: Tahoma; font-size: 11px" Text="تغییر آدرس الکترونیکی" 
                                                                                            ValidationGroup="EC" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        &nbsp;</td>
                                                                                    <td>
                                                                                        <asp:Label ID="lbl_ChangeEmail" runat="server" style="color: #006600"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        &nbsp;</td>
                                                                                    <td>
                                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                                                                            ControlToValidate="Email" ErrorMessage="،فرمت آدرس الکترونیکی صحیح نمی باشد" 
                                                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                                                            ValidationGroup="EC"></asp:RegularExpressionValidator>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <br />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                </table>
                                                            </asp:View>
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
       <asp:View ID="V_Two" runat="server">
                                                                <table class="style5">
        <tr>
            <td style="background-color: #333333">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <table class="style5">
                    <tr>
                        <td>
                            نام خانوادگی:</td>
                        <td>
                                                                                        <asp:TextBox ID="ln" runat="server" 
                                                                                            style="text-align: right; font-family: Tahoma;"></asp:TextBox>
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            نام:</td>
                        <td>
                                                                                        <asp:TextBox ID="fn" runat="server" 
                                                                                            style="text-align: right; font-family: Tahoma;"></asp:TextBox>
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            تاریخ تولد:</td>
                        <td>
                            <table class="style5">
                                <tr>
                                    <td>
                                                                                                    <asp:DropDownList ID="cmb_roz" runat="server">
                                                                                                        <asp:ListItem></asp:ListItem>
                                                                                                        <asp:ListItem>1</asp:ListItem>
                                                                                                        <asp:ListItem>2</asp:ListItem>
                                                                                                        <asp:ListItem>3</asp:ListItem>
                                                                                                        <asp:ListItem>4</asp:ListItem>
                                                                                                        <asp:ListItem>5</asp:ListItem>
                                                                                                        <asp:ListItem>6</asp:ListItem>
                                                                                                        <asp:ListItem>7</asp:ListItem>
                                                                                                        <asp:ListItem>8</asp:ListItem>
                                                                                                        <asp:ListItem>9</asp:ListItem>
                                                                                                        <asp:ListItem>10</asp:ListItem>
                                                                                                        <asp:ListItem>11</asp:ListItem>
                                                                                                        <asp:ListItem>12</asp:ListItem>
                                                                                                        <asp:ListItem>13</asp:ListItem>
                                                                                                        <asp:ListItem>14</asp:ListItem>
                                                                                                        <asp:ListItem>15</asp:ListItem>
                                                                                                        <asp:ListItem>16</asp:ListItem>
                                                                                                        <asp:ListItem>17</asp:ListItem>
                                                                                                        <asp:ListItem>18</asp:ListItem>
                                                                                                        <asp:ListItem>19</asp:ListItem>
                                                                                                        <asp:ListItem>20</asp:ListItem>
                                                                                                        <asp:ListItem>21</asp:ListItem>
                                                                                                        <asp:ListItem>22</asp:ListItem>
                                                                                                        <asp:ListItem>23</asp:ListItem>
                                                                                                        <asp:ListItem>24</asp:ListItem>
                                                                                                        <asp:ListItem>25</asp:ListItem>
                                                                                                        <asp:ListItem>26</asp:ListItem>
                                                                                                        <asp:ListItem>27</asp:ListItem>
                                                                                                        <asp:ListItem>28</asp:ListItem>
                                                                                                        <asp:ListItem>29</asp:ListItem>
                                                                                                        <asp:ListItem>30</asp:ListItem>
                                                                                                        <asp:ListItem>31</asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </td>
                                    <td>
                                        /</td>
                                    <td>
                                                                                                    <asp:DropDownList ID="cmb_mah" runat="server" 
                                                                                                        style="font-family: Tahoma; font-size: 11px">
                                                                                                        <asp:ListItem></asp:ListItem>
                                                                                                        <asp:ListItem Value="فروردین">فروردین</asp:ListItem>
                                                                                                        <asp:ListItem Value="اردیبهشت">اردیبهشت</asp:ListItem>
                                                                                                        <asp:ListItem Value="خرداد">خرداد</asp:ListItem>
                                                                                                        <asp:ListItem Value="تیر">تیر</asp:ListItem>
                                                                                                        <asp:ListItem Value="مرداد">مرداد</asp:ListItem>
                                                                                                        <asp:ListItem Value="شهریور">شهریور</asp:ListItem>
                                                                                                        <asp:ListItem Value="مهر">مهر</asp:ListItem>
                                                                                                        <asp:ListItem Value="آبان">آبان</asp:ListItem>
                                                                                                        <asp:ListItem Value="آذر">آذر</asp:ListItem>
                                                                                                        <asp:ListItem Value="دی">دی</asp:ListItem>
                                                                                                        <asp:ListItem Value="بهمن">بهمن</asp:ListItem>
                                                                                                        <asp:ListItem Value="اسفند">اسفند</asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </td>
                                    <td>
                                        /</td>
                                    <td>
                                                                                                    <asp:DropDownList ID="cmb_sal" runat="server" Height="16px">
                                                                                                        <asp:ListItem></asp:ListItem>
                                                                                                        <asp:ListItem>1319</asp:ListItem>
                                                                                                        <asp:ListItem>1320</asp:ListItem>
                                                                                                        <asp:ListItem>1321</asp:ListItem>
                                                                                                        <asp:ListItem>1322</asp:ListItem>
                                                                                                        <asp:ListItem>1323</asp:ListItem>
                                                                                                        <asp:ListItem>1324</asp:ListItem>
                                                                                                        <asp:ListItem>1325</asp:ListItem>
                                                                                                        <asp:ListItem>1326</asp:ListItem>
                                                                                                        <asp:ListItem>1327</asp:ListItem>
                                                                                                        <asp:ListItem>1328</asp:ListItem>
                                                                                                        <asp:ListItem>1329</asp:ListItem>
                                                                                                        <asp:ListItem>1330</asp:ListItem>
                                                                                                        <asp:ListItem>1331</asp:ListItem>
                                                                                                        <asp:ListItem>1332</asp:ListItem>
                                                                                                        <asp:ListItem>1333</asp:ListItem>
                                                                                                        <asp:ListItem>1334</asp:ListItem>
                                                                                                        <asp:ListItem>1335</asp:ListItem>
                                                                                                        <asp:ListItem>1336</asp:ListItem>
                                                                                                        <asp:ListItem>1337</asp:ListItem>
                                                                                                        <asp:ListItem>1338</asp:ListItem>
                                                                                                        <asp:ListItem>1339</asp:ListItem>
                                                                                                        <asp:ListItem>1340</asp:ListItem>
                                                                                                        <asp:ListItem>1341</asp:ListItem>
                                                                                                        <asp:ListItem>1342</asp:ListItem>
                                                                                                        <asp:ListItem>1343</asp:ListItem>
                                                                                                        <asp:ListItem>1344</asp:ListItem>
                                                                                                        <asp:ListItem>1345</asp:ListItem>
                                                                                                        <asp:ListItem>1346</asp:ListItem>
                                                                                                        <asp:ListItem>1347</asp:ListItem>
                                                                                                        <asp:ListItem>1348</asp:ListItem>
                                                                                                        <asp:ListItem>1349</asp:ListItem>
                                                                                                        <asp:ListItem>1350</asp:ListItem>
                                                                                                        <asp:ListItem>1351</asp:ListItem>
                                                                                                        <asp:ListItem>1352</asp:ListItem>
                                                                                                        <asp:ListItem>1353</asp:ListItem>
                                                                                                        <asp:ListItem>1354</asp:ListItem>
                                                                                                        <asp:ListItem>1355</asp:ListItem>
                                                                                                        <asp:ListItem>1356</asp:ListItem>
                                                                                                        <asp:ListItem>1357</asp:ListItem>
                                                                                                        <asp:ListItem>1358</asp:ListItem>
                                                                                                        <asp:ListItem>1359</asp:ListItem>
                                                                                                        <asp:ListItem>1360</asp:ListItem>
                                                                                                        <asp:ListItem>1361</asp:ListItem>
                                                                                                        <asp:ListItem>1362</asp:ListItem>
                                                                                                        <asp:ListItem>1363</asp:ListItem>
                                                                                                        <asp:ListItem>1364</asp:ListItem>
                                                                                                        <asp:ListItem>1365</asp:ListItem>
                                                                                                        <asp:ListItem>1366</asp:ListItem>
                                                                                                        <asp:ListItem>1367</asp:ListItem>
                                                                                                        <asp:ListItem>1368</asp:ListItem>
                                                                                                        <asp:ListItem>1369</asp:ListItem>
                                                                                                        <asp:ListItem>1370</asp:ListItem>
                                                                                                        <asp:ListItem>1371</asp:ListItem>
                                                                                                        <asp:ListItem>1372</asp:ListItem>
                                                                                                        <asp:ListItem>1373</asp:ListItem>
                                                                                                        <asp:ListItem>1374</asp:ListItem>
                                                                                                        <asp:ListItem>1375</asp:ListItem>
                                                                                                        <asp:ListItem>1376</asp:ListItem>
                                                                                                        <asp:ListItem>1377</asp:ListItem>
                                                                                                        <asp:ListItem>1378</asp:ListItem>
                                                                                                        <asp:ListItem>1379</asp:ListItem>
                                                                                                        <asp:ListItem>1380</asp:ListItem>
                                                                                                        <asp:ListItem>1381</asp:ListItem>
                                                                                                        <asp:ListItem>1382</asp:ListItem>
                                                                                                        <asp:ListItem>1383</asp:ListItem>
                                                                                                        <asp:ListItem>1384</asp:ListItem>
                                                                                                        <asp:ListItem>1385</asp:ListItem>
                                                                                                        <asp:ListItem>1386</asp:ListItem>
                                                                                                        <asp:ListItem>1387</asp:ListItem>
                                                                                                        <asp:ListItem>1388</asp:ListItem>
                                                                                                        <asp:ListItem>1389</asp:ListItem>
                                                                                                        <asp:ListItem>1390</asp:ListItem>
                                                                                                        <asp:ListItem>1391</asp:ListItem>
                                                                                                        <asp:ListItem>1392</asp:ListItem>
                                                                                                        <asp:ListItem>1393</asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            کد ملی:</td>
                        <td>
                                                                                        <asp:TextBox ID="code_meli" runat="server"></asp:TextBox>
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            تلفن:</td>
                        <td>
                                                                                        <asp:TextBox ID="tel" runat="server"></asp:TextBox>
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            نام پدر:</td>
                        <td>
                                                                                        <asp:TextBox ID="pedar" runat="server" 
                                                                                            style="text-align: right; font-family: Tahoma;"></asp:TextBox>
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            دین:</td>
                        <td>
                                                                                        <asp:DropDownList ID="cmb_din" runat="server" 
                                                                                            style="font-family: Tahoma; font-size: 11px">
                                                                                            <asp:ListItem>اسلام</asp:ListItem>
                                                                                            <asp:ListItem>زرتشتی</asp:ListItem>
                                                                                            <asp:ListItem>مسیحیت</asp:ListItem>
                                                                                            <asp:ListItem>یهودیت</asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            موبایل:</td>
                        <td>
                                                                                        <asp:TextBox ID="mobile" runat="server"></asp:TextBox>
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            شغل:</td>
                        <td>
                                                                                        <asp:TextBox ID="job" runat="server" 
                                                                                            style="text-align: right; font-family: Tahoma;"></asp:TextBox>
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            تحصیلات:</td>
                        <td>
                                                                                        <asp:DropDownList ID="cmb_Tahsilat" runat="server" 
                                                                                            style="font-family: Tahoma; font-size: 11px">
                                                                                            <asp:ListItem>زیر دیپلم</asp:ListItem>
                                                                                            <asp:ListItem>دیپلم دبیرستان</asp:ListItem>
                                                                                            <asp:ListItem>یک سال کالج</asp:ListItem>
                                                                                            <asp:ListItem>فوق دیپلم</asp:ListItem>
                                                                                            <asp:ListItem>لیسانس</asp:ListItem>
                                                                                            <asp:ListItem>دیپلم 5 ساله دبیرستانی</asp:ListItem>
                                                                                            <asp:ListItem>فوق لیسانس</asp:ListItem>
                                                                                            <asp:ListItem>دکتری و بالاتر</asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            وزن:</td>
                        <td>
                                                                                        <span class="style26"><span class="style28">
                                                                                        <asp:TextBox ID="Vazn" runat="server" style="text-align: left"></asp:TextBox>
                                                                                        </span></span>
                                                                                        <asp:RangeValidator ID="RangeValidator2" runat="server" 
                                                                                            ControlToValidate="Ghad" ErrorMessage="*" MaximumValue="300" MinimumValue="0" 
                                                                                            Type="Integer" ValidationGroup="CU"></asp:RangeValidator>
                                                                                        </td>
                    </tr>
                    <tr>
                        <td>
                            قد:</td>
                        <td>
                                                                                        <span class="style26"><span class="style28">
                                                                                        <asp:TextBox ID="Ghad" runat="server"></asp:TextBox>
                                                                                        </span></span>
                                                                                        <asp:RangeValidator ID="RangeValidator3" runat="server" 
                                                                                            ControlToValidate="Vazn" ErrorMessage="*" MaximumValue="500" MinimumValue="0" 
                                                                                            Type="Integer" ValidationGroup="CU"></asp:RangeValidator>
                                                                                        </td>
                    </tr>
                    <tr>
                        <td>
                            تاهل:</td>
                        <td>
                                                                                        <asp:DropDownList ID="cmb_MF" runat="server" 
                                                                                            style="font-family: Tahoma; font-size: 11px">
                                                                                            <asp:ListItem Value="0">مجرد</asp:ListItem>
                                                                                            <asp:ListItem Value="1">متاهل</asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            جنسیت:</td>
                        <td>
                                                                                        <asp:DropDownList ID="cmb_Tahool" runat="server" 
                                                                                            style="font-family: Tahoma; font-size: 11px">
                                                                                            <asp:ListItem Value="0">مرد</asp:ListItem>
                                                                                            <asp:ListItem Value="1">زن</asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            ملیت:</td>
                        <td>
                                                                                        <asp:DropDownList ID="cmb_Country" runat="server" 
                                                                                            style="font-family: Tahoma; font-size: 11px">
                                                                                            <asp:ListItem>ایرانی</asp:ListItem>
                                                                                            <asp:ListItem>غیر ایرانی</asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            تعداد بچه:</td>
                        <td>
                                                                                        <span class="style26"><span class="style28">
                                                                                        <asp:TextBox ID="Bache" runat="server"></asp:TextBox>
                                                                                        </span></span>
                                                                                        <asp:RangeValidator ID="RangeValidator4" runat="server" 
                                                                                            ControlToValidate="Bache" ErrorMessage="*" MaximumValue="100" MinimumValue="0" 
                                                                                            Type="Integer" ValidationGroup="CU"></asp:RangeValidator>
                                                                                        </td>
                    </tr>
                    <tr>
                        <td>
                            شهر:</td>
                        <td>
                                                                                        <asp:TextBox ID="city" runat="server" style="text-align: right"></asp:TextBox>
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            آدرس:</td>
                        <td>
                                                                                        <asp:TextBox ID="Address" runat="server" Height="125px" 
                                                                                            style="text-align: right; font-family: Tahoma;" TextMode="MultiLine" 
                                                                                            Width="257px"></asp:TextBox>
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            کد پستی:</td>
                        <td>
                                                                                        <asp:TextBox ID="code_posti" runat="server"></asp:TextBox>
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            آدرس الکترونیکی اول:</td>
                        <td>
                                                                                        <span class="style26"><span class="style28">
                                                                                        <asp:TextBox ID="Email_1" runat="server"></asp:TextBox>
                                                                                        </span></span>
                                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                                                            ControlToValidate="Email_1" ErrorMessage="*" 
                                                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                                                            ValidationGroup="CU"></asp:RegularExpressionValidator>
                                                                                        </td>
                    </tr>
                    <tr>
                        <td>
                            آدرس الکترونیکی دوم:</td>
                        <td>
                                                                                        <span class="style26"><span class="style28">
                                                                                        <asp:TextBox ID="Email_2" runat="server"></asp:TextBox>
                                                                                        </span></span>
                                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                                                                            ControlToValidate="Email_2" ErrorMessage="*" 
                                                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                                                            ValidationGroup="CU"></asp:RegularExpressionValidator>
                                                                                        </td>
                    </tr>
                    <tr>
                        <td>
                            آدرس وب سایت:</td>
                        <td>
                                                                                        <asp:TextBox ID="Website" runat="server"></asp:TextBox>
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                                                                                        <asp:Button ID="btn_Edit" runat="server" 
                                                                                            style="font-family: Tahoma; font-size: 11px" Text="اصلاح" />
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                                                                                        <asp:Label ID="lbl_updateUser" runat="server" style="color: #CC0000"></asp:Label>
                                                                                    </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
       </asp:View>                                                     
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            <br />
                                                        </asp:MultiView>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:View>
                                        <br />
                                    </asp:MultiView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
                                        AssociatedUpdatePanelID="UpdatePanel2">
                                        <ProgressTemplate>
                                            <div class="style9">
                                                &nbsp;<img alt="" src="../../../Content/Images/loading1.gif" 
                                                    style="width: 18px; height: 17px" />...در حال بارگذاری
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                                               
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="style5">
                                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                <table class="style2">
                    <tr>
                        <td class="style3">
                            
                            &nbsp;</td>
                        <td class="style8">
                            <asp:Button ID="Btn_RolesUser" runat="server" Text="بخش حق دسترسی کاربران" 
                                style="font-family: Tahoma; font-size: 11px" />
                        </td>
                        <td class="style8">
                            <asp:Button ID="btn_CreateUser" runat="server" Text="ایجاد کاربر" 
                                style="font-family: Tahoma; font-size: 11px" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; background-color: #FFFFFF" >
                                        <asp:ImageButton ID="btn_back" runat="server" 
                                            ImageUrl="~/Content/Images/back.gif" />
                                    </td>
        </tr>
    </table>
</asp:Content>

