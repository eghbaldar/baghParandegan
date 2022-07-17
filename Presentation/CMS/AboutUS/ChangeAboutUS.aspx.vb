Imports System.Data

Partial Class Presentation_CMS_AboutUS_ChangeAboutUS
    Inherits System.Web.UI.Page

    Dim BLL As New AboutUS_

    Protected Sub btn_send_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_send.Click

        Select Case BLL.Update(FCK_text.Value, 1)
            Case 1
                lbl.Text = "عبارت مورد نظر بدرستی ارسال شده"
                Fill()
            Case 0 : lbl.Text = "عبارت مورد نظر را تکمیل کنید"
            Case -1 : lbl.Text = "در ارسال اطلاعات مشکلی رخ داده است"
        End Select

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "پنل مدیریت سایت - تغییرات درباره ی ما"
        If Not IsPostBack Then
            Fill()
        End If
    End Sub

    Protected Sub Fill()
        Try
            Dim row As DataRow = BLL.SelectAll().Rows(0)
            FCK_text.Value = row(1).ToString()
        Catch ex As Exception
        End Try
    End Sub

End Class
