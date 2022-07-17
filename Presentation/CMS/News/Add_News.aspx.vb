
Partial Class Presentation_CMS_News_Add_News
    Inherits System.Web.UI.Page

    Dim BLL As New News_

    Protected Sub btn_news_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_news.Click

        If cmb_category.Text = "" Then
            lbl_news.Text = "تمام بخش ها باید تکمیل شود"
            Exit Sub
        End If

        Dim E_ As Integer = IIf(rb_enable.Checked, 1, 0)
        Dim check As Integer = BLL.Insert(txt_title_news.Text, txt_matnkotah_news.Value, FCK_News.Value, E_, Session("username"), cmb_category.SelectedValue)
        Select Case check
            Case 0
                lbl_news.Text = "تمام بخش ها باید تکمیل شود"
            Case -1
                lbl_news.Text = "خطا در ذخیره سازی  - لطفا دوباره اقدام کنید"
            Case 1
                lbl_news.Text = "خبر شما با موفقیت ذخیره شده است"
                txt_title_news.Text = ""
                txt_matnkotah_news.Value = ""
                FCK_News.Value = ""
                lbl_DG.Text = ""
                DG.DataBind()
        End Select

    End Sub

    Protected Sub btn_back_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btn_back.Click
        Server.Transfer("~/Presentation/CMS/News/News.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "پنل مدیریت سایت - اضافه کردن خبر"
    End Sub

    Protected Sub DG_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DG.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "GlobalVar=this.style.backgroundColor;this.style.backgroundColor='#D5FFD8'")
            e.Row.Attributes.Add("onmouseout", "this.style.cursor='';this.style.backgroundColor=GlobalVar")
        End If
    End Sub

End Class

