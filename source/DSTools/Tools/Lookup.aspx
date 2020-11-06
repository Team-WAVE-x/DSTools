<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Lookup.aspx.vb" Inherits="DSTools.Lookup" %>

<!DOCTYPE html>
<html>

<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

    <title>Discord Tools</title>
</head>

<body class="rgba-grey-slight">
    <header>
        <nav class="navbar navbar-expand-md navbar-light fixed-top bg-white" style="color: #ffffff;">
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
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="nav-link" href="/Tools/Webhook">웹훅</a>
                            <a class="nav-link" href="/Tools/Lookup">검색</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Help
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
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
            <h1>Lookup</h1>
            <br />
            <div class="shadow p-4 mb-5 bg-white rounded" style="height: 70px;">
                <select style="width: 5%; border: none;" onchange="modeSelectChange()" id="select1" runat="server">
                    <option>유저</option>
                    <option>서버</option>
                </select>
                <asp:TextBox type="number" style="border:none" Width="85%" onchange="stoppedTyping()" onkeyup="stoppedTyping()" ID="txtID" runat="server" aria-label="Default" placeholder="유저 ID를 입력해 주세요." aria-describedby="inputGroup-sizing-default"></asp:TextBox>
            </div>

            <button type="button" runat="server" disabled="disabled" id="btnSearch" class="btn btn-primary float-right">검색</button>

            <br />
            <br />
            <br />

            <div class="shadow p-4 mb-5 bg-white rounded" runat="server" id="card1" visible="false">
                <h5 class="mb-0">정보</h5>
                <div>
                    <img runat="server" id="image1" style="width: 100px; height: 100px" class="rounded mt-2 mb-2">
                    <p class="card-text" runat="server" id="lblDescription"></p>
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

        body {
            padding-top: 6rem;
            font-family: 'Noto Sans KR', sans-serif;
        }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
          -webkit-appearance: none;
          margin: 0;
        }

        input[type=number] {
          -moz-appearance: textfield;
        }
    </style>

    <script>
        stoppedTyping()
        modeSelectChange()

        function stoppedTyping() {
            if (document.getElementById('txtID').value.length > 0) {
                document.getElementById('btnSearch').disabled = false;
            } else {
                document.getElementById('btnSearch').disabled = true;
            }
        }

        function modeSelectChange() {
            var modeSelect = document.getElementById("select1");

            if (modeSelect.options[modeSelect.selectedIndex].text === '서버') {
                document.getElementById("txtID").attributes["type"].value = "text";
                document.getElementsByName('txtID')[0].placeholder = modeSelect.options[modeSelect.selectedIndex].text + " 초대 코드를 입력해 주세요. (예: bHFjYa6)"
            } else {
                document.getElementById("txtID").attributes["type"].value = "number";
                document.getElementsByName('txtID')[0].placeholder = modeSelect.options[modeSelect.selectedIndex].text + " ID를 입력해 주세요."
            }

            stoppedTyping()
        }
    </script>
</body>

</html>