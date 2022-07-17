Imports System.Data
Imports System.Web.Services

Partial Class Presentation_CMS_Login_ManagementUser

    Inherits System.Web.UI.Page

    Dim BLL As New MyMembership

    Protected Sub btn_CreateUser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_CreateUser.Click
        Response.Redirect("~/Presentation/CMS/Login/Create.aspx")
    End Sub

    Protected Sub Btn_RolesUser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_RolesUser.Click
        Response.Redirect("~/Presentation/CMS/Login/Roles.aspx")
    End Sub

    Protected Sub ShowDetail(ByVal sender As Object, ByVal e As CommandEventArgs)

        'Details_User.DataSource = BLL.SelectDetailInfoUser(e.CommandArgument)
        'Details_User.DataBind()

    End Sub

    Protected Sub chk_pic_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chk_pic.CheckedChanged

        If chk_pic.Checked Then
            DG_AllUser.Columns(4).Visible = True
            DG_AllUser.DataBind()
        Else
            DG_AllUser.Columns(4).Visible = False
            DG_AllUser.DataBind()
        End If

    End Sub

    Protected Sub DeleteUser(ByVal sender As Object, ByVal e As CommandEventArgs)

        If BLL.Delete_Profile(e.CommandArgument) Then
            DG_AllUser.DataBind()
            lbl_satuse.Text = "کاربر مورد نظر با موفقیت حذف شد"
        Else
            lbl_satuse.Text = "در حذف کاربر مشکلی رخ داده است"
        End If

    End Sub

    Protected Sub EditUser(ByVal sender As Object, ByVal e As CommandEventArgs)

        M.ActiveViewIndex = 0
        M_Edit.ActiveViewIndex = -1
        lbl_updateUser.Text = ""
        '----
        Dim mem As MembershipUser = Membership.GetUser(e.CommandArgument.ToString())
        lbl_email.Text = mem.Email
        '----
        Session.Add("UserForEdit", e.CommandArgument.ToString())

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        System.Threading.Thread.Sleep(1000)

        If DG_AllUser.Rows.Count = 0 Then
            chk_pic.Visible = False
            lbl_satuse.Text = "رکوردی برای نمایش وجود ندارد"
        End If

    End Sub

    Protected Sub btn_closeEdit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_closeEdit.Click
        M.ActiveViewIndex = -1
        M_Edit.ActiveViewIndex = -1
    End Sub

    Protected Sub btn_1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_1.Click
        M_Edit.ActiveViewIndex = 0
    End Sub

    Protected Sub btn_2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_2.Click

        M_Edit.ActiveViewIndex = 1
        ''------
        With BLL.SelectDetailInfoUser(Session("UserForEdit"))
            fn.Text = .Rows(0)(2).ToString()
            ln.Text = .Rows(0)(3).ToString()

            cmb_sal.Text = cmb_sal.Items.FindByText(.Rows(0)(4).ToString()).Value.ToString()
            cmb_mah.Text = cmb_mah.Items.FindByText(.Rows(0)(5).ToString()).Value.ToString()
            cmb_roz.Text = cmb_roz.Items.FindByText(.Rows(0)(6).ToString()).Value.ToString()

            code_meli.Text = .Rows(0)(7).ToString()
            pedar.Text = .Rows(0)(8).ToString()
            tel.Text = .Rows(0)(9).ToString()
            mobile.Text = .Rows(0)(10).ToString()
            cmb_Tahsilat.Text = cmb_Tahsilat.Items.FindByText(.Rows(0)(11).ToString()).Value.ToString()
            job.Text = .Rows(0)(12).ToString()
            Ghad.Text = .Rows(0)(13).ToString()
            Vazn.Text = .Rows(0)(14).ToString()
            cmb_MF.SelectedIndex = IIf(Convert.ToBoolean(.Rows(0)(15)) = False, 0, 1)
            cmb_Tahool.SelectedIndex = IIf(Convert.ToBoolean(.Rows(0)(16)) = False, 0, 1)
            Bache.Text = .Rows(0)(17).ToString()
            cmb_din.Text = cmb_din.Items.FindByText(.Rows(0)(18).ToString()).Value.ToString()
            city.Text = .Rows(0)(19).ToString()
            cmb_Country.Text = cmb_Country.Items.FindByText(.Rows(0)(20).ToString()).Value.ToString()
            Website.Text = .Rows(0)(21).ToString()
            Email_1.Text = .Rows(0)(22).ToString()
            Email_2.Text = .Rows(0)(23).ToString()
            Address.Text = .Rows(0)(24).ToString()
            code_posti.Text = .Rows(0)(25).ToString()
        End With

    End Sub

    Protected Sub Btn_ChangePass_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_ChangePass.Click

        Dim s As String = Session("UserForEdit")
        Dim m As MembershipUser
        m = Membership.GetUser(s)
        m.ChangePassword(m.ResetPassword(), Pass.Text.ToString())
        Membership.UpdateUser(m)
        '-----
        lbl_changePass.Text = String.Format("کلمه عبور کاربر {0} با موفقیت اصلاح شد", Session("UserForEdit"))

    End Sub

    Protected Sub Btn_ChangeEmail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_ChangeEmail.Click

        Dim s As String = Session("UserForEdit")
        Dim m As MembershipUser
        m = Membership.GetUser(s)
        m.Email = Email.Text
        Membership.UpdateUser(m)
        '-----
        lbl_ChangeEmail.Text = String.Format("آدرس الکترونیکی کاربر {0} با موفقیت اصلاح شد", Session("UserForEdit"))
        lbl_email.Text = m.Email

    End Sub

    Protected Sub btn_showChangePic_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_showChangePic.Click

        Opener(btn_showChangePic, "ChangePicture.aspx?UserID=" + Session("UserForEdit"))

    End Sub

    Private Sub Opener(ByVal Op As WebControl, ByVal PathStr As String)

        Dim ScriptStr As String = "window.open('" + PathStr + "','nwwin', 'toolbar=0,location=0,directories=0,status=0,menubar=no,scrollbars=yes,resizable=no,width=650,height=495');"
        Op.Attributes.Add("OnClick", ScriptStr)

    End Sub

    Protected Sub btn_Edit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_Edit.Click

        Dim bCheck As Boolean = False
        bCheck = BLL.UpdateProfile(fn.Text, ln.Text, cmb_sal.Text, cmb_mah.Text, cmb_roz.Text, code_meli.Text, pedar.Text, tel.Text, _
                         mobile.Text, cmb_Tahsilat.Text, job.Text, Ghad.Text, Vazn.Text, IIf(cmb_MF.SelectedIndex = 0, 0, 1), _
                         IIf(cmb_Tahool.SelectedIndex = 0, 0, 1), Bache.Text, cmb_din.Text, city.Text, cmb_Country.Text, Website.Text, Email_1.Text, _
                         Email_2.Text, Address.Text, code_posti.Text, Session("UserForEdit"))

        If bCheck Then : lbl_updateUser.Text = String.Format("اطلاعات کاربر {0} با موفقیت اصلاح گردید", Session("UserForEdit"))
        ElseIf Not bCheck Then : lbl_updateUser.Text = "در اصلاح اطلاعات خطایی رخ داد ه است"
        End If

    End Sub

    Protected Sub btn_back_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btn_back.Click
        Server.Transfer("~/Presentation/CMS/Login/ManagerPart.aspx")
    End Sub

    Protected Sub DG_AllUser_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DG_AllUser.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "GlobalVar=this.style.backgroundColor;this.style.backgroundColor='#D5FFD8'")
            e.Row.Attributes.Add("onmouseout", "this.style.cursor='';this.style.backgroundColor=GlobalVar")
        End If
    End Sub
End Class
