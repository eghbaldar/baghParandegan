Imports System.Drawing

Partial Class Presentation_CMS_Bird_EditBird
    Inherits System.Web.UI.Page

#Region "Misc"

    Public Function ValidationFilePath(ByVal Path As String) As Boolean

        If Path <> String.Empty Then
            Dim Postfix() As String = {"JPG", "PNG", "BMP", "GIF"}
            Dim Str As String = Mid(Path, Path.Length - 2, 3)
            Dim b As Boolean = False
            For i As Integer = 0 To Postfix.Length - 1
                If Postfix(i).ToUpper() = Str.ToUpper() Then
                    Return True
                    Exit Function
                Else : b = False
                End If
            Next
            Return b
        End If

    End Function

    Public Function GenerateFileName(ByVal fileName As String) As String
        Dim f As New System.IO.FileInfo(fileName)
        Dim ext As String = f.Extension
        Return (Guid.NewGuid.ToString.Replace("-", "") & ext).Trim()
    End Function

    Public Function MakeThumnails(ByVal fileName As String) As String
        Dim f As New IO.FileInfo(fileName)
        Dim thumbnailsFileName As String = GenerateFileName(fileName)
        '=============================
        'ایجاد فایل کوچک
        Dim myBitmap As Bitmap = New Bitmap(fileName)
        Dim myThumbnail As Image = ResizeImage(myBitmap, 120, 116)
        Dim strTemp As String = f.DirectoryName & "\" & thumbnailsFileName
        myThumbnail.Save(strTemp)
        '=============================
        Return thumbnailsFileName
    End Function

    Public Function ResizeImage(ByVal imgToResize As Image, ByVal Width As Integer, ByVal Height As Integer) As Image
        Dim sourceWidth As Integer = imgToResize.Width
        Dim sourceHeight As Integer = imgToResize.Height
        Dim nPercent As Single = 0
        Dim nPercentW As Single = 0
        Dim nPercentH As Single = 0
        nPercentW = Width / sourceWidth
        nPercentH = Height / sourceHeight
        If nPercentH < nPercentW Then
            nPercent = nPercentH
        Else
            nPercent = nPercentW
        End If
        Dim destWidth As Integer = CType((sourceWidth * nPercent), Integer)
        Dim destHeight As Integer = CType((sourceHeight * nPercent), Integer)
        Dim b As Bitmap = New Bitmap(destWidth, destHeight)
        Dim g As Graphics = Graphics.FromImage(CType(b, Image))
        g.InterpolationMode = Drawing2D.InterpolationMode.HighQualityBicubic
        g.DrawImage(imgToResize, 0, 0, destWidth, destHeight)
        g.Dispose()
        Return CType(b, Image)
    End Function

#End Region
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim BirdID As Integer = CInt(Request.QueryString("ID"))
            Dim BirdAction As New Bird

            Dim dr As Data.DataRow = BirdAction.SelectRow(BirdID)
            With dr
                ddlCategory.SelectedValue = .Item("CategoryID")
                txtName.Text = .Item("Name")
                txtScinceName.Text = .Item("ScinceName")
                txtFood.Text = .Item("Food")
                txtZone.Text = .Item("Zone")
                txtDescription.Text = .Item("Description")
                Select Case CBool(.Item("IsSale"))
                    Case True
                        RadioButtonList1.SelectedIndex = 0
                    Case False
                        RadioButtonList1.SelectedIndex = 1
                End Select
                txtCount.Text = .Item("Count")
                txtPrice.Text = .Item("Price")
            End With

            MultiView1.ActiveViewIndex = 0
        End If
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Dim BirdID As Integer = CInt(Request.QueryString("ID"))
        Dim BirdAction As New Bird

        Dim intCount As Integer
        Dim intPrice As Integer

        Try
            If txtCount.Text.Trim() = String.Empty Then intCount = 0 Else intCount = Integer.Parse(txtCount.Text.Trim())
        Catch ex As Exception
            intCount = 0
        End Try

        Try
            If txtPrice.Text.Trim() = String.Empty Then intPrice = 0 Else intPrice = Integer.Parse(txtPrice.Text.Trim())
        Catch ex As Exception
            intPrice = 0
        End Try

        Dim result As Boolean = BirdAction.Update(BirdID, ddlCategory.SelectedValue, txtName.Text, txtScinceName.Text, txtFood.Text, txtZone.Text, txtDescription.Text, RadioButtonList1.SelectedValue, intCount, intPrice)
        If result Then
            MultiView1.ActiveViewIndex = 1
        Else
            lblMsg.Visible = True
        End If
    End Sub

    Protected Sub btnSendPic_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendPic.Click
        Dim BirdAction As New Bird
        Dim BirdPictreAction As New BirdPicture
        Dim CurrentID As Integer = CInt(Request.QueryString("ID"))

        If Not FileUpload1.HasFile Then
            lblMsg_Picture.Text = "فایلی انتخاب نشده است !!!"
            lblMsg_Picture.Visible = True
            Exit Sub
        End If
        If Not ValidationFilePath(FileUpload1.FileName) Then
            lblMsg_Picture.Text = "فرمت فایل صحیح نمی باشد !!!"
            lblMsg_Picture.Visible = True
            Exit Sub
        End If
        lblMsg_Picture.Visible = False

        ' Upload Image ==========

        Dim NewFileName As String = GenerateFileName(FileUpload1.FileName)
        Dim StrPath As String = MapPath("~\Images\BirdPicture\") + NewFileName
        FileUpload1.SaveAs(StrPath)
        Dim thumbnails As String = MakeThumnails(StrPath)

        ' Insert Into Database ==========

        Dim result As Boolean = BirdPictreAction.Insert(CurrentID, txtTitle.Text, NewFileName, thumbnails)
        If result Then
            gvPicture.DataBind()
        Else
            lblMsg_Picture.Text = "خطا در عملیات ذخره سازی !!!"
            lblMsg_Picture.Visible = True
            Exit Sub
        End If

        ' Finish Operation ==========
        txtTitle.Text = String.Empty
    End Sub

End Class