package servlets;
import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.EstoqueDao;
import Dao.NotaFiscalDao;
import Dao.ProdutoDao;
import Dao.PromocaoDao;
import Models.Estoque;
import Models.Produto;
import Models.Qualidade;

@WebServlet({ "/ServletEstoque", "/controllerEstoque" })
public class ServletEstoque extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public ServletEstoque() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		EstoqueDao dao = new EstoqueDao();
	
		long estoqueid = Long.parseLong(request.getParameter("id"));
		Estoque delEstoque = dao.findById(Estoque.class, estoqueid).get();
		
		dao.delete(delEstoque);
		response.sendRedirect("ListaProdutos.jsp");
		
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EstoqueDao dao = new EstoqueDao();
		NotaFiscalDao nfd = new NotaFiscalDao();
		ProdutoDao pd = new ProdutoDao();
		if(request.getParameter("estoqueid").equals(""))
		{
			Estoque novoEstoque = new Estoque();
			novoEstoque.setProduto(pd.findById(Produto.class, Long.parseLong(request.getParameter("produto"))).get());
			novoEstoque.setDataValidade(LocalDate.parse(request.getParameter("dataValidade")));
			novoEstoque.setQualidade(Qualidade.DentroDaValidade);
			novoEstoque.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
			novoEstoque.setNota(nfd.GerarNotaFiscal(nfd));
			dao.save(novoEstoque);
		}
		else {
			long estoqueid = Long.parseLong(request.getParameter("estoqueid"));
			Estoque e = dao.findById(Estoque.class, estoqueid).get();
			e.setProduto(pd.findById(Produto.class, Long.parseLong(request.getParameter("produto"))).get());
			e.setDataValidade(LocalDate.parse(request.getParameter("dataValidade")));
			e.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
			dao.update(e);
		}
		response.sendRedirect("ListaProdutos.jsp");
}
	}
