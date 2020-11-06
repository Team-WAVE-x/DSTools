Imports System.IO
Imports System.Net
Imports Newtonsoft.Json.Linq

Public Class Lookup
    Inherits System.Web.UI.Page

    Private Sub btnSearch_ServerClick(sender As Object, e As EventArgs) Handles btnSearch.ServerClick
        If select1.Value = "유저" Then
            If Not getDiscordUser(txtID.Text) = vbNull And Not String.IsNullOrWhiteSpace(GetInfo("username")) And Not String.IsNullOrWhiteSpace(txtID.Text) Then
                image1.Visible = True
                card1.Visible = True

                image1.Src = GetInfo("avatar")
                lblDescription.InnerHtml =
                $"
                유저 이름: {GetInfo("username")}<br/>
                태그: {GetInfo("discriminator")}<br/>
                가입일: {DiscordId2Timestamp(txtID.Text)} UTC<br/>
                아이디: {GetInfo("id")}
            "
            Else
                card1.Visible = False
            End If
        Else
            If Not getDiscordGuild(txtID.Text) = vbNull And Not String.IsNullOrWhiteSpace(GetInfo1("guild.name")) And Not String.IsNullOrWhiteSpace(txtID.Text) Then
                image1.Visible = True
                card1.Visible = True

                If Not GetInfo1("guild.icon") = String.Empty Then
                    image1.Src = GetInfo1("guild.icon")
                Else
                    image1.Visible = False
                End If

                lblDescription.InnerHtml =
                $"
                서버 이름: {GetInfo1("guild.name")}<br/>
                보안 수준: {GetInfo1("guild.verification_level")}<br/>
                생성일: {DiscordId2Timestamp(GetInfo1("guild.id"))} UTC<br/>
                아이디: {GetInfo1("guild.id")}
                "
            Else
                card1.Visible = False
            End If
        End If
    End Sub
End Class