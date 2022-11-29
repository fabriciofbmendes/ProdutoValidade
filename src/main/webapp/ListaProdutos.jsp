<%@page import="Dao.VencimentoDao"%>
<%@page import="Models.Qualidade"%>
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
            <a class="nav-link active" aria-current="page" href="Estoque.jsp">Inserir Produtos no Estoque</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="ListarProdutos.jsp">Vizualizar Preços</a>
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
<body>
<%
	EstoqueDao ed = new EstoqueDao();
	List<Estoque> estoques = ed.findAll(Estoque.class);
	PromocaoDao pd = new PromocaoDao();
	double valor = 0;
	List<Promocao> promo = pd.findAll(Promocao.class);
	VencimentoDao vd = new VencimentoDao();
	estoques = ed.findAll(Estoque.class);
	for(Estoque e : estoques) {
		pd.CadastraPromocao(e,pd);
		vd.VerificaVencimento(e);
	}
	%>
<div class="corpo">
    <div class="container">
        <table class="table table-bordered table-hover table-responsive table-borderless">
            <thead class="table-dark">
                <tr>
                    <th>Nome</th>
                    <th>Preço</th>
                    <th>Data de Validade</th>
                    <th>Quantidade Disponível</th>
                    <th>Produto Ativo</th>
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
					<td><%=p.getEstoque().getQuantidade() %></td>
					<td>
					<% if(p.getEstoque().getQualidade() == Qualidade.DentroDaValidade)
					{
						%>
							<p>Dentro da Validade </p>
					<%
					} else {
					%>
					<p><%=p.getEstoque().getQualidade()%></p>
					<%} %>
					<td><a class="btn btn-secondary btn-sm"
						href="EditarEstoque.jsp?id=<%=p.getEstoque().getId()%>">Editar</a>
						
						<a class="btn btn-danger btn-sm"
						href="<%= request.getContextPath()%>/controllerEstoque?id=<%=p.getEstoque().getId()%>">
						Excluir</a>
					<td>
					</td>
					<%} %>
					</td>
					
				</tr>
			</tbody>
		</table>
            <div="envia">
                <a class="btn" href="Estoque.jsp">Adicionar Produto</a>
            </div>
    </div>   
</div> 
</body>
</html>