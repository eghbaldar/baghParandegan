
Partial Class Presentation_CMS_Login_ManagerPart
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "ماژول مدیریت وب سایت"
    End Sub

    Protected Sub btn_back_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btn_back.Click
        Response.Redirect("~/Presentation/ManagerWebsite.aspx")
    End Sub
End Class
