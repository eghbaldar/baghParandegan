
Partial Class Presentation_Modules_Login_ChangePicture
    Inherits System.Web.UI.Page

    Dim BLL As New MyMembership

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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '-----Image
        lbl_username.Text = Request.QueryString("UserID")
        With BLL.SelectDetailInfoUser(Request.QueryString("UserID"))
            Dim Path As String = .Rows(0)("image").ToString()
            Page.Title = String.Format(" {1}: صفحه تغییر عکس : {0} با نام کاربری", .Rows(0)(2).ToString() + .Rows(0)(3).ToString(), Request.QueryString("UserID"))
            lbl_fn.Text = .Rows(0)(2).ToString()
            lbl_ln.Text = .Rows(0)(3).ToString()
            Im.ImageUrl = Path
        End With
        '-----
    End Sub

    Protected Sub btn_send_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_send.Click

        Dim StrPath As String, S As String

        If File.FileName <> String.Empty Then
            If ValidationFilePath(File.FileName) Then
                If File.PostedFile.ContentLength < 70000 Then
                    StrPath = MapPath("~\images\user\") + Session("UserForEdit") + Mid(File.FileName, File.FileName.Length - 3, 4)
                    S = "~\images\user\" + Session("UserForEdit") + Mid(File.FileName, File.FileName.Length - 3, 4)
                    Im.ImageUrl = S
                    BLL.UpdateImage(S, Session("UserForEdit"))
                    File.SaveAs(StrPath)
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
    End Sub

End Class
