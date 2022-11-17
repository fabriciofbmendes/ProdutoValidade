//package servlets;
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import Dao.EstoqueDao;
//
//public class ServletProdutos {
//	private static final long serialVersionUID = 1L;
//
//	public ServletProdutos() {
//		super();
//	}
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		
//		EstoqueDao dao = new EstoqueDao();
//		
//		long cursoid = Long.parseLong(request.getParameter("id"));
//		Curso delCurso = dao.findById(Curso.class, cursoid).get();
//		
//		dao.delete(delCurso);
//		response.sendRedirect("concurso.jsp");
//		
//		}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
//	 *      response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		CursoDao dao = new CursoDao();
//		
//		if (request.getParameter("cursoid") == null) {
//
//			Curso novoCurso = new Curso();
//			novoCurso.setNome(request.getParameter("nome"));
//			novoCurso.setPreco(Double.parseDouble(request.getParameter("preco")));
//			novoCurso.setModalidade(Modalidade.valueOf(request.getParameter("modalidade").toUpperCase()));
//			
//			dao.save(novoCurso);
//
//		}else {
//			long cursoid = Long.parseLong(request.getParameter("cursoid"));
//			Curso curso = dao.findById(Curso.class, cursoid).get();
//			
//			curso.setNome(request.getParameter("nome"));
//			curso.setPreco(Double.parseDouble(request.getParameter("preco")));
//			curso.setModalidade(Modalidade.valueOf(request.getParameter("modalidade").toUpperCase()));
//			
//			dao.update(curso);
//			
//		}
//
//		response.sendRedirect("concurso.jsp");
//}
