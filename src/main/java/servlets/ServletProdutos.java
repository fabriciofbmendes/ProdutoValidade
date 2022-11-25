package servlets;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ProdutoDao;
import Models.Produto;
@WebServlet({ "/ServletProduto", "/controllerProduto" })
public class ServletProdutos extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public ServletProdutos() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("ListaProdutos.jsp");
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProdutoDao pd = new ProdutoDao();
		Produto p = new Produto();
		p.setNome(request.getParameter("nome"));
		p.setValor(Double.parseDouble(request.getParameter("valor")));
		p.setDescricao(request.getParameter(request.getParameter("descricao")));
		pd.save(p);
		response.sendRedirect("ListaProdutos.jsp");
}
	}
