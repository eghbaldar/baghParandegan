Imports System.Data

Partial Class Presentation_Modules_Login_Sample_CMS_OutOfLimit
    Inherits System.Web.UI.Page

    Dim BLL As New OutOfLimit

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim row As DataRow = BLL.SelectAll().Rows(0)
            lbl.Text = row(1).ToString()
        Catch ex As Exception
        End Try
    End Sub

End Class
