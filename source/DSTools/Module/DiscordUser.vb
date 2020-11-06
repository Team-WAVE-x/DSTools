Imports System.IO
Imports System.Net
Imports Newtonsoft.Json.Linq

Module DiscordUser
    Public jsonObject As JObject

    Public Function getDiscordUser(id As String)
        Dim url As String = $"https://discordapp.com/api/users/{id}"

        Dim responseText As String = String.Empty
        Dim request As HttpWebRequest = CType(WebRequest.Create(url), HttpWebRequest)
        request.Method = "GET"
        request.Timeout = 30 * 1000
        request.Headers.Add("authorization", "")

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

    Public Function Bin2Dec(ByVal ans As String) As Double
        Dim dig As String, p As Integer
        Dim dec, B, d As Double
        p = 0
        For x As Integer = ans.Length - 1 To 0 Step -1
            dig = ans.Substring(x, 1)
            If Not (dig = "0" Or dig = "1") Then
                dec = 0
                Exit For
            End If
            Double.TryParse(dig, B)
            d = B * (2 ^ p)
            dec = dec + d
            p = p + 1
        Next x
        Return dec
    End Function

    Public Function UnixTimeStampToDateTime(ByVal unixTimeStamp As Double) As DateTime
        Dim dtDateTime As System.DateTime = New DateTime(1970, 1, 1, 0, 0, 0, 0, System.DateTimeKind.Utc)
        dtDateTime = dtDateTime.AddSeconds(unixTimeStamp).ToLocalTime()
        Return dtDateTime
    End Function

    Public Function DiscordId2Timestamp(str As String)
        Dim ID As Long = Convert.ToInt64(str)
        Dim ID_Bin As String = Left(Convert.ToString(ID, 2).PadLeft(64, "0"c), 42)
        Dim ID_Decimal As Double = Bin2Dec(ID_Bin)

        Return UnixTimeStampToDateTime((ID_Decimal + 1420070400000) / 1000)
    End Function

    Public Function GetInfo(name As String)
        Try
            If name = "avatar" Then
                If String.IsNullOrEmpty(jsonObject.SelectToken("avatar")) Then
                    Return $"https://cdn.discordapp.com/embed/avatars/{CInt(jsonObject.SelectToken("discriminator")) Mod 5}.png"
                Else
                    Return $"https://cdn.discordapp.com/avatars/{jsonObject.SelectToken("id")}/{jsonObject.SelectToken("avatar")}"
                End If
            Else
                Return jsonObject.SelectToken(name)
            End If
        Catch ex As Exception
            Return vbNull
        End Try
    End Function
End Module