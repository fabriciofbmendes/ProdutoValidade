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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<a class="btn btn-primary" href="AdicionaProduto.jsp">Novo Produto</a>
		<a class="btn btn-primary" href="Estoque.jsp">Novo Lote</a>
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
			<tbody>
				<%
				DescontoDao dd = new DescontoDao();
				VencimentoDao vd = new VencimentoDao();
				List<Desconto> descontos = dd.findAll(Desconto.class);
				List<Vencimento> vencimentos = vd.findAll(Vencimento.class);
				%>
				<tr>
				
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>