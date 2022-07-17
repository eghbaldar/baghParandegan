
Partial Class Presentation_Modules_Login_Login
    Inherits System.Web.UI.Page

    Protected Sub Login1_LoggedIn(ByVal sender As Object, ByVal e As System.EventArgs) Handles Login1.LoggedIn
        Session("username") = Login1.UserName
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If User.Identity.IsAuthenticated Then Response.Redirect("~/Presentation/ManagerWebsite.aspx")
        Title = "ورود به پنل مدیریتی"
    End Sub

End Class
