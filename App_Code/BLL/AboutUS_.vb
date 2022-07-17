Imports Microsoft.VisualBasic
Imports System.Data

Public Class AboutUS_
    Dim DLL As New DS_AboutUSTableAdapters.Tbl_AboutUSTableAdapter

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAll() As DataTable
        Try
            Return DLL.GetData
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function Update(ByVal TEXT As String, ByVal ID As Long) As Int16
        If TEXT = "" Then Return 0
        Try
            DLL.UpdateAboutUS(TEXT, ID)
            Return 1
        Catch ex As Exception
            Return -1
        End Try
    End Function
End Class
