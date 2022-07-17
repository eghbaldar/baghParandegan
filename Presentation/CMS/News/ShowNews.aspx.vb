
Partial Class Presentation_CMS_News_ShowNews
    Inherits System.Web.UI.Page

    Protected Sub GridView1_SelectedIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSelectEventArgs) Handles DG.SelectedIndexChanging
        lblShow.Text = CType(DG.Rows(e.NewSelectedIndex).FindControl("lblnews"), Label).Text
    End Sub

    Protected Sub btn_back_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btn_back.Click
        Server.Transfer("~/Presentation/CMS/News/News.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "پنل مدیریت سایت - نمایش اخبار"
    End Sub

End Class
