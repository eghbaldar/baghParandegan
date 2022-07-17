Imports Microsoft.VisualBasic
Imports System.Data

<System.ComponentModel.DataObject()> _
Public Class IP

    Dim DLL As New DS_IPTableAdapters.Tbl_IPTableAdapter

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
            Return DLL.GetData_Select(ID)
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function DeleteIP(ByVal ID As Long) As Boolean
        Try
            DLL.Delete_IP(ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateIP(ByVal name As String, ByVal IP As String, ByVal flag As Byte, ByVal ID As Long) As Integer
        If name = "" Then Return 0
        If IP = "" Then Return 0
        Try
            DLL.Update_IP(name, IP, flag, ID)
            Return 1
        Catch ex As Exception
            Return -1
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function InsertIP(ByVal name As String, ByVal IP As String, ByVal flag As Byte) As Integer
        If name = "" Then Return 0
        If IP = "" Then Return 0
        Try
            DLL.Insert(name, IP, flag)
            Return 1
        Catch ex As Exception
            Return -1
        End Try
    End Function

End Class
