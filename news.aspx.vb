
Partial Class news
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "باغ پرندگان ماهان"
        Try
            Dim c As New News_
            lblTitle.Text = c.SelectRow(Request.QueryString("id")).Rows(0)(1).ToString()
            Title = c.SelectRow(Request.QueryString("id")).Rows(0)(1).ToString()
            lblNews.Text = c.SelectRow(Request.QueryString("id")).Rows(0)(3).ToString()
        Catch ex As Exception

        End Try


    End Sub
End Class
