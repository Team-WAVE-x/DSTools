<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Webhook.aspx.vb" Inherits="DSTools.Webhook" %>

<!DOCTYPE html>
<html>

<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

    <title>Discord Tools</title>
</head>

<body class="rgba-grey-slight" style="font-family: 'Nanum Gothic', sans-serif;">
    <nav class="navbar navbar-expand-lg shadow-sm navbar-light p-3 mb-5" style="background-color: #ffffff;">
        <a class="navbar-brand" href="/Home">Discord Tools</a> <button aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler" data-target="#navbarNavAltMarkup" data-toggle="collapse" type="button"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link" href="/Home">Home</a> <a class="nav-link active" href="/Webhook">Webhook<span class="sr-only">(current)</span></a> <a class="nav-link" href="/Lookup">User Lookup</a>
            </div>
        </div>
    </nav>

    <main class="container" role="main">
        <form id="form1" runat="server" autocomplete="off">

            <div id="pnlError" visible="false" runat="server" class="alert alert-danger alert-dismissible fade show" role="alert">
                웹훅 전송에 실패했습니다.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div id="pnlSucess" visible="false" runat="server" class="alert alert-success alert-dismissible fade show" role="alert">
                웹훅 전송에 성공했습니다!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <h1>Webhook</h1>

            <br />

            <div class="md-form md-outline">
                <label class="transparent">웹훅 URL</label>
                <asp:TextBox ID="txtWebhook" runat="server" class="form-control" aria-describedby="inputGroup-sizing-default"></asp:TextBox>
            </div>


            <div class="md-form md-outline">
                <label>이름</label>
                <asp:TextBox ID="txtWebhookName" runat="server" class="form-control" aria-describedby="inputGroup-sizing-default-1"></asp:TextBox>
            </div>

            <div class="md-form md-outline">
                <label>아바타 URL</label>
                <asp:TextBox ID="txtAvatar" runat="server" class="form-control" aria-describedby="inputGroup-sizing-default-2"></asp:TextBox>
            </div>

            <div class="md-form md-outline">
                <label>웹훅 내용</label>
                <textarea id="txtContent" runat="server" class="md-textarea form-control"></textarea>
            </div>

            <br />

            <button type="button" runat="server" id="btnSearch" class="btn float-right">전송</button>
        </form>
    </main>

    <style>
        .md-form.md-outline label.active {
            background: #F5F5F5;
        }
    </style>
</body>

</html>