Imports Microsoft.VisualBasic
Imports System.Data

<System.ComponentModel.DataObject()> _
Public Class Article

    Dim DLL As New DS_ArticleTableAdapters.Tbl_ArticleTableAdapter
    Dim DLL_Category As New DS_ArticleTableAdapters.Tbl_ArticleCategoryTableAdapter
    Dim DLL_Nazarat As New DS_ArticleTableAdapters.Tbl_Nazarat_ArticleTableAdapter

    '--------------- Article

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function Insert_Article(ByVal title As String, ByVal lid As String, ByVal Article As String, ByVal E As Integer, _
                       ByVal UN As String, ByVal Code_Cat As Long) As Integer

        Try
            If title = "" Then : Return 0
            ElseIf lid = "" Then : Return 0
            ElseIf Article = "" Then : Return 0
            ElseIf UN = "" Then : Return 0
            ElseIf Code_Cat = Nothing Then : Return 0
            End If

            Dim Tarikh As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate)
            Dim Time As String = Mid(Now.TimeOfDay.ToString(), 1, 8)
            DLL.Insert_Article(title, lid, Article, Tarikh, Time, E, UN, Code_Cat)
            Return 1
        Catch ex As Exception : Return False
            Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete(ByVal ID As Integer) As Boolean

        Try
            DLL.Delete_Article(ID) 'RowAffected
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
    Public Function Update_Article(ByVal title As String, ByVal lid As String, ByVal Article As String, _
                           ByVal E As Integer, ByVal UN As String, ByVal Code_Cat As Long, ByVal id As Integer) As Integer

        Try
            If title = "" Then : Return 0
            ElseIf lid = "" Then : Return 0
            ElseIf Article = "" Then : Return 0
            ElseIf UN = "" Then : Return 0
            ElseIf Code_Cat = Nothing Then : Return 0
            End If

            Dim Tarikh As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate)
            Dim Time As String = Mid(Now.TimeOfDay.ToString(), 1, 8)
            DLL.Update_Article(title, lid, Article, Tarikh, Time, E, UN, Code_Cat, id)
            Return 1
        Catch ex As Exception : Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectRow(ByVal id As Integer) As DataTable

        Try
            Return DLL.GetData_SelectRow(id)
        Catch ex As Exception : Return Nothing
        End Try

    End Function

    '-------------- Category Article

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function Insert_ArticleCategory(ByVal Name As String) As Integer

        Try
            If Name = String.Empty Then Return 0
            DLL_Category.Insert_Category(Name)
            Return 1
        Catch ex As Exception
            Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete_ArticleCategory(ByVal Code As Long) As Boolean
        Try
            DLL_Category.Delete_Category(Code)
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

    '---------------- Nazarat

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAllNazarat() As DataTable

        Try
            Return DLL_Nazarat.GetData
        Catch ex As Exception : Return Nothing
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function Insert_ArticleNazarat(ByVal ID_Article As Long, ByVal FnLn As String, ByVal Email As String, _
                                   ByVal message As String, ByVal Website As String, ByVal IP As String, _
                                   ByVal Flag As Byte) As Integer

        If FnLn = "" Then Return 0
        If Email = "" Then Return 0
        If message = "" Then Return 0
        Try
            Dim Tarikh As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate)
            Dim Time As String = Mid(Now.TimeOfDay.ToString(), 1, 8)
            Dim DateTime As String = Tarikh + "||" + Time

            DLL_Nazarat.Insert_Nazarat(ID_Article, FnLn, Email, Website, message, DateTime, IP, Flag)
            Return 1
        Catch ex As Exception
            Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete_ArticleNazarat(ByVal Code As Long) As Boolean
        Try
            DLL_Nazarat.Delete_nazarat(Code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectNazar(ByVal ID As Long) As DataTable
        Try
            Return DLL_Nazarat.GetData_SelectNazar(ID)
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectNazarRow(ByVal ID As Long) As DataTable
        Try
            Return DLL_Nazarat.GetData_SelectRow(ID)
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

End Class
