
Partial Class Presentation_CMS_Contact_Detail_Contact
    Inherits System.Web.UI.Page

    Dim BLL As New Contact_

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lbl.Text = BLL.SelectRow(Request.QueryString("ID")).Rows(0)(4).ToString()
    End Sub

End Class
