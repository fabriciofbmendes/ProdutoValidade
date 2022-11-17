<%@page import="Models.Promocao"%>
<%@page import="Dao.PromocaoDao"%>
<%@page import="Models.Estoque"%>
<%@page import="Dao.EstoqueDao"%>
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

	<%
	PromocaoDao pd = new PromocaoDao();
	double valor = 0;
	List<Promocao> promo = pd.findAll(Promocao.class);
	%>
	<div class="container">
		<a class="btn btn-primary" href="formcurso.jsp">Novo Curso</a>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Nome</th>
					<th>Preço</th>
					<th>Data de Validade</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Promocao p : promo) {
					valor = p.getEstoque().getProduto().getValor() * (1 - p.getProcentagem());	
				%>
				<tr>
					<td><%=p.getEstoque().getProduto().getNome()%></td>
					<td><%=valor%>	</td>
					<td><%=p.getEstoque().getDataValidade()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

</body>
</html>