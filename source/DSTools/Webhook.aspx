<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Webhook.aspx.vb" Inherits="DSTools.Webhook" %>

<!DOCTYPE html>
<html>
<head>
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js">
	</script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js">
	</script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js">
	</script>
	<title>Discord Tools</title>
</head>
<body style="background-color: #f5f5f5; font-family: 'Nanum Gothic', sans-serif;">
	<nav class="navbar navbar-expand-lg shadow-sm navbar-light p-3 mb-5" style="background-color: #ffffff;">
		<a class="navbar-brand" href="/Home">Discord Tools</a> <button aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler" data-target="#navbarNavAltMarkup" data-toggle="collapse" type="button"><span class="navbar-toggler-icon"></span></button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-link" href="/Home">Home</a> <a class="nav-link active" href="/Webhook">Webhook<span class="sr-only">(current)</span></a> <a class="nav-link" href="/Lookup">User Lookup</a>
			</div>
		</div>
	</nav>
	<main class="container" role="main">
		<form id="form1" runat="server">

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

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroup-sizing-default">웹훅 URL</span>
				</div>
				<br />
				<asp:TextBox ID="TextBox1" runat="server" Text="https://" class="form-control" aria-describedby="inputGroup-sizing-default"></asp:TextBox>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroup-sizing-default-1">웹훅 이름</span>
				</div>
				<br />
				<asp:TextBox ID="TextBox2" runat="server" Text="" class="form-control" aria-describedby="inputGroup-sizing-default-1"></asp:TextBox>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroup-sizing-default-2">웹훅 아바타 URL</span>
				</div>
				<br />
				<asp:TextBox ID="TextBox3" runat="server" Text="https://" class="form-control" aria-describedby="inputGroup-sizing-default-2"></asp:TextBox>
			</div>

			<div class="input-group">
			  <div class="input-group-prepend">
				<span class="input-group-text">웹훅 내용</span>
			  </div>
			  <textarea id="Textbox4" runat="server" class="form-control" aria-label="웹훅 내용"></textarea>
			</div>

			<br />

			<button type="button" runat="server" id="btnSearch" style="background-color: #E9ECEF; border: solid #D1D6DC; border-width: thin;" class="btn float-right">검색</button>
		</form>
	</main>
</body>
</html>