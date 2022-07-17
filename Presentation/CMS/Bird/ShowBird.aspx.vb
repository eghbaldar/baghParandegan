
Partial Class Presentation_CMS_Bird_ShowBird
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim BirdID As Integer = CInt(Request.QueryString("ID"))
        Dim BirdAction As New Bird

        Dim dr As Data.DataRow = BirdAction.SelectRow(BirdID)
        With dr
            lblCategory.Text = .Item("CategoryName")
            lblName.Text = .Item("Name")
            lblScinceName.Text = .Item("ScinceName")
            lblFood.Text = .Item("Food")
            lblZone.Text = .Item("Zone")
            litDescription.Text = .Item("Description")
            lblIsSale.Text = IIf(CBool(.Item("IsSale")) = True, "قابل فروش", "غیر قابل فروش")
            lblCount.Text = .Item("Count")
            lblPrice.Text = .Item("Price")
        End With
    End Sub

End Class
