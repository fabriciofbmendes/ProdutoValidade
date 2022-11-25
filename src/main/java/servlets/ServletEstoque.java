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
		
//		EstoqueDao dao = new EstoqueDao();
//		
//		long cursoid = Long.parseLong(request.getParameter("id"));
//		Curso delCurso = dao.findById(Curso.class, cursoid).get();
//		
//		dao.delete(delCurso);
		response.sendRedirect("Estoque.jsp");
		
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NotaFiscalDao nfd = new NotaFiscalDao();
		EstoqueDao dao = new EstoqueDao();
		ProdutoDao pd = new ProdutoDao();
			Estoque novoEstoque = new Estoque();
			novoEstoque.setProduto(pd.findById(Produto.class, Long.parseLong(request.getParameter("produto"))).get());
			novoEstoque.setDataValidade(LocalDate.parse(request.getParameter("dataValidade")));
			novoEstoque.setQualidade(Qualidade.DentroDaValidade);
			novoEstoque.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
			novoEstoque.setNota(nfd.GerarNotaFiscal(nfd));
			dao.save(novoEstoque);
		response.sendRedirect("ListaProdutos.jsp");
}
	}
