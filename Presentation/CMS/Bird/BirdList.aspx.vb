
Partial Class Presentation_CMS_Bird_BirdList
    Inherits System.Web.UI.Page

    Public Function Bol2Str(ByVal bol As Boolean) As String
        Return IIf(bol = True, "قابل فروش", "غیر قابل فروش")
    End Function

    Protected Sub gvBirdList_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvBirdList.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "GlobalVar=this.style.backgroundColor;this.style.backgroundColor='#D5FFD8'")
            e.Row.Attributes.Add("onmouseout", "this.style.cursor='';this.style.backgroundColor=GlobalVar")
        End If
    End Sub

End Class
