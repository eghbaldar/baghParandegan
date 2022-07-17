Imports Microsoft.VisualBasic
Imports System.Data

<System.ComponentModel.DataObject()> _
Public Class OutOfLimit

    Dim DLL As New DS_OutOfLimitTableAdapters.OutOfLimitTableAdapter

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
            DLL.Update_OOL(TEXT, ID)
            Return 1
        Catch ex As Exception
            Return -1
        End Try
    End Function

End Class
