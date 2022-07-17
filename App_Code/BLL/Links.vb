Imports Microsoft.VisualBasic
Imports System.Data

<System.ComponentModel.DataObject()> _
Public Class Links

    Dim DLL As New DS_LinksTableAdapters.Tbl_LinksTableAdapter

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAll() As DataTable
        Try
            Return DLL.GetData
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
        Public Function SelectRow(ByVal ID As Long) As DataTable
        Try
            Return DLL.GetData_SelectRow(ID)
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function Insert(ByVal link As String, ByVal path As String, ByVal flag As Byte, _
                           ByVal username As String, ByVal name As String) As Integer

        If link = "" Then Return 0
        If username = "" Then Return 0
        If name = "" Then Return 0
        Try
            DLL.Insert(link, path, flag, username, name)
            Return 1
        Catch ex As Exception
            Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete(ByVal ID As Long) As Boolean

        Try
            DLL.Delete_Link(ID)
            Return True
        Catch ex As Exception
            Return False
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function Update(ByVal link As String, ByVal path As String, ByVal flag As Byte, ByVal username As String, _
                           ByVal name As String, ByVal ID As Long) As Integer
        If link = "" Then Return 0
        If username = "" Then Return 0
        If name = "" Then Return 0
        Try
            DLL.Update_link(link, path, flag, username, name, ID)
            Return 1
        Catch ex As Exception
            Return -1
        End Try

    End Function

End Class
