<%@page import="java.util.Calendar"%>
<%@page import="Dao.VencimentoDao"%>
<%@page import="Models.Vencimento"%>
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
<title>Validador de Produtos</title>
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
<%
	VencimentoDao vd = new VencimentoDao();
	List<Vencimento> vencimentos = vd.findAll(Vencimento.class);
%>

<form action="controllerRelatorio" method="post"> 
<input type="submit" value="Novo Relatório" />
</form>
<table class="table table-bordered table-hover table-responsive table-borderless">
			<thead class="table-dark">
                <tr>
                    <th>Data</th>
                    <th>Prejuizo</th>
                    <th>Quantidade</th>
                    <th>Detalhes</th>>
                </tr>
            </thead>
	<tbody>
	
		<% 
		for(Vencimento v : vencimentos)
		{
			%>
			<tr>
				<td><%=v.getData().getMonth().toString()%></td>
				<td><%=v.getValorPrejuizo()%></td>
				<td><%=v.getQuantidade()%></td>
				<td><a class="btn btn-secondary btn-sm" href="DetalhesRelatorio.jsp?id=<%=v.getId()%>">Detalhes</a>			<%
		}
		%>
	</tr>
	</tbody>
</table>
</body>
</html>