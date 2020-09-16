Imports System.Collections.Specialized
Imports System.Net

Public Class Http
    Public Shared Function Post(ByVal uri As String, ByVal pairs As NameValueCollection) As Byte()
        Dim numArray As Byte()

        Using webClient As WebClient = New WebClient()
            numArray = webClient.UploadValues(uri, pairs)
        End Using

        Return numArray
    End Function
End Class