Imports Microsoft.VisualBasic
Imports System.Data

<System.ComponentModel.DataObject()> _
Public Class Email

    Dim DLL As New DS_EmailTableAdapters.Tbl_Mail_SMTPTableAdapter
    Dim DLL_Category As New DS_EmailTableAdapters.Tbl_EmailCategoryTableAdapter
    Dim DLL_Email As New DS_EmailTableAdapters.Tbl_EmailsTableAdapter
    '--------- SMTP
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAll() As DataTable
        Try
            Return DLL.GetData
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function Update_SMTP(ByVal server As String, ByVal email As String, ByVal pass As String) As Integer
        Try
            If server = "" Then Return 0
            If email = "" Then Return 0
            If pass = "" Then Return 0
            DLL.Update_SMTP(server, email, pass)
            Return 1
        Catch ex As Exception
            Return -1
        End Try
    End Function

    '--------- Category
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAll_Category() As DataTable
        Try
            Return DLL_Category.GetData
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function Insert_Category(ByVal Category_Name As String) As Integer
        If Category_Name = "" Then Return 0
        Try
            DLL_Category.Insert_Category(Category_Name)
            Return 1
        Catch ex As Exception
            Return -1
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete_Category(ByVal Category_code As Long) As Boolean
        Try
            DLL_Category.DeleteCategory(Category_code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function Update_Category(ByVal Category_Name As String, ByVal code_category As Long) As Integer
        If Category_Name = "" Then Return 0
        Try
            DLL_Category.UpdateCategory(Category_Name, code_category)
            Return 1
        Catch ex As Exception
            Return -1
        End Try
    End Function

    '---------- Email
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAll_Email() As DataTable
        Try
            Return DLL_Email.GetData
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectRow_Email(ByVal ID As Long) As DataTable
        Try
            Return DLL_Email.GetData_SelectRow(ID)
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function Insert_Email(ByVal code_category As Long, ByVal Name As String, ByVal Email As String, ByVal username As String) As Integer
        If Name = "" Then Return 0
        If Email = "" Then Return 0
        If username = "" Then Return 0
        Try
            DLL_Email.InsertEmail(code_category, Name, Email, username)
            Return 1
        Catch ex As Exception
            Return -1
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete_Email(ByVal ID As Long) As Boolean
        Try
            DLL_Email.DeleteEmail(ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function Update_Email(ByVal code_category As Long, ByVal Name As String, ByVal Email As String, _
                                 ByVal username As String, ByVal ID As Long) As Integer
        If Name = "" Then Return 0
        If Email = "" Then Return 0
        If username = "" Then Return 0
        Try
            DLL_Email.UpdateEmail(code_category, Name, Email, username, ID)
            Return 1
        Catch ex As Exception
            Return -1
        End Try
    End Function

End Class
