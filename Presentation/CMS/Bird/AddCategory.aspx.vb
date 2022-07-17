
Partial Class Presentation_CMS_Bird_AddCategory
    Inherits System.Web.UI.Page

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click

        Dim BirdCategoryAction As New BirdCategory
        Dim result As Boolean = BirdCategoryAction.Insert(txtCategory.Text)
        If result Then
            txtCategory.Text = String.Empty
            lblMsg.Visible = False
            gvBirdCategory.DataBind()
        Else
            lblMsg.Visible = True
        End If

    End Sub

End Class

'Dim result As Boolean = BirdCategoryAction.Insert(txtCategory.Text)
'gvCategory.DataBind()
'If result = True Then
'    txtCategory.Text = String.Empty
'    lblMsg.Visible = False
'Else
'    lblMsg.Visible = True
'End If
