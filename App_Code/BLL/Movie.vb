Imports System.Data
Imports Microsoft.VisualBasic

<System.ComponentModel.DataObject()> _
Public Class Movie

    Dim DLL As New DS_MovieTableAdapters.MovieTableAdapter
    Dim DLL_Category As New DS_MovieTableAdapters.MovieCategoryTableAdapter

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAll() As DataTable

        Try
            Return DLL.GetData
        Catch ex As Exception : Return Nothing
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectRow(ByVal ID As Long) As DataTable

        Try
            Return DLL.GetData_SelectRow(ID)
        Catch ex As Exception : Return Nothing
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function Insert_Movie(ByVal Title As String, ByVal detail As String, ByVal Path As String, ByVal flag As Byte, ByVal username As String _
                                   , ByVal code_category As Long) As Integer

        If Title = "" Then Return 0
        If detail = "" Then Return 0
        If Path = "" Then Return 0
        If username = "" Then Return 0
        If code_category = Nothing Then Return 0

        Try
            DLL.Insert_Movie(Title, detail, Path, flag, username, code_category)
            Return 1
        Catch ex As Exception : Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function Update_Movie(ByVal title As String, ByVal detail As String, ByVal path As String, ByVal flag As Byte, ByVal username As String, _
                                   ByVal code_category As Long, ByVal ID As Long) As Integer

        If title = "" Then Return 0
        If detail = "" Then Return 0
        If path = "" Then Return 0
        If username = "" Then Return 0
        If code_category = Nothing Then Return 0

        Try
            DLL.Update_Movie(title, detail, path, flag, username, code_category, ID)
            Return 1
        Catch ex As Exception : Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete_Movie(ByVal ID As Long) As Boolean

        Try
            DLL.Delete_Movie(ID)
            Return True
        Catch ex As Exception : Return False
        End Try

    End Function

    '------------------------------------------------

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function Insert_MovieCategory(ByVal Name As String) As Integer

        Try
            If Name = String.Empty Then Return 0

            DLL_Category.Insert_MovieCategory(Name)
            Return 1
        Catch ex As Exception
            Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete_MovieCategory(ByVal Code As Long) As Boolean
        Try
            DLL_Category.Delete_MovieCategory(Code)
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
