Imports System.IO
Imports System.Net
Imports Newtonsoft.Json.Linq

Module DiscordGuild
    Public jsonObject As JObject

    Public Function getDiscordGuild(id As String)
        Dim url As String = $"https://discord.com/api/invite/{id}"

        Dim responseText As String = String.Empty
        Dim request As HttpWebRequest = CType(WebRequest.Create(url), HttpWebRequest)
        request.Method = "GET"
        request.Timeout = 30 * 1000

        Try
            Using resp As HttpWebResponse = CType(request.GetResponse(), HttpWebResponse)
                Dim status As HttpStatusCode = resp.StatusCode
                Dim respStream As Stream = resp.GetResponseStream()

                Using sr As StreamReader = New StreamReader(respStream)
                    responseText = sr.ReadToEnd()
                End Using
            End Using

            jsonObject = JObject.Parse(responseText)
        Catch ex As Exception
            Return vbNull
        End Try

        Return True
    End Function

    Public Function GetInfo1(name As String)
        Try
            If name = "guild.icon" Then
                If String.IsNullOrWhiteSpace(jsonObject.SelectToken("guild.icon")) Then
                    Return String.Empty
                Else
                    Return $"https://cdn.discordapp.com/icons/{jsonObject.SelectToken("guild.id")}/{jsonObject.SelectToken("guild.icon")}"
                End If
            Else
                Return jsonObject.SelectToken(name)
            End If
        Catch ex As Exception
            Return vbNull
        End Try
    End Function
End Module