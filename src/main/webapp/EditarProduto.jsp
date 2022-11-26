<%@page import="Models.Produto"%>
<%@page import="Dao.ProdutoDao"%>
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
	long produtoid = Long.parseLong(request.getParameter("id"));
	ProdutoDao dao = new ProdutoDao();
	Produto produto = dao.findById(Produto.class, produtoid).get();
	%>
		<form action="controllerProduto" method="post">
			<input type="hidden" name="produtoid" value="<%=produtoid %>">
				<label>Nome do Produto</label>
				<input type="text" name="nome" value="<%=produto.getNome() %>"/>
				<br/>
				<label>Valor do Produto</label>
				<input type="text" name="valor" value="<%=produto.getValor() %>"/>
				<br/>
				<label>Insira a descrição do produto</label>
				<input type="text" name="descricao" value="<%=produto.getDescricao()%>"/>				
				<input type="submit" value="Salvar" />
		</form>
	</body>
</html>