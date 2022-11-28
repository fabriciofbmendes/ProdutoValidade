<%@page import="Models.Estoque"%>
<%@page import="Dao.EstoqueDao"%>
<%@page import="Models.Produto"%>
<%@page import="Dao.ProdutoDao"%>
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
	long estoqueid = Long.parseLong(request.getParameter("id"));
	EstoqueDao dao = new EstoqueDao();
	Estoque estoque = dao.findById(Estoque.class, estoqueid).get();
	ProdutoDao pd = new ProdutoDao();
	List<Produto> produtos = pd.findAll(Produto.class);
	%>
		<form action="controllerEstoque" method="post">
			<input type="hidden" name="estoqueid" value="<%=estoque.getId()%>">
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
				<input type="text" name="quantidade" value="<%=estoque.getQuantidade()%>"/>
				<br/>
				<label>Insira a data de validade do Lote</label>
				<input type="date" name="dataValidade" value="<%=estoque.getDataValidade()%>"/>
				
				<input type="submit" value="Salvar" />
		</form>
	</body>
</html>