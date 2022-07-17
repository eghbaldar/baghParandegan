
Partial Class about
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "باغ پرندگان ماهان"
        Dim C As New AboutUS_
        lblAbout.Text = C.SelectAll().Rows(0)(1).ToString()

    End Sub
End Class
