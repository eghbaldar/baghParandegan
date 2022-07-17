Imports System.Data
Imports Microsoft.VisualBasic

<System.ComponentModel.DataObject()> _
Public Class Goods

    Dim DLL_Category As New DS_GoodsTableAdapters.GoodsCategoryTableAdapter
    Dim DLL_Goods As New DS_GoodsTableAdapters.GoodsTableAdapter
    Dim DLL_Nazarat As New DS_GoodsTableAdapters.Nazarat_GoodsTableAdapter
    Dim DLL_Picture As New DS_GoodsTableAdapters.Tbl_Picture_GoodsTableAdapter
    Dim DLL_Query As New DS_GoodsTableAdapters.Query

    '-----> Category
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAll_Category() As DataTable
        Try
            Return DLL_Category.GetData
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function insert_Category(ByVal Name As String) As Integer

        If Name = "" Then Return 0
        Try
            DLL_Category.Insert_Category_Goods(Name)
            Return 1
        Catch ex As Exception
            Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete_Category(ByVal code_category As Long) As Boolean
        Try
            DLL_Category.Delete_CategoryGoods(code_category)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function Update_Category(ByVal name As String, ByVal code As Long) As Integer

        If name = "" Then Return 0
        Try
            DLL_Category.Update_Category_Goods(name, code)
            Return 1
        Catch ex As Exception
            Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectRow_Category(ByVal ID As Long) As DataTable
        Try
            Return DLL_Category.GetData_SelectCategory(ID)
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    '-----> Goods
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAll_Goods() As DataTable
        Try
            Return DLL_Goods.GetData
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function insert_Goods(ByVal Name As String, ByVal lid As String, ByVal full As String, ByVal code As String _
                                 , ByVal Price As Long, ByVal vazn As String, ByVal Tarikh_sabt As String _
                                 , ByVal visit As Long, ByVal Tolid_konandegan As String, ByVal attribute As String, ByVal rating As Long, _
                                 ByVal filename As String, ByVal flag As Byte, ByVal username As String, ByVal code_category As Long) As Integer

        If Name = "" Then Return 0
        If lid = "" Then Return 0
        If full = "" Then Return 0
        If code_category = 0 Then Return 0
        Try
            Dim Tarikh As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate)
            Dim Time As String = Mid(Now.TimeOfDay.ToString(), 1, 8)
            DLL_Goods.Insert_Goods(Name, lid, full, code, Price, vazn, Tarikh_sabt, visit, Tolid_konandegan, attribute, rating, _
                                   filename, Tarikh, Time, flag, username, code_category)
            Return 1
        Catch ex As Exception
            Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete_Goods(ByVal ID As Long) As Boolean
        Try
            DLL_Goods.Delete_Goods(ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function Update_Goods(ByVal Name As String, ByVal lid As String, ByVal full As String, ByVal code As String _
                                 , ByVal Price As Long, ByVal vazn As String, ByVal Tarikh_sabt As String _
                                 , ByVal visit As Long, ByVal Tolid_konandegan As String, ByVal attribute As String, ByVal rating As Long, _
                                 ByVal filename As String, ByVal flag As Byte, ByVal username As String, _
                                 ByVal code_category As Long, ByVal ID As Long) As Integer

        If Name = "" Then Return 0
        If lid = "" Then Return 0
        If full = "" Then Return 0
        Try
            Dim Tarikh As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate)
            Dim Time As String = Mid(Now.TimeOfDay.ToString(), 1, 8)
            DLL_Goods.Update_Goods(Name, lid, full, code, Price, vazn, Tarikh_sabt, visit, Tolid_konandegan, attribute, _
                                  rating, filename, Tarikh, Time, flag, username, code_category, ID)
            Return 1
        Catch ex As Exception
            Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectRow_Goods(ByVal ID As Long) As DataTable
        Try
            Return DLL_Goods.GetData_SelectGoods(ID)
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetFile(ByVal ID As Long) As String
        Try
            Return DLL_Query.GetFile(ID)
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateFile(ByVal filename As String, ByVal ID As Long) As Integer

        Try
            DLL_Goods.UpdateFile(filename, ID)
            Return 1
        Catch ex As Exception
            Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function ZeroVisit(ByVal ID As Long) As Integer

        Try
            DLL_Query.Zero_Visit(ID)
            Return 1
        Catch ex As Exception
            Return -1
        End Try

    End Function

    '-----> Nazarat
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAll_Nazarat() As DataTable
        Try
            Return DLL_Nazarat.GetData
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function Insert_Nazarat(ByVal ID_Goods As Long, ByVal FnLn As String, ByVal Email As String, _
                                   ByVal message As String, ByVal Website As String, ByVal IP As String, _
                                   ByVal Flag As Byte) As Integer
        If FnLn = "" Then Return 0
        If Email = "" Then Return 0
        If message = "" Then Return 0

        Try
            Dim Tarikh As String = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate)
            Dim Time As String = Mid(Now.TimeOfDay.ToString(), 1, 8)
            Dim DateTime As String = Tarikh + "||" + Time
            DLL_Nazarat.Insert_Nazarat(ID_Goods, FnLn, Email, Website, message, DateTime, IP, Flag)
            Return 1
        Catch ex As Exception
            Return -1
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete_nazarat(ByVal ID As Long) As Boolean
        Try
            DLL_Nazarat.Delete_Nazarat(ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function Update_nazarat(ByVal Flag As Byte, ByVal ID As Long) As Integer

        Try
            DLL_Nazarat.Update_nazarat(Flag, ID)
            Return 1
        Catch ex As Exception
            Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectRow_Nazarat(ByVal ID As Long) As DataTable
        Try
            Return DLL_Nazarat.GetData_SelectNazarat(ID)
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function Select_Nazar(ByVal ID As Long) As DataTable
        Try
            Return DLL_Nazarat.GetData_selectnazar(ID)
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    '----> Pictures
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAll_Picture() As DataTable
        Try
            Return DLL_Picture.GetData
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function Insert_Picture(ByVal ID_Goods As Long, ByVal Filename As String) As Integer

        If Filename = "" Then Return 0
        Try
            DLL_Picture.Insert_Pictures(ID_Goods, Filename, 0)
            Return 1
        Catch ex As Exception
            Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete_Picture(ByVal ID As Long) As Boolean
        Try
            DLL_Picture.Delete_Picture(ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function Update_Picture(ByVal Filename As String, ByVal ID As Long) As Integer

        Try
            DLL_Picture.Update_Goods(Filename, ID)
            Return 1
        Catch ex As Exception
            Return -1
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectRow_Picture(ByVal ID As Long) As DataTable
        Try
            Return DLL_Picture.GetData_SelectPicture(ID)
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function Update_Flag(ByVal ID As Long, ByVal ID_Goods As Long) As Integer

        Try
            DLL_Query.Update_Flag_GoodsPicture(ID, ID_Goods)
            Return 1
        Catch ex As Exception
            Return -1
        End Try

    End Function

    Public Function GetLastID() As String
        Try
            Return DLL_Query.GetLastID
        Catch ex As Exception
            Return ""
        End Try
    End Function

    Public Function UpdateZero(ByVal id_goods As Long) As Boolean
        Try
            DLL_Query.Update_FlagZero(id_goods)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    '-------> Rate

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete_Rate(ByVal ID As Long) As Boolean
        Try
            DLL_Query.DeleteRate(ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function



End Class
