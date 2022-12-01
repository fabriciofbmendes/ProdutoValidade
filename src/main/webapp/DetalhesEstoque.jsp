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
		<link rel="stylesheet" href="styles.css">
		<title>Estoque</title>
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
		PromocaoDao pd = new PromocaoDao();
		Promocao p = pd.findById(Promocao.class, Long.parseLong(request.getParameter("id"))).get();
		%>
			<div class="corpo-detalhe-content">
				<div class="corpo-detalhe-content">
							<input class="form-control input cima" type="text" value="Produto" readonly>
                            <input class="form-control input baixo" type="text" value="<%=p.getEstoque().getProduto().getNome()%>" readonly>
                            <br>
							<input class="form-control input cima" type="text" value="Marca" readonly>
                            <input class="form-control input baixo" type="text" value="<%=p.getEstoque().getProduto().getMarca()%>" readonly>
                            <br> 
							<input class="form-control input cima" type="text" value="Descrição" readonly>
                            <input class="form-control input baixo" type="text" value="<%=p.getEstoque().getProduto().getDescricao()%>" readonly>
                            <br>
                            <input class="form-control input cima" type="text" value="Valor Original" readonly>
                            <input class="form-control input baixo" type="text" value="<%=p.getEstoque().getProduto().getValor()%>" readonly>
                            <br>
                            <input class="form-control input cima" type="text" value="Data de Validade" readonly>
                            <input class="form-control input baixo" type="text" value="<%=p.getEstoque().getDataValidade().toString()%>" readonly>			    	    
                            <br>
				</div>
			</div>
		 <div class="detalhe">
             <a class="btn" href="ListaProdutos.jsp">Voltar</a>
         </div>
	</body>
</html>