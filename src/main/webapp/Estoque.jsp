<%@page import="Models.Produto"%>
<%@page import="Dao.ProdutoDao"%>
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
		EstoqueDao ed = new EstoqueDao();
		Estoque estoque = new Estoque();
		ProdutoDao pd = new ProdutoDao();
		List<Produto> produtos = pd.findAll(Produto.class);
		%>
		<form action="controllerEstoque" method="post">
			<input type="hidden" name="estoqueid">
				<label>Selecione o Produto</label>
				<select name="produto">
					<%for(Produto p : produtos)
					{
						%>
						<option value="<%=p.getId()%>"><%=p.getNome()%></option>
						<%
					}	
					%>
				</select>
				<br/>
				<label>Insira a quantidade de prodotos no lote</label>
				<input type="text" name="quantidade"/>
				<br/>
				<label>Insira a data de validade do Lote</label>
				<input type="date" name="dataValidade"/>
				
				<input type="submit" value="Salvar" />
		</form>
	</body>
</html>