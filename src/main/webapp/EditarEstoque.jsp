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
			<link rel="stylesheet" href="style.css">
        	<link rel="stylesheet" href="styles.css">
        	
        	<link rel="stylesheet" href="AdcionaProduto.css">
        	<link rel="stylesheet" href="Estoque.css">
		<title>Editar Estoque</title>
	<nav class="navbar navbar-expand-lg bg-light menu">
	    <div class="container-fluid">
	      <a href="home.jsp" class="navbar-brand">Inicio</a>
	      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="navbar-toggler-icon"></span>
	      </button>
	      <div class="collapse navbar-collapse" id="navbarNav">
	        <ul class="navbar-nav">
	        <li class="nav-item">
	            <a class="nav-link active" aria-current="page" href="Produtos.jsp">Lista de Produtos</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link active" aria-current="page" href="ListaProdutos.jsp">Estoque</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="RelatorioVencimento.jsp">Relatorios</a>
	          </li>
	        </ul>
	      </div>
	    </div>
	</nav>
	</head>
	<body>
	<%
	long estoqueid = Long.parseLong(request.getParameter("id"));
	EstoqueDao dao = new EstoqueDao();
	Estoque estoque = dao.findById(Estoque.class, estoqueid).get();
	ProdutoDao pd = new ProdutoDao();
	List<Produto> produtos = pd.findAll(Produto.class);
	%>
	<div class="contentadd">
		<form action="controllerEstoque" method="post">
			<input type="hidden" name="estoqueid" value="<%=estoque.getId()%>">
				<label>Selecione o Produto</label>
				<select class="itens mx-sm-auto" name="produto" defaultValue="<%=estoque.getProduto().getId()%>">
					<%for(Produto p : produtos)
					{
						if(p.getId()==estoque.getProduto().getId())
						{
						%>
						<option value="<%=p.getId()%>" selected="selected"><%=p.getNome()%></option>
						<%}
						else
						%>
						<option value="<%=p.getId()%>"><%=p.getNome()%></option>
						<%
					}	
					%>
				</select>
				<br/>
				<label>Insira a quantidade de prodotos no lote</label>
				<input class="info" type="number" required name="quantidade" value="<%=estoque.getQuantidade()%>"/>
				<br/>
				<label>Insira a data de validade do Lote</label>
				<input class="info" type="date" required name="dataValidade" value="<%=estoque.getDataValidade()%>"/>
				
				<input class="btn" type="submit" value="Salvar" />
		</form>
	</div>
	</body>
</html>