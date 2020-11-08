<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Webhook.aspx.vb" Inherits="DSTools.Webhook" %>

<!DOCTYPE html>
<html>

<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link href="/main.css" rel="stylesheet"/>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/darkmode-js@1.5.7/lib/darkmode-js.min.js"></script>
    <script src="/script.js"></script>

    <title>Discord Tools</title>
</head>

<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-light fixed-top bg-white">
            <a class="navbar-brand" href="/">Discord Tools</a> <button aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler" data-target="#navbarCollapse" data-toggle="collapse" type="button"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="/">Home</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Tools
                        </a>
                        <div class="dropdown-menu bg-white" aria-labelledby="navbarDropdown">
                            <a class="nav-link" href="/Tools/Webhook">웹훅</a>
                            <a class="nav-link" href="/Tools/Lookup">검색</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Help
                        </a>
                        <div class="dropdown-menu bg-white" aria-labelledby="navbarDropdown1">
                            <a class="nav-link" href="/Help/Questions">자주 묻는 질문</a>
                            <a class="nav-link" href="/Help/Info">정보</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

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
                <asp:TextBox ID="txtWebhook" onchange="stoppedTyping()" onkeyup="stoppedTyping()" runat="server" class="form-control"></asp:TextBox>
            </div>


            <div class="md-form md-outline">
                <label>이름</label>
                <asp:TextBox ID="txtWebhookName" onchange="stoppedTyping()" onkeyup="stoppedTyping()" runat="server" class="form-control"></asp:TextBox>
            </div>

            <div class="md-form md-outline">
                <label>아바타 URL (선택 사항)</label>
                <asp:TextBox ID="txtAvatar" onchange="stoppedTyping()" onkeyup="stoppedTyping()" runat="server" class="form-control"></asp:TextBox>
            </div>

            <div class="md-form md-outline">
                <label>웹훅 내용</label>
                <textarea id="txtContent" onchange="stoppedTyping()" onkeyup="stoppedTyping()" runat="server" class="md-textarea form-control" style="min-height:40px"></textarea>
            </div>

            <br />

            <button type="button" runat="server" disabled="disabled" id="btnSearch" class="btn btn-primary float-right">전송</button>

            <br />
        </form>
    </main>
    
    <script>
        stoppedTyping();

        function stoppedTyping() {
            if (document.getElementById('txtWebhook').value.length > 0 && document.getElementById('txtWebhookName').value.length > 0 && document.getElementById('txtContent').value.length > 0) {
                document.getElementById('btnSearch').disabled = false;
            } else {
                document.getElementById('btnSearch').disabled = true;
            }
        }
    </script>
</body>
</html>