Imports Microsoft.VisualBasic
Imports System.Data

<System.ComponentModel.DataObject()> _
Public Class MyMembership

    Dim DLL_Profile As New DS_MembershipTableAdapters.Tbl_ProfileTableAdapter
    Dim DLL_SelectAllUser As New DS_MembershipTableAdapters.SelectAllUserTableAdapter
    Dim DLL_SelectAllUser_ByPicture As New DS_MembershipTableAdapters.SelectAllUser_ByPictureTableAdapter
    Dim DLL_SelectRowDetailUser As New DS_MembershipTableAdapters.Select_Row_DetailUserTableAdapter

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function InsertProfileUser(ByVal username As String, ByVal fn As String, ByVal ln As String, ByVal T_Sal As String, _
                                      ByVal T_Mah As String, ByVal T_Roz As String, ByVal code_meli As String, ByVal Pedar_name As String, _
                                      ByVal Tel As String, ByVal Mob As String, ByVal Tahsilat As String, ByVal Job As String, _
                                      ByVal Ghad As String, ByVal Vazn As String, ByVal MF As Byte, ByVal Tahool As Byte, ByVal Bache As String, ByVal Din As String, _
                                      ByVal City As String, ByVal Country As String, ByVal WebPage As String, ByVal Email_1 As String, ByVal Email_2 As String, _
                                      ByVal Address As String, ByVal code_posti As String, ByVal image As String) As Boolean
        Try
            DLL_Profile.Insert(username, fn, ln, T_Sal, T_Mah, T_Roz, code_meli, Pedar_name, Tel, Mob, Tahsilat, Job, Ghad, Vazn, MF, Tahool, Bache, _
                            Din, City, Country, WebPage, Email_1, Email_2, Address, code_posti, image)
            Return True
        Catch ex As Exception
            Return False
        End Try

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAllUser() As DataTable
        Try
            Return DLL_SelectAllUser.GetData
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectAllUser_ByPicture() As DataTable
        Try
            Return DLL_SelectAllUser_ByPicture.GetData
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function SelectDetailInfoUser(ByVal username As String) As DataTable
        Try
            Return DLL_SelectRowDetailUser.GetData(username)
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateImage(ByVal StrPath As String, ByVal Username As String) As Boolean
        Try
            DLL_Profile.Update_Image(StrPath, Username)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function Delete_Profile(ByVal username As String) As Boolean
        Try
            Roles.RemoveUserFromRoles(username, Roles.GetRolesForUser(username)) ' {2.5}
            Membership.DeleteUser(username) ' {2}
            DLL_Profile.Delete_Profile(username) ' {1}
            DLL_Profile.Delete_ExtraRowInASPnet_Users(username) ' {3}
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateProfile(ByVal fn As String, ByVal ln As String, ByVal tavalod_sal As String, ByVal tavalod_mah As String, ByVal tavalod_roz As String, _
                                  ByVal code_meli As String, ByVal pedar As String, ByVal tel As String, ByVal mobile As String, ByVal tahsilat As String, _
                                  ByVal Job As String, ByVal ghad As String, ByVal vazn As String, ByVal MF As Byte, ByVal Tahol As Byte, ByVal Bache As String, ByVal Din As String, _
                                  ByVal city As String, ByVal Country As String, ByVal WebPage As String, ByVal E1 As String, ByVal E2 As String, _
                                  ByVal Address As String, ByVal Code_posti As String, ByVal username As String) As Boolean
        Try
            DLL_Profile.Update_Profile(fn, ln, tavalod_sal, tavalod_mah, tavalod_roz, code_meli, pedar, tel, mobile, tahsilat, Job, ghad, _
                                       vazn, MF, Tahol, Bache, Din, Country, city, WebPage, E1, E2, Address, Code_posti, username)
            Return True
        Catch ex As Exception : Return False
        End Try
    End Function

End Class
