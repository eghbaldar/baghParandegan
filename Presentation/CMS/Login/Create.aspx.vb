
Partial Class Presentation_CMS_Login_Create
    Inherits System.Web.UI.Page

    Protected Sub CU_CreatedUser(ByVal sender As Object, ByVal e As System.EventArgs) Handles CU.CreatedUser

        '------ CodeSecurity
        Dim MSC As MSCaptcha.CaptchaControl = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("MSCaptchaPicture"), MSCaptcha.CaptchaControl)
        MSC.ValidateCaptcha(CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("SecurityCode"), TextBox).Text)
        If Not MSC.UserValidated Then
            'e.Cancel = True
            CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("lbl_Picture"), Label).Text = ""
            CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("lbl_CodeSecurity"), Label).Text = _
            "کد امنیتی را صحیح وارد کنید"
            Exit Sub
        Else
            CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("lbl_CodeSecurity"), Label).Text = ""
        End If
        '------<
        Dim BLL As New MyMembership
        '---- Template CreateUserWizard
        Dim fn As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("fn"), TextBox).Text
        Dim ln As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("ln"), TextBox).Text
        Dim T_sal As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("cmb_sal"), DropDownList).Text
        Dim T_mah As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("cmb_mah"), DropDownList).Text
        Dim T_roz As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("cmb_roz"), DropDownList).Text
        Dim CodeMeli As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("CodeMeli"), TextBox).Text
        '
        Dim cmb_MF As Byte
        Select Case CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("cmb_MF"), DropDownList).SelectedIndex
            Case 0 : cmb_MF = 0
            Case 1 : cmb_MF = 1
        End Select
        '
        Dim Tel As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("Tel"), TextBox).Text
        Dim pedar As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("pedar"), TextBox).Text
        Dim cmb_din As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("cmb_din"), DropDownList).Text
        Dim City As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("City"), TextBox).Text
        Dim cmb_Country As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("cmb_Country"), DropDownList).Text
        Dim Mob As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("Mob"), TextBox).Text

        Dim Address As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("Address"), TextBox).Text
        Dim CodePosti As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("CodePosti"), TextBox).Text
        Dim cmb_Tahsilat As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("cmb_Tahsilat"), DropDownList).Text
        Dim Job As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("Job"), TextBox).Text
        Dim Ghad As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("Ghad"), TextBox).Text
        Dim Vazn As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("Vazn"), TextBox).Text
        '
        Dim cmb_Tahool As Byte
        Select Case CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("cmb_Tahool"), DropDownList).SelectedIndex
            Case 0 : cmb_Tahool = 0
            Case 1 : cmb_Tahool = 1
        End Select
        '
        Dim Bache As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("Bache"), TextBox).Text
        Dim Email_1 As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("Email_1"), TextBox).Text
        Dim Email_2 As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("Email_2"), TextBox).Text
        Dim Website As String = CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("Website"), TextBox).Text
        '---
        BLL.InsertProfileUser(CU.UserName, fn, ln, T_sal, T_mah, T_roz, CodeMeli, pedar, Tel, Mob, cmb_Tahsilat, Job, Ghad, Vazn, cmb_MF, cmb_Tahool, _
                             Bache, cmb_din, City, cmb_Country, Website, Email_1, Email_2, Address, CodePosti, Nothing)
        Session("Username_CreateUser") = CU.UserName
        '---- حتمی
        Roles.AddUserToRole(CU.UserName, "Guest")

    End Sub

    Protected Sub CU_CreatingUser(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LoginCancelEventArgs) Handles CU.CreatingUser



    End Sub

    Public Function ValidationFilePath(ByVal Path As String) As Boolean

        If Path <> String.Empty Then
            Dim Postfix() As String = {"JPG", "PNG", "BMP", "GIF"}
            Dim Str As String = Mid(Path, Path.Length - 2, 3)
            Dim b As Boolean = False
            For i As Integer = 0 To Postfix.Length - 1
                If Postfix(i).ToLower() = Str.ToLower() Then
                    b = True
                    Return b
                    Exit Function
                Else : b = False
                End If
            Next
            Return b
        End If

    End Function

    Protected Sub Rb_InfoPublic_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("MV"), MultiView).ActiveViewIndex = 0
    End Sub

    Protected Sub Rb_Nothing_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("Rb_InfoPrivate"), RadioButton).Checked = False
        CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("Rb_InfoPublic"), RadioButton).Checked = False
        CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("MV"), MultiView).ActiveViewIndex = -1
    End Sub

    Protected Sub RadioButton2_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(CU.CreateUserStep.ContentTemplateContainer.FindControl("MV"), MultiView).ActiveViewIndex = 1
    End Sub

    Protected Sub UploadButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UploadButton.Click

        Dim StrPath As String, BLL As New MyMembership

        If FileUpload.FileName <> String.Empty Then
            If ValidationFilePath(FileUpload.FileName) Then
                If FileUpload.PostedFile.ContentLength < 70000 Then
                    StrPath = MapPath("~\images\user\") + CU.UserName + Mid(FileUpload.FileName, FileUpload.FileName.Length - 3, 4)
                    Session("PathPicture") = "~\images\user\" + CU.UserName + Mid(FileUpload.FileName, FileUpload.FileName.Length - 3, 4)
                    BLL.UpdateImage(Session("PathPicture"), CU.UserName)
                    FileUpload.SaveAs(StrPath)
                Else
                    lbl_wrong.ForeColor = Drawing.Color.Red
                    lbl_wrong.Text = "حجم تصویر شما از مقدار تعیین شده بیشتر می باشد"
                    Exit Sub
                End If
            Else
                lbl_wrong.ForeColor = Drawing.Color.Red
                lbl_wrong.Text = "فرمت تصویر را صحیح انتخاب کنید"
                Exit Sub
            End If
        Else : StrPath = MapPath("User_Default.JPG")
        End If
        lbl_wrong.ForeColor = Drawing.Color.Green
        lbl_wrong.Text = "تصویر شما با موفقیت ارسال شد"
        '------

    End Sub

    Protected Sub CU_NextButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles CU.NextButtonClick

        If e.CurrentStepIndex = 1 Then
            If Session("PathPicture") <> "" Then
                CType(CU.CompleteStep.ContentTemplateContainer.FindControl("Im"), Image).ImageUrl = Session("PathPicture")
            Else
                CType(CU.CompleteStep.ContentTemplateContainer.FindControl("Im"), Image).ImageUrl = "~/Presentation/CMS/Login/User_Default.JPG"
                '---
                Dim BLL As New MyMembership
                BLL.UpdateImage("~/Presentation/CMS/Login/User_Default.JPG", CU.UserName)
                '---
            End If
            CType(CU.CompleteStep.ContentTemplateContainer.FindControl("lbl_username"), Label).Text = CU.UserName
        End If

    End Sub

    Protected Sub btn_HaveRoles_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Server.Transfer("~/Presentation/CMS/Login/Roles.aspx")
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Server.Transfer("~/Presentation/CMS/Login/ManagerPart.aspx")
    End Sub

End Class

