Imports DiscordWebhook

Public Class Webhook
    Inherits System.Web.UI.Page

    Private Sub btnSearch_ServerClick(sender As Object, e As EventArgs) Handles btnSearch.ServerClick
        Try
            If Not String.IsNullOrWhiteSpace(txtWebhook.Text) And Not String.IsNullOrWhiteSpace(txtWebhookName.Text) And Not String.IsNullOrWhiteSpace(txtContent.InnerText) Then
                Dim webhook As DiscordWebhook.Webhook = New DiscordWebhook.Webhook(txtWebhook.Text)
                Dim obj As WebhookObject = New WebhookObject()

                obj = New WebhookObject() With {
                    .username = txtWebhookName.Text,
                    .content = txtContent.InnerText,
                    .avatar_url = txtAvatar.Text
                }

                webhook.PostData(obj)

                pnlError.Visible = False
                pnlSucess.Visible = True
            End If
        Catch ex As Exception
            pnlSucess.Visible = False
            pnlError.Visible = True
        End Try
    End Sub
End Class