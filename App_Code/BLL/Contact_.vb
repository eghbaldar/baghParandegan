Imports Microsoft.VisualBasic
Imports System.Data

<System.ComponentModel.DataObject()> _
Public Class Contact_

    Dim DLL As New DS_ContactTableAdapters.Tbl_ContactTableAdapter

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAll() As DataTable
        Try
            Return DLL.GetData
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function InsertConatct(ByVal Name As String, ByVal Email As String, ByVal Subject As String, ByVal Text As String, ByVal IP As String) As Integer
        If Name = "" Then Return 0
        If Subject = "" Then Return 0
        If Text = "" Then Return 0
        Try
            DLL.InsertConatact(Name, Email, Subject, Text, IP)
            Return 1
        Catch ex As Exception
            Return -1
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function DeleteContact(ByVal ID As Long) As Boolean
        Try
            DLL.DeleteContact(ID)
            Return True
        Catch ex As Exception
            Return False
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

End Class
