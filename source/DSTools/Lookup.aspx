<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Lookup.aspx.vb" Inherits="DSTools.Lookup" %>

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
                <a class="nav-link" href="/Home">Home</a> <a class="nav-link" href="/Webhook">Webhook</a> <a class="nav-link active" href="/Lookup">User Lookup<span class="sr-only">(current)</span></a>
            </div>
        </div>
    </nav>
    <main class="container" role="main">
        <form id="form1" runat="server" autocomplete="off">
            <h1>User Lookup</h1>
            <br />
            <div class="shadow p-4 mb-5 bg-white rounded" style="height: 70px;">
                <asp:TextBox style="border:none" Width="100%" ID="txtID" runat="server" aria-label="Default" aria-describedby="inputGroup-sizing-default"></asp:TextBox>
            </div>

            <button type="button" runat="server" id="btnSearch" class="btn float-right">검색</button>

            <br />
            <br />
            <br />

            <div class="shadow p-4 mb-5 bg-white rounded" runat="server" id="card1" visible="false">
                <h5>유저 정보</h5>
                <br />
                <div>
                    <img runat="server" id="image1" src="https://cdn.discordapp.com/embed/avatars/0.png" style="width: 100px; height: 100px" class="rounded">
                    <br />
                    <br />
                    <p class="card-text" runat="server" id="lblDescription">With supporting text below as a natural lead-in to additional content.</p>
                </div>
            </div>
        </form>
    </main>

    <style>
        input.middle:focus {
            outline-width: 0;
        }

        input:focus,
        select:focus,
        textarea:focus,
        button:focus {
            outline: none;
        }
    </style>
</body>

</html>