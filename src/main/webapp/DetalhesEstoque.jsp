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
		<link rel="stylesheet" href="Estoque.css">
		<link rel="stylesheet" href="style.css">
		<link rel="stylesheet" href="styles.css	">
		<title>Estoque</title>
		<nav class="navbar navbar-expand-lg bg-light menu">
	    <div class="container-fluid">
	      <a href="#" class="navbar-brand">Inicio</a>
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
		PromocaoDao pd = new PromocaoDao();
		Promocao p = pd.findById(Promocao.class, Long.parseLong(request.getParameter("id"))).get();
		%>
		<div class="corpo-estoque">
			<div class="corpo-content">
						<label>Produto</label>
						<label><%=p.getEstoque().getProduto().getNome()%></label>
						<br/>
						<label>Marca</label>
						<label><%=p.getEstoque().getProduto().getMarca()%></label>
						<br/>
						<label>Descrição</label>
						<label><%=p.getEstoque().getProduto().getDescricao()%></label>
						<br/>
						<label>Valor Original</label>
						<label><%=p.getEstoque().getProduto().getValor()%></label>
						<br/>
						<label>Data de Validade</label>
						<label><%=p.getEstoque().getDataValidade().toString()%></label>
						<br/>
			</div>
		</div>
		 <div>
             <a class="btn" href="ListaProdutos.jsp">Voltar</a>
         </div>
	</body>
</html>