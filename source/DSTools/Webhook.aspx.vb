Public Class Webhook
    Inherits System.Web.UI.Page

    Private Sub btnSearch_ServerClick(sender As Object, e As EventArgs) Handles btnSearch.ServerClick
        Try
            If Not String.IsNullOrWhiteSpace(txtWebhook.Text) And Not String.IsNullOrWhiteSpace(txtWebhookName.Text) And Not String.IsNullOrWhiteSpace(txtAvatar.Text) And Not String.IsNullOrWhiteSpace(txtContent.InnerText) Then
                Dim message As NameValueCollection = New NameValueCollection() From {
                    {"username", txtWebhookName.Text},
                    {"avatar_url", txtAvatar.Text},
                    {"content", txtContent.InnerText}
                }

                Http.Post(txtWebhook.Text, message)

                pnlError.Visible = False
                pnlSucess.Visible = True
            End If
        Catch ex As Exception
            pnlSucess.Visible = False
            pnlError.Visible = True
        End Try
    End Sub
End Class