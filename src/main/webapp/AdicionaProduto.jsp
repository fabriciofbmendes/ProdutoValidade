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
		<title>Adicionar Produto</title>
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
	<<body>
        <div class="contentadd">
            <form action="controllerProduto" method="post">
                <input type="hidden" name="produtoid">
                    <label>Produto</label>
                    <input class="info" type="text" required name="nome"/>
                    <br/>
                    <label>Insira a marca do produto</label>
                    <input class="info" type="text" required name="marca"/>
                    <br/>	
                    <label>Valor do Produto</label>
                    <input class="info" type="number" required name="valor"/>
                    <br/>
                    <label>Insira a descrição do produto</label>
                    <input class="info" type="text" required name="descricao"/>
                    <br/>				
                    <input class="btn" type="submit" value="Adicionar" />
            </form>
        </div>
	</body>
</html>