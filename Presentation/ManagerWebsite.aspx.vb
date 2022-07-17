
Partial Class Presentation_Modules_ManagementWebsite_Default
    Inherits System.Web.UI.Page

    Protected Sub btn_SingOut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_SingOut.Click
        FormsAuthentication.SignOut()
        Response.Redirect("~\default.aspx")
    End Sub

    Protected Sub btn_ShowSite_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_ShowSite.Click
        Response.Redirect("~\default.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "پنل مدیریت سایــت"
    End Sub
End Class
