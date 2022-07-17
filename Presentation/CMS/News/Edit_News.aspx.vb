
Partial Class Presentation_CMS_News_Edit_News
    Inherits System.Web.UI.Page

    Dim BLL As New News_

    Protected Sub btn_news_edit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_news_edit.Click

        If cmb_category_edit.Text = "" Then
            lbl_news_edit_.Text = "تمام بخش ها باید تکمیل شود"
            Exit Sub
        End If
        Dim E_ As Integer = IIf(rb_enable_edit.Checked, 1, 0)
        Dim Check As Integer
        Check = BLL.Update(txt_title_news_edit.Text, txt_matnkotah_news_edit.Value, FCK_News_edit.Value, E_, Session("username"), cmb_category_edit.SelectedValue, Session("id_news"))
        Select Case Check
            Case 0
                lbl_news_edit_.Text = "تمام بخش ها باید تکمیل شود"
            Case -1
                lbl_news_edit_.Text = "در اصلاح خبر شما مشکلی رخ داده است"
            Case 1
                lbl_news_edit_.Text = "با موفقیت خبر شما اصلاح گردید"
                DG_Edit.DataBind()
        End Select

    End Sub

    Protected Sub Edit_News(ByVal sender As Object, ByVal e As CommandEventArgs)

        Try
            Session("id_news") = e.CommandArgument
            txt_title_news_edit.Text = BLL.SelectRow(e.CommandArgument).Rows(0)(1).ToString()
            txt_matnkotah_news_edit.Value = BLL.SelectRow(e.CommandArgument).Rows(0)(2).ToString()
            FCK_News_edit.Value = BLL.SelectRow(e.CommandArgument).Rows(0)(3).ToString()

            Dim E_ As Boolean = Convert.ToBoolean(BLL.SelectRow(e.CommandArgument).Rows(0)(6))
            If E_ Then
                rb_enable_edit.Checked = True
                rb_disable_edit.Checked = False
            ElseIf Not E_ Then
                rb_disable_edit.Checked = True
                rb_enable_edit.Checked = False
            End If
            cmb_category_edit.SelectedValue = BLL.SelectRow(e.CommandArgument).Rows(0)(8)
        Catch ex As Exception
        End Try

    End Sub

    Protected Sub btn_back_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btn_back.Click
        Server.Transfer("~/Presentation/CMS/News/News.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then cmb.Items.Insert(0, New ListItem("", "-1"))
        Title = "پنل مدیریت سایت - ویرایش اخبار"
    End Sub

    Protected Sub DG_Edit_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles DG_Edit.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "GlobalVar=this.style.backgroundColor;this.style.backgroundColor='#D5FFD8'")
            e.Row.Attributes.Add("onmouseout", "this.style.cursor='';this.style.backgroundColor=GlobalVar")
        End If
    End Sub

    Protected Sub Delete_News(ByVal sender As Object, ByVal e As CommandEventArgs)
        BLL.Delete(e.CommandArgument)
        DG_Edit.DataBind()
    End Sub

End Class
