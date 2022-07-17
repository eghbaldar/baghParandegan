
Partial Class contact
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "باغ پرندگان ماهان"
    End Sub
    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSend.Click
        Try
            Dim c As New Contact_
            c.InsertConatct(Server.HtmlDecode(txtFnLn.Text), Server.HtmlDecode(txtMail.Text), Server.HtmlDecode(txtSubject.Text), Server.HtmlDecode(txtMessage.Text), Request.UserHostAddress)
            lblError.Text = "پیام شما با موفقیت ارسال گردید"
            txtFnLn.Text = ""
            txtMail.Text = ""
            txtMessage.Text = ""
            txtSubject.Text = ""
        Catch ex As Exception
            lblError.Text = "خطا - دوباره تلاش کنید"
        End Try
    End Sub
End Class
