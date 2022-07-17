
Partial Class Presentation_CMS_Login_Roles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("Username_CreateUser") = "" Then

            MultiView.ActiveViewIndex = 0
            If Not IsPostBack Then

                Session("CreateOrRemove") = "Craete"

                cmb_Roles.DataSource = Roles.GetAllRoles
                cmb_Roles.DataBind()

                Cmb_Users.DataSource = Membership.GetAllUsers
                Cmb_Users.DataBind()

            End If

        Else : MultiView.ActiveViewIndex = 1

            If Not IsPostBack Then

                txt_username.Text = Session("Username_CreateUser")
                '--------------------- Custom
                DG_RoleUser.DataSource = Roles.GetRolesForUser(Session("Username_CreateUser"))
                DG_RoleUser.DataBind()

                Cmd_Roles_Custom.DataSource = Roles.GetAllRoles()
                Cmd_Roles_Custom.DataBind()
                '--------------------- Full
                cmb_Roles.DataSource = Roles.GetAllRoles
                cmb_Roles.DataBind()

                Cmb_Users.DataSource = Membership.GetAllUsers
                Cmb_Users.DataBind()
            End If

        End If

        System.Threading.Thread.Sleep(1000)

    End Sub

    Protected Sub btn_CompleteList_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_CompleteList.Click
        Session("Username_CreateUser") = ""
        MultiView.ActiveViewIndex = 0
    End Sub

    Protected Sub btn_acceptRole_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_acceptRole.Click

        Dim S() As String = Roles.GetRolesForUser(txt_username.Text)

        If Cmd_Roles_Custom.Text = "Guest" Then
            For i As Integer = 0 To S.Length - 1
                Roles.RemoveUserFromRole(txt_username.Text, S(i))
            Next
            Roles.AddUserToRole(txt_username.Text, "Guest")
        ElseIf Cmd_Roles_Custom.Text.ToLower() = "Administrator".ToLower() Then
            For i As Integer = 0 To S.Length - 1
                Roles.RemoveUserFromRole(txt_username.Text, S(i))
            Next
            Roles.AddUserToRole(txt_username.Text, "Administrator")
        Else
            Dim lst_Roles() As String = Roles.GetRolesForUser(txt_username.Text)
            For i As Integer = 0 To lst_Roles.Length - 1
                If lst_Roles(i) = "Administrator" Then Roles.RemoveUserFromRole(txt_username.Text, "Administrator")
                If lst_Roles(i) = "Guest" Then Roles.RemoveUserFromRole(txt_username.Text, "Guest")
            Next
            Roles.AddUserToRole(txt_username.Text, Cmd_Roles_Custom.Text)
        End If

        DG_RoleUser.DataSource = Roles.GetRolesForUser(txt_username.Text)
        DG_RoleUser.DataBind()

        lbl_acceptGetRole.Text = "حق دسترسی با موفقیت داده شده است"

    End Sub

    Protected Sub ShowRoles(ByVal sender As Object, ByVal e As CommandEventArgs)

        If Roles.GetRolesForUser(e.CommandArgument).Length > 0 Then

            lbl_username_full.Text = e.CommandArgument + "  :حق دسترسی های کاربر"
            lbl_acceptGetRole_Full.Text = ""
            lbl_ShowUSerBeforDelete.Text = ""

            DG_RoleUser_Full.DataSource = Nothing
            DG_RoleUser_Full.DataBind()

            DG_Roles.DataSource = Roles.GetRolesForUser(e.CommandArgument)
            DG_Roles.DataBind()
        Else
            lbl_username_full.Text = "حق دسترسی برای نمایش وجود ندارد"
            DG_Roles.DataSource = Nothing
            DG_Roles.DataBind()
        End If


    End Sub

    Protected Sub btn_acceptRole_Full_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_acceptRole_Full.Click

        Select Case Session("CreateOrRemove")
            '-------------------------
            Case "Craete"
                DG_RoleUser_Full.DataSource = Roles.GetRolesForUser(Cmb_Users.Text)
                DG_RoleUser_Full.DataBind()

                Dim S() As String = Roles.GetRolesForUser(Cmb_Users.Text)

                If cmb_Roles.Text.ToLower() = "Guest".ToLower() Then
                    For i As Integer = 0 To S.Length - 1
                        Roles.RemoveUserFromRole(Cmb_Users.Text, S(i))
                    Next
                    Roles.AddUserToRole(Cmb_Users.Text, "Guest")
                ElseIf cmb_Roles.Text.ToLower() = "Administrator".ToLower() Then
                    For i As Integer = 0 To S.Length - 1
                        Roles.RemoveUserFromRole(Cmb_Users.Text, S(i))
                    Next
                    Roles.AddUserToRole(Cmb_Users.Text, "Administrator")
                Else
                    Dim lst_Roles() As String = Roles.GetRolesForUser(Cmb_Users.Text)
                    For i As Integer = 0 To lst_Roles.Length - 1
                        If lst_Roles(i) = "Administrator" Then Roles.RemoveUserFromRole(Cmb_Users.Text, "Administrator")
                        If lst_Roles(i) = "Guest" Then Roles.RemoveUserFromRole(Cmb_Users.Text, "Guest")
                    Next
                    Roles.AddUserToRole(Cmb_Users.Text, cmb_Roles.Text)
                End If

                DG_RoleUser_Full.DataSource = Roles.GetRolesForUser(Cmb_Users.Text)
                DG_RoleUser_Full.DataBind()
                DG_Roles.DataBind()

                lbl_acceptGetRole_Full.Text = "حق دسترسی با موفقیت داده شده است"
                lbl_username_full.Text = ""
                lbl_ShowUSerBeforDelete.Text = ""
                '-----------------------------------
            Case "Remove"
                Dim S() As String
                Roles.RemoveUserFromRole(Cmb_Users.Text, cmb_Roles.Text)
                S = Roles.GetRolesForUser(Cmb_Users.Text)
                If S.Length = 0 Then Roles.AddUserToRole(Cmb_Users.Text, "Guest")

                lbl_acceptGetRole_Full.Text = "حق دسترسی مورد نظر با موفقیت حذف شد"
                lbl_username_full.Text = ""
                lbl_acceptGetRole_Full.Text = ""

                DG_RoleUser_Full.DataSource = Roles.GetRolesForUser(Cmb_Users.Text)
                DG_RoleUser_Full.DataBind()
                '-------------------------
        End Select

    End Sub

    Protected Sub Rb_Create_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_Create.CheckedChanged

        btn_acceptRole_Full.Text = "دادن حق دسترسی"
        Session("CreateOrRemove") = "Craete"
        '--
        If Roles.GetRolesForUser(Cmb_Users.Text).Length > 0 Then
            lbl_ShowUSerBeforDelete.Text = Cmb_Users.Text + "  :حق دسترسی های کاربر"
        Else : lbl_ShowUSerBeforDelete.Text = "حق دسترسی برای این کاربر وجود ندارد"
        End If
        '--
        DG_RoleUser_Full.DataSource = Roles.GetRolesForUser(Cmb_Users.Text)
        DG_RoleUser_Full.DataBind()
        '---

    End Sub

    Protected Sub Rb_Delete_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Rb_Delete.CheckedChanged

        btn_acceptRole_Full.Text = "حذف حق دسترسی"
        Session("CreateOrRemove") = "Remove"
        '--
        If Roles.GetRolesForUser(Cmb_Users.Text).Length > 0 Then
            lbl_ShowUSerBeforDelete.Text = Cmb_Users.Text + "  :حق دسترسی های کاربر"
        Else : lbl_ShowUSerBeforDelete.Text = "حق دسترسی برای این کاربر وجود ندارد"
        End If
        '--
        DG_RoleUser_Full.DataSource = Roles.GetRolesForUser(Cmb_Users.Text)
        DG_RoleUser_Full.DataBind()
        '---
        lbl_acceptGetRole_Full.Text = ""

    End Sub

    Protected Sub Cmb_Users_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Cmb_Users.SelectedIndexChanged

        lbl_ShowUSerBeforDelete.Text = Cmb_Users.Text + "  :حق دسترسی های کاربر"
        DG_RoleUser_Full.DataSource = Roles.GetRolesForUser(Cmb_Users.Text)
        DG_RoleUser_Full.DataBind()

    End Sub

    Protected Sub btn_JumpManager_2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_JumpManager_2.Click
        Server.Transfer("ManagementUser.aspx")
    End Sub

    Protected Sub btn_CreateUser_2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_CreateUser_2.Click
        Server.Transfer("create.aspx")
    End Sub

    Protected Sub btn_back_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btn_back.Click
        Server.Transfer("~/Presentation/CMS/Login/ManagerPart.aspx")
    End Sub

    Protected Sub DG_Roles_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DG_Roles.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "GlobalVar=this.style.backgroundColor;this.style.backgroundColor='#D5FFD8'")
            e.Row.Attributes.Add("onmouseout", "this.style.cursor='';this.style.backgroundColor=GlobalVar")
        End If
    End Sub

    Protected Sub DG_RoleUser_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DG_RoleUser.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "GlobalVar=this.style.backgroundColor;this.style.backgroundColor='#D5FFD8'")
            e.Row.Attributes.Add("onmouseout", "this.style.cursor='';this.style.backgroundColor=GlobalVar")
        End If
    End Sub

    Protected Sub DG_RoleUser_Full_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DG_RoleUser_Full.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "GlobalVar=this.style.backgroundColor;this.style.backgroundColor='#D5FFD8'")
            e.Row.Attributes.Add("onmouseout", "this.style.cursor='';this.style.backgroundColor=GlobalVar")
        End If
    End Sub

    Protected Sub DG_Users_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DG_Users.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "GlobalVar=this.style.backgroundColor;this.style.backgroundColor='#D5FFD8'")
            e.Row.Attributes.Add("onmouseout", "this.style.cursor='';this.style.backgroundColor=GlobalVar")
        End If
    End Sub
End Class
