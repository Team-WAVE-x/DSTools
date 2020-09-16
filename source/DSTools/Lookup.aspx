<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Lookup.aspx.vb" Inherits="DSTools.Lookup" %>

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
				<a class="nav-link" href="/Home">Home</a> <a class="nav-link" href="/Webhook">Webhook</a> <a class="nav-link active" href="/Lookup">User Lookup<span class="sr-only">(current)</span></a>
			</div>
		</div>
	</nav>
	<main class="container" role="main">
		<form id="form1" runat="server">
			<h1>User Lookup</h1>
			<br />
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">유저 아이디</span>
			  </div>
              <asp:TextBox ID="TextBox1" runat="server" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default"></asp:TextBox>
			</div>

			<button type="button" runat="server" id="btnSearch" style="background-color: #E9ECEF; border: solid #D1D6DC; border-width: thin;" class="btn float-right">검색</button>

			<br />
			<br />
			<br />

			<div class="card" runat="server" id="card1" visible="false">
			  <h5 class="card-header">유저 정보</h5>
			  <div class="card-body">
				  <img runat="server" id="image1" src="https://cdn.discordapp.com/embed/avatars/0.png" style="width: 100px; height: 100px" class="rounded">
				  <br />
				  <br />
				  <p class="card-text" runat="server" id="lblDescription">With supporting text below as a natural lead-in to additional content.</p>
			  </div>
			</div>
		</form>
	</main>
</body>
</html>