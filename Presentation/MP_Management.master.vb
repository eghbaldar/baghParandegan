Imports System.IO
Imports WebChart

Partial Class Presentation_Modules_ManagementWebsite_MP_Management
    Inherits System.Web.UI.MasterPage

    Dim BLL_Profile As New MyMembership
    Dim iUse As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            AccFreeAndUseHOST()
            Try
                lbl_TimeDate.Text = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate) + vbCrLf + Date.Now.ToString()
                lbl_Username.Text = Session("username").ToString()
                With BLL_Profile.SelectDetailInfoUser(Session("username").ToString())
                    lbl_FnLn.Text = .Rows(0)(2).ToString() + "    " + .Rows(0)(3).ToString()
                    Im_User.ImageUrl = .Rows(0)(26).ToString()
                End With
                Dim StrRole() As String = Roles.GetRolesForUser(Session("username").ToString())
                For Each S As String In StrRole
                    lbl_Role.Text += S + ","
                Next
            Catch ex As Exception
            End Try

        End If

    End Sub

    Sub GetFiles(ByVal source As DirectoryInfo)

        Dim files() As FileInfo = source.GetFiles
        Dim f As FileInfo
        For Each f In files
            iUse += f.Length
            '
        Next

        Dim dirs() As DirectoryInfo = source.GetDirectories
        For Each Dir As DirectoryInfo In dirs
            GetFiles(Dir)
        Next

    End Sub

    Public Function BytesToMegabytes(ByVal Bytes As Double) As Double
        Dim dblAns As Double
        dblAns = (Bytes / 1024) / 1024
        BytesToMegabytes = Format(dblAns, "###,###,##0.00")
    End Function

    Private Sub AccFreeAndUseHOST()
        '-----------------------------------------------
        GetFiles(New DirectoryInfo(MapPath("~")))
        Label1.Text = BytesToMegabytes(Convert.ToDouble(iUse)).ToString
        Label2.Text = 100 - BytesToMegabytes(Convert.ToDouble(iUse)).ToString
        '--------------------------------------------------
        Dim chart As PieChart = CType(ChartControl1.Charts.FindChart("PieChart"), PieChart)
        chart.Data.Add(New ChartPoint("فضای اشغال شده", BytesToMegabytes(Convert.ToDouble(iUse)).ToString))
        chart.Data.Add(New ChartPoint("فضای آزاد", 100 - BytesToMegabytes(Convert.ToDouble(iUse)).ToString))
        ChartControl1.Charts.Add(chart)
        ChartControl1.RedrawChart()
    End Sub


End Class

