
Partial Class Presentation_CMS_AboutUS_AboutUS
    Inherits System.Web.UI.Page

    Protected Sub btn_back_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btn_back.Click
        Response.Redirect("~/Presentation/ManagerWebsite.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "پنل مدیریت سایت - درباره ی ما"
    End Sub
End Class
