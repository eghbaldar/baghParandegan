Imports Microsoft.VisualBasic
Imports System.Data

<System.ComponentModel.DataObject()> _
Public Class News_

    Dim DLL As New DS_NewsTableAdapters.NewsTableAdapter
    Dim DLL_Category As New DS_NewsTableAdapters.NewsCategoryTableAdapter

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function Insert(ByVal title As String, ByVal lid As String, ByVal news As String, ByVal E As Integer, _
                           ByVal UN As String, ByVal Code_Cat As Long) As Integer

        Try
            If title = "" Then : Return 0
            ElseIf lid = "" Then : Return 0
            ElseIf news = "" Then : Return 0
            ElseIf UN = "" Then : Return 0
            ElseIf Code_Cat = Nothing Then : Return 0
            End If

            Dim Tarikh As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate)
            Dim Time As String = Mid(Now.TimeOfDay.ToString(), 1, 8)
            DLL.Insert(title, lid, news, Tarikh, Time, E, UN, Code_Cat)
            Return 1
        Catch ex As Exception : Return False
            Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete(ByVal ID As Integer) As Boolean

        Try
            DLL.DeleteQuery(ID) 'RowAffected
        Catch ex As Exception : Return False
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAll() As DataTable

        Try
            Return DLL.GetData()
        Catch ex As Exception : Return Nothing
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function Update(ByVal title As String, ByVal lid As String, ByVal news As String, _
                           ByVal E As Integer, ByVal UN As String, ByVal Code_Cat As Long, ByVal id As Integer) As Integer

        Try
            If title = "" Then : Return 0
            ElseIf lid = "" Then : Return 0
            ElseIf news = "" Then : Return 0
            ElseIf UN = "" Then : Return 0
            ElseIf Code_Cat = Nothing Then : Return 0
            End If

            Dim Tarikh As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate)
            Dim Time As String = Mid(Now.TimeOfDay.ToString(), 1, 8)
            DLL.UpdateQuery(title, lid, news, Tarikh, Time, E, UN, Code_Cat, id)
            Return 1
        Catch ex As Exception : Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectRow(ByVal id As Integer) As DataTable

        Try
            Return DLL.GetData_Select(id)
        Catch ex As Exception : Return Nothing
        End Try

    End Function

    '-------------- Category News

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function Insert_NewsCategory(ByVal Name As String) As Integer

        Try
            If Name = String.Empty Then Return 0

            DLL_Category.Insert_NewsCategory(Name)
            Return 1
        Catch ex As Exception
            Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete_NewsCategory(ByVal Code As Long) As Boolean
        Try
            DLL_Category.Delete(Code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAllCategory() As DataTable

        Try
            Return DLL_Category.GetData
        Catch ex As Exception : Return Nothing
        End Try

    End Function


End Class

