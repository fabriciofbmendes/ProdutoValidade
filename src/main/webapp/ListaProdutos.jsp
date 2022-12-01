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
<title>Lista de Produtos</title>
<div class="divnav">
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
</div>
</head>
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
    	<div class="table-wrapper-scroll-y my-custom-scrollbar">
         <table class="table table-bordered table-hover table-responsive table-borderless table-wrapper-scroll-y mb-0">
            <thead class="table-dark">
                <tr>
                    <th>Produto</th>
                    <th>Marca</th>
                    <th>Preço</th>
                    <th>Data de Validade</th>
                    <th>Quantidade Disponível</th>
                    <th>Produto Ativo</th>
                    <th></th>
                    <th></th>
                    <th></th>
                    
                </tr>
            </thead>
            <tbody>
				<%
				for (Promocao p : promo) {
					valor = p.getEstoque().getProduto().getValor() * (1 - p.getProcentagem());	
					valor = valor * 100;
					valor = Math.round(valor);
					valor = valor/100;
				%>
				<tr>
					<td><%=p.getEstoque().getProduto().getNome()%></td>
					<td><%=p.getEstoque().getProduto().getMarca()%></td>
					<td><%=valor%></td>
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
					<td class="detalhesbtn"><a class="btn btn-secondary btn-sm" href="DetalhesEstoque.jsp?id=<%=p.getId()%>">Detalhes</a>  </td>
					<%if(p.getEstoque().getQualidade() != Qualidade.Vencido) {
					%>
					<td class="detalhesbtn"><a class="btn btn-secondary btn-sm" href="EditarEstoque.jsp?id=<%=p.getEstoque().getId()%>">Editar</a></td>
					<%} %>
					<td class="detalhesbtn"><a class="btn btn-danger btn-sm" href="<%= request.getContextPath()%>/controllerEstoque?id=<%=p.getEstoque().getId()%>">Excluir</a></td>
					<%} %>
					</td>
					
				</tr>
			</tbody>
		</table>
            <div="envia">
                <a class="btn envia" href="Estoque.jsp">Adicionar Produto ao Estoque</a>
            </div>
       </div>
    </div>   
</div> 
</body>
<script>
function arredondar(n) {
    return (Math.round(n * 100) / 100).toFixed(2);
}
</script>
</html>