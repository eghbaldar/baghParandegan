
Partial Class Presentation_CMS_Contact_Maniplute_Contact
    Inherits System.Web.UI.Page

    Dim BLL As New Contact_

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "پنل مدیریت سایت - تغییرات تماس با ما"
    End Sub

    Protected Sub Delete_Contact(ByVal sender As Object, ByVal e As CommandEventArgs)
        BLL.DeleteContact(e.CommandArgument)
        DG.DataBind()
    End Sub

End Class
