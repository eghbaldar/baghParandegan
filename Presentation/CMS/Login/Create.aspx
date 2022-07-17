<%@ Page Language="VB" MasterPageFile="~/Presentation/MP_Management.master" AutoEventWireup="false" CodeFile="Create.aspx.vb" Inherits="Presentation_CMS_Login_Create" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%@ Register assembly="MSCaptcha" namespace="MSCaptcha" tagprefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
    <style type="text/css">
        .style9
        {
            width: 100%;
        }
        .style10
        {
            text-align: right;
        }
        .style11
        {
            width: 100px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style9">
        <tr>
            <td>
<asp:CreateUserWizard ID="CU" runat="server" 
                    AnswerRequiredErrorMessage="پاسخ امنیتی باید کامل گردد" 
                    CompleteSuccessText="کاربر مورد نظر با موفقیت به ثبت رسیده است" 
                    ConfirmPasswordCompareErrorMessage="کلمه عبور با تکرار آن مطابقت ندارد" 
                    ConfirmPasswordRequiredErrorMessage="تکرار کلمه عبور با کامل گردد" 
                    ContinueButtonText="ایجاد حساب کاربری دیگر" 
                    ContinueDestinationPageUrl="~/Presentation/CMS/Login/Create.aspx" 
                    CreateUserButtonText="مرحله بعدی" 
                    DuplicateEmailErrorMessage="آدرس الکترونکی وارده در قبلا در سیستم به ثبت رسیده است  , دوباره اقدام کنید" 
                    DuplicateUserNameErrorMessage="نام کاربری را عوض کنید" 
                    EmailRegularExpressionErrorMessage="لطفا آدرس الکترونیکی دیگری را وارد نمایید" 
                    EmailRequiredErrorMessage="آدرس الکترونیکی باید تکمیل گردد" 
                    InvalidAnswerErrorMessage="لطفا پاسخ امنیتی را عوض کنید" 
                    InvalidEmailErrorMessage="فرمت آدرس الکترونیکی اشتباه می باشد" 
                    InvalidPasswordErrorMessage="تعداد کارکتر های کلمه عبور صحیح نمی باشد" 
                    InvalidQuestionErrorMessage="سوال امنیتی را عوض کنید" 
                    PasswordRegularExpressionErrorMessage="کلمه عبور را عوض کنید" 
                    PasswordRequiredErrorMessage="کلمه عبور باید کامل گردد" 
                    QuestionRequiredErrorMessage="سوال امنیتی باید کامل گردد" 
                    UnknownErrorMessage="کاربر مورد نظر به ثبت نرسیده است لطفا دوباره اقدام کنید" 
                    UserNameRequiredErrorMessage="نام کاربری باید کامل گردد" Width="612px" 
        style="font-family: Tahoma; font-size: 11px" Font-Names="tahoma" 
        Font-Size="11px">
                    <FinishNavigationTemplate>
                        <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" 
                            CommandName="MovePrevious" Text="مرحله قبل" />
                        <asp:Button ID="FinishButton" runat="server" Text="پایان عملیات" />
                    </FinishNavigationTemplate>
                    <StepNavigationTemplate>
                        <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" 
                            CommandName="MovePrevious" Text="مرحله قبل" />
                        <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" 
                            Text="مرحله بعد" />
                    </StepNavigationTemplate>
                    <StartNavigationTemplate>
                        <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" 
                            Text="Next" />
                    </StartNavigationTemplate>
                    <WizardSteps>
                        <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                            <ContentTemplate>
                                <table border="0" style="font-family: Tahoma; font-size: 12px; width: 401px">
                                    <tr>
                                        <td colspan="2" class="style10">
                                            <table class="style9">
                                                <tr>
                                                    <td style="text-align: center">
                                                        <img alt="" src="Signup.png" style="width: 215px; height: 96px" /></td>
                                                </tr>
                                            </table>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style19">
                                            نام کاربری<asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                ToolTip="User Name is required." ValidationGroup="CU">*</asp:RequiredFieldValidator>
                                            :</td>
                                        <td class="style11">
                                            <asp:TextBox ID="UserName" runat="server" style="text-align: left"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style19">
                                            کلمه عبور<asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                ControlToValidate="Password" ErrorMessage="Password is required." 
                                                ToolTip="Password is required." ValidationGroup="CU">*</asp:RequiredFieldValidator>
                                            :</td>
                                        <td style="text-align: right">
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="142px" 
                                                style="text-align: left"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style19">
                                            تکرار کلمه عبور<asp:RequiredFieldValidator ID="ConfirmPasswordRequired" 
                                                runat="server" ControlToValidate="ConfirmPassword" 
                                                ErrorMessage="Confirm Password is required." 
                                                ToolTip="Confirm Password is required." ValidationGroup="CU">*</asp:RequiredFieldValidator>
                                            :</td>
                                        <td style="text-align: right">
                                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" 
                                                Width="142px" style="text-align: left"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style19">
                                            آدرس الکترونیکی<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                                                runat="server" ControlToValidate="Email" ErrorMessage="*" 
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ValidationGroup="CU"></asp:RegularExpressionValidator>
                                            :</td>
                                        <td style="text-align: right">
                                            <asp:TextBox ID="Email" runat="server" style="text-align: left"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style19">
                                            سوال امنیتی<asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                                ControlToValidate="Question" ErrorMessage="Security question is required." 
                                                ToolTip="Security question is required." ValidationGroup="CU">*</asp:RequiredFieldValidator>
                                            :</td>
                                        <td style="text-align: right">
                                            <asp:TextBox ID="Question" runat="server" style="text-align: left"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style19">
                                            پاسخ امنیتی<asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                                ControlToValidate="Answer" ErrorMessage="Security answer is required." 
                                                ToolTip="Security answer is required." ValidationGroup="CU">*</asp:RequiredFieldValidator>
                                            :</td>
                                        <td style="text-align: right">
                                            <asp:TextBox ID="Answer" runat="server" style="text-align: left"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="font-family: Tahoma; font-size: 12px" class="style10">
                                            <table class="style7">
                                                <tr>
                                                    <td class="style23">
                                                        <table class="style7">
                                                            <tr>
                                                                <td class="style8">
                                                                    <asp:RadioButton ID="Rb_InfoPublic" runat="server" AutoPostBack="True" 
                                                                        GroupName="Change" oncheckedchanged="Rb_InfoPublic_CheckedChanged" 
                                                                        Text="  تکمیل کردن اطلاعات عمومی  " />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style8">
                                                                    <asp:RadioButton ID="Rb_InfoPrivate" runat="server" AutoPostBack="True" 
                                                                        GroupName="Change" oncheckedchanged="RadioButton2_CheckedChanged" 
                                                                        Text="تکمیل کردن اطلاعات تخصصی" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style8">
                                                                    <asp:RadioButton ID="Rb_Nothing" runat="server" AutoPostBack="True" 
                                                                        Checked="True" GroupName="Change" oncheckedchanged="Rb_Nothing_CheckedChanged" 
                                                                        Text="هیچکدام" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style24">
                                                        <asp:MultiView ID="MV" runat="server">
                                                            <br />
                                                            <asp:View ID="V_Nessasry" runat="server">
                                                                <table class="style9">
                                                                    <tr>
                                                                        <td class="style10">
                                                                            :نام</td>
                                                                        <td class="style10">
                                                                            <asp:TextBox ID="fn" runat="server" 
                                                                                style="text-align: right; font-family: Tahoma;"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style10">
                                                                            :نام خانوادگی</td>
                                                                        <td class="style10">
                                                                            <asp:TextBox ID="ln" runat="server" 
                                                                                style="text-align: right; font-family: Tahoma;"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style10">
                                                                            <table class="style9">
                                                                                <tr>
                                                                                    <td>
                                                                                        تاریخ تولد(روز / ماه / سال)</td>
                                                                                    <td class="style10">
                                                                                        &nbsp;</td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td class="style10">
                                                                            <table class="style9">
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:DropDownList ID="cmb_roz" runat="server" Enabled="False">
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
                                                                                    <td class="style10">
                                                                                        <asp:DropDownList ID="cmb_mah" runat="server" 
                                                                                            style="font-family: Tahoma; font-size: 11px" Enabled="False">
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
                                                                                    <td class="style10">
                                                                                        /</td>
                                                                                    <td>
                                                                                        <asp:DropDownList ID="cmb_sal" runat="server" Height="16px" Enabled="False">
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
                                                                        <td class="style10">
                                                                            :کد ملی</td>
                                                                        <td class="style10">
                                                                            <asp:TextBox ID="CodeMeli" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style10">
                                                                            :جنسیت</td>
                                                                        <td class="style10">
                                                                            <asp:DropDownList ID="cmb_MF" runat="server" 
                                                                                style="font-size: 11px; font-family: Tahoma">
                                                                                <asp:ListItem Value="0">مرد</asp:ListItem>
                                                                                <asp:ListItem Value="1">زن</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style10">
                                                                            :تلفن</td>
                                                                        <td class="style10">
                                                                            <asp:TextBox ID="Tel" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:View>
                                                            <asp:View ID="V_NotNesseary" runat="server">
                                                                <table class="style9">
                                                                    <tr>
                                                                        <td class="style10">
                                                                            نام پدر:</td>
                                                                        <td class="style10">
                                                                            <asp:TextBox ID="pedar" runat="server" 
                                                                                style="font-family: Tahoma; font-size: 11px;"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style10">
                                                                            دین:</td>
                                                                        <td class="style10">
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
                                                                        <td class="style10">
                                                                            شهر:</td>
                                                                        <td class="style10">
                                                                            <asp:TextBox ID="City" runat="server"  
                                                                                style="font-family: Tahoma; font-size: 11px;"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style10">
                                                                            ملیت:</td>
                                                                        <td class="style10">
                                                                            <asp:DropDownList ID="cmb_Country" runat="server" 
                                                                                style="font-family: Tahoma; font-size: 11px">
                                                                                <asp:ListItem>ایرانی</asp:ListItem>
                                                                                <asp:ListItem>غیر ایرانی</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style10">
                                                                            موبایل:</td>
                                                                        <td class="style10">
                                                                            <asp:TextBox ID="Mob" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style10">
                                                                            آدرس:</td>
                                                                        <td class="style10">
                                                                            <asp:TextBox ID="Address" runat="server" Height="79px" 
                                                                                style="font-family: Tahoma; font-size: 11px;" TextMode="MultiLine" 
                                                                                Width="273px"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style10">
                                                                            کد پستی:</td>
                                                                        <td class="style10">
                                                                            <asp:TextBox ID="CodePosti" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style10">
                                                                            تحصیلات:</td>
                                                                        <td class="style10">
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
                                                                        <td class="style10">
                                                                            شغل:</td>
                                                                        <td class="style10">
                                                                            <asp:TextBox ID="Job" runat="server" 
                                                                                style="font-family: Tahoma; font-size: 11px;"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style10">
                                                                            قد:</td>
                                                                        <td class="style10">
                                                                            <asp:TextBox ID="Ghad" runat="server" style="text-align: left"></asp:TextBox>
                                                                            <asp:RangeValidator ID="RangeValidator2" runat="server" 
                                                                                ControlToValidate="Ghad" ErrorMessage="*" MaximumValue="300" MinimumValue="0" 
                                                                                Type="Integer" ValidationGroup="CU"></asp:RangeValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style10">
                                                                            وزن:</td>
                                                                        <td class="style10">
                                                                            <asp:TextBox ID="Vazn" runat="server" style="text-align: left"></asp:TextBox>
                                                                            <asp:RangeValidator ID="RangeValidator3" runat="server" 
                                                                                ControlToValidate="Vazn" ErrorMessage="*" MaximumValue="500" MinimumValue="0" 
                                                                                Type="Integer" ValidationGroup="CU"></asp:RangeValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style10">
                                                                            وضعیت تاهل:</td>
                                                                        <td class="style10">
                                                                            <asp:DropDownList ID="cmb_Tahool" runat="server" 
                                                                                style="font-family: Tahoma; font-size: 11px">
                                                                                <asp:ListItem Value="0">مجرد</asp:ListItem>
                                                                                <asp:ListItem Value="1">متاهل</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style10">
                                                                            تعداد بچه ها:</td>
                                                                        <td class="style10">
                                                                            <asp:TextBox ID="Bache" runat="server" style="text-align: left">0</asp:TextBox>
                                                                            <asp:RangeValidator ID="RangeValidator4" runat="server" 
                                                                                ControlToValidate="Bache" ErrorMessage="*" MaximumValue="100" MinimumValue="0" 
                                                                                Type="Integer" ValidationGroup="CU"></asp:RangeValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style10">
                                                                            آدرس الکترونیکی یک:</td>
                                                                        <td class="style10">
                                                                            <asp:TextBox ID="Email_1" runat="server" style="text-align: left"></asp:TextBox>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                                                ControlToValidate="Email_1" ErrorMessage="*" 
                                                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                                                ValidationGroup="CU"></asp:RegularExpressionValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style10">
                                                                            آدرس الکترونیکی دو:</td>
                                                                        <td class="style10">
                                                                            <asp:TextBox ID="Email_2" runat="server" style="text-align: left"></asp:TextBox>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                                                                ControlToValidate="Email_2" ErrorMessage="*" 
                                                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                                                ValidationGroup="CU"></asp:RegularExpressionValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style10">
                                                                            وب سایت:</td>
                                                                        <td class="style10">
                                                                            <asp:TextBox ID="Website" runat="server" style="text-align: left"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:View>
                                                            <br />
                                                        </asp:MultiView>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style10">
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="style10">
                                            <table class="style9">
                                                <tr>
                                                    <td style="text-align: center">
                                                        <cc1:CaptchaControl ID="MSCaptchaPicture" runat="server" 
                                                            CaptchaFontWarping="High" Width="179px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style19" style="text-align: right;">
                                            <asp:Label ID="Label1" runat="server" style="color: #000000" Text=":کد امنیتی"></asp:Label>
                                        </td>
                                        <td align="center" style="color: Red; text-align: right;">
                                            <asp:TextBox ID="SecurityCode" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ControlToValidate="SecurityCode" ErrorMessage="*" ValidationGroup="CU"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="color: Red;" class="style10">
                                            <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                                ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                                Display="Dynamic" ErrorMessage="کلمه عبور و تکرار آن مطابقت ندارند" 
                                                ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="color: Red;" class="style10">
                                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="color: Red;" class="style10">
                                            <asp:Label ID="lbl_CodeSecurity" runat="server" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="color: Red;" class="style10">
                                            <asp:Label ID="lbl_Picture" runat="server" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:CreateUserWizardStep>
                        <asp:WizardStep ID="WizardStep1" runat="server" Title="SelectPicture" StepType="Step">
                        
                        
                        

                
                            <table class="style20">
                                <tr>
                                    <td class="style16">
                                        <table class="style9">
                                            <tr>
                                                <td style="background-color: #FFFFFF">
                                                    <asp:Label ID="Label3" runat="server" 
                                                        style="font-family: Tahoma; font-size: 11px; color: #FF0000" 
                                                        Text="عکس باید از 70 کلیو بایت کمتر باشد"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        <table class="style9">
                                            <tr>
                                                <td style="background-color: #FFFFFF">
                                                    <asp:Label ID="Label2" runat="server" 
                                                        style="font-family: Tahoma; font-size: 11px; color: #FF0000" 
                                                        Text="اگر در این مرحله عکسی انتخاب نشود , عکس پیش فرض لحاظ خواهد شد"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                    
                                    
                                    
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <fieldset style="width: 400px">
                                                
                                                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                    </asp:ScriptManager>
                                                    
                                                    <asp:FileUpload ID="FileUpload" runat="server"/>

                                                    <asp:Button ID="UploadButton" runat="server" OnClick="UploadButton_Click" 
                                                      style="font-family: Tahoma; font-size: 11px" Text="ارسال عکس" Width="223px" />
                                                </fieldset>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="UploadButton" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        
                                        
                                        
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        <asp:Label ID="lbl_wrong" runat="server" 
                                            style="text-align: center; color: #FF0000; font-family: Tahoma; font-size: 11px"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style16">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        
                    <br />

                        </asp:WizardStep>
                        <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                            <ContentTemplate>
                                <table border="0" style="font-size:100%;width:405px;">
                                    <tr>
                                        <td align="center" class="style1">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <table class="style9">
                                                <tr>
                                                    <td>
                                                        حساب کاربری مورد نظر با موفقیت به ثبت رسید</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table class="style9">
                                                            <tr>
                                                                <td>
                                                                    نام کاربری:</td>
                                                                <td>
                                                                    <asp:Label ID="lbl_username" runat="server" 
                                                                        style="font-weight: 700; color: #FF0000"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Image ID="Im" runat="server" Height="225px" Width="191px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="text-align: center">
                                            <asp:Button ID="btn_HaveRoles" runat="server" onclick="btn_HaveRoles_Click" 
                                            
                                                Text="دادن حق دسترسی به این کاربر" style="font-family: Tahoma; font-size: 11px"
                                                 />
                                            <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                                CommandName="Continue" Text="ایجاد حساب کاربری دیگر" ValidationGroup="CU" 
                                                style="font-family: Tahoma; font-size: 11px" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:CompleteWizardStep>
                    </WizardSteps>
                </asp:CreateUserWizard>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; background-color: #FFFFFF">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/Content/Images/back.gif" />
            </td>
        </tr>
    </table>
    <table class="style21">
        <tr>
            <td style="text-align: right">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

