Public Class Webhook
    Inherits System.Web.UI.Page

    Private Sub btnSearch_ServerClick(sender As Object, e As EventArgs) Handles btnSearch.ServerClick
        Try
            If Not String.IsNullOrWhiteSpace(TextBox1.Text) And Not String.IsNullOrWhiteSpace(TextBox2.Text) And Not String.IsNullOrWhiteSpace(TextBox3.Text) And Not String.IsNullOrWhiteSpace(Textbox4.InnerText) Then
                Dim message As NameValueCollection = New NameValueCollection() From {
                    {"username", TextBox2.Text},
                    {"avatar_url", TextBox3.Text},
                    {"content", Textbox4.InnerText}
                }

                Http.Post(TextBox1.Text, message)

                pnlError.Visible = False
                pnlSucess.Visible = True
            End If
        Catch ex As Exception
            pnlSucess.Visible = False
            pnlError.Visible = True
        End Try
    End Sub
End Class