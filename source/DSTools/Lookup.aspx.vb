Imports System.IO
Imports System.Net
Imports Newtonsoft.Json.Linq

Public Class Lookup
    Inherits System.Web.UI.Page

    Protected Function getDiscordUser(id As String)
        Dim url As String = $"https://discordapp.com/api/users/{id}"

        Dim responseText As String = String.Empty
        Dim request As HttpWebRequest = CType(WebRequest.Create(url), HttpWebRequest)
        request.Method = "GET"
        request.Timeout = 30 * 1000
        request.Headers.Add("authorization", "NjQ2OTY4MjAzMjY3ODAxMDg5.X1qt7Q.tTIRnSWxZwM3DbyNXBvzUEinncE")

        Using resp As HttpWebResponse = CType(request.GetResponse(), HttpWebResponse)
            Dim status As HttpStatusCode = resp.StatusCode
            Dim respStream As Stream = resp.GetResponseStream()

            Using sr As StreamReader = New StreamReader(respStream)
                responseText = sr.ReadToEnd()
            End Using
        End Using

        Return responseText
    End Function

    Function Bin2Dec(ByVal ans As String) As Double
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

    Public Shared Function UnixTimeStampToDateTime(ByVal unixTimeStamp As Double) As DateTime
        Dim dtDateTime As System.DateTime = New DateTime(1970, 1, 1, 0, 0, 0, 0, System.DateTimeKind.Utc)
        dtDateTime = dtDateTime.AddSeconds(unixTimeStamp).ToLocalTime()
        Return dtDateTime
    End Function

    Private Sub btnSearch_ServerClick(sender As Object, e As EventArgs) Handles btnSearch.ServerClick
        Dim errorflag As Boolean = False
        Dim jsonString As String = String.Empty

        Try
            jsonString = getDiscordUser(TextBox1.Text.ToString())
        Catch ex As Exception
            errorflag = True
        End Try


        If errorflag = False Then
            Dim jsonObject As JObject = JObject.Parse(jsonString)

            If Not String.IsNullOrWhiteSpace(jsonObject.SelectToken("username")) And Not String.IsNullOrWhiteSpace(TextBox1.Text) Then
                Dim ID As Long = Convert.ToInt64(TextBox1.Text)
                Dim ID_Bin As String = Left(Convert.ToString(ID, 2).PadLeft(64, "0"c), 42)
                Dim ID_Decimal As Double = Bin2Dec(ID_Bin)

                If String.IsNullOrWhiteSpace(jsonObject.SelectToken("avatar").ToString) Then
                    image1.Src = $"https://cdn.discordapp.com/embed/avatars/{CInt(jsonObject.SelectToken("discriminator")) Mod 5}.png"
                Else
                    image1.Src = $"https://cdn.discordapp.com/avatars/{jsonObject.SelectToken("id")}/{jsonObject.SelectToken("avatar")}"
                End If

                card1.Visible = True
                lblDescription.InnerHtml = $"유저 이름: {jsonObject.SelectToken("username")}<br/>태그: {jsonObject.SelectToken("discriminator")}<br/>가입일: {UnixTimeStampToDateTime((ID_Decimal + 1420070400000) / 1000)} UTC<br/>ID: {jsonObject.SelectToken("id")}"
            End If
        Else
            card1.Visible = False
        End If
    End Sub
End Class