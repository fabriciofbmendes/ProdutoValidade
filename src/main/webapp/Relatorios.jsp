<%@page import="java.util.Collections"%>
<%@page import="Dao.VencimentoDao"%>
<%@page import="Dao.DescontoDao"%>
<%@page import="Models.Vencimento"%>
<%@page import="Models.Desconto"%>
<%@page import="Models.Relatorio"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="Relatorio.css">
<title>Relatorio</title>
<nav class="navbar navbar-expand-lg bg-light menu">
    <div class="container-fluid">
      <a class="navbar-brand">Produtos</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Inserir Produtos no Estoque</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Vizualizar Preços</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Atualizar Data de Validade do Produto</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Verifica Vencimento</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</head>
<body>
	<div class="container">
        <div class="botao">
		    <a class="btn btn-primary" href="AdicionaProduto.jsp">Novo Produto</a>
		    <a class="btn btn-primary" href="Estoque.jsp">Novo Lote</a>
        </div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Nome</th>
					<th>Preço</th>
					<th>Data de Validade</th>
					<th>Quantidade Disponível</th>
					<th>Qualidade do Produto</th>
					<th></th>
				</tr>
			</thead>
			<tbody class="result">
				<%
				DescontoDao dd = new DescontoDao();
				VencimentoDao vd = new VencimentoDao();
				List<Desconto> descontos = dd.findAll(Desconto.class);
				List<Vencimento> vencimentos = vd.findAll(Vencimento.class);
				%>
			<tbody>
				<tr>
				
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>