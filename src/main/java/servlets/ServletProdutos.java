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
		try {
			ProdutoDao dao = new ProdutoDao();
			long produtoid = Long.parseLong(request.getParameter("id"));
			Produto produto = dao.findById(Produto.class, produtoid).get();
			dao.delete(produto);
			response.sendRedirect("Produtos.jsp");
		}
		catch(Exception e)
		{
			response.sendRedirect("Produtos.jsp");
		}
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProdutoDao pd = new ProdutoDao();
		if (request.getParameter("produtoid").equals("")) {
			try {
				Produto p = new Produto();
				p.setNome(request.getParameter("nome"));
				p.setValor(Double.parseDouble(request.getParameter("valor")));
				p.setDescricao(request.getParameter("descricao"));
				p.setMarca(request.getParameter("marca"));
				pd.save(p);
				response.sendRedirect("Produtos.jsp");
			}
			catch(Exception e)
			{
				response.sendRedirect("AdicionaProduto.jsp");
			}
		}
		else {
			try {
				long produtoid = Long.parseLong(request.getParameter("produtoid"));
				Produto p = pd.findById(Produto.class, produtoid).get();
				p.setNome(request.getParameter("nome"));
				p.setValor(Double.parseDouble(request.getParameter("valor")));
				p.setDescricao(request.getParameter("descricao"));
				p.setMarca(request.getParameter("marca"));
				pd.update(p);
				response.sendRedirect("Produtos.jsp");
			}
			catch(Exception e) {
				response.sendRedirect("EditarProduto");
			}
		}
}
	}
