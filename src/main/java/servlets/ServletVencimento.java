package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import org.joda.time.*;
import Models.Estoque;
import Models.Qualidade;
import Dao.VencimentoDao;
import Models.Vencimento;
import java.util.List;

@WebServlet({"/ServletVencimento","/controllerRelatorio"})
public class ServletVencimento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletVencimento() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			long id = Long.parseLong(request.getParameter("id"));
			request.setAttribute("id", id);
			response.sendRedirect("DetalhesRelatorio.jsp");
		}
		catch(Exception e)
		{
			response.sendRedirect("RelatorioVencimento.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			DateTime dataAtual = DateTime.now();
			int mesRelatorio = dataAtual.getMonthOfYear() - 1;
			int anoRelatorio = dataAtual.getYear();
			VencimentoDao vd = new VencimentoDao();
			List<Estoque> estoques = vd.GetEstoquesRelatorio(mesRelatorio, anoRelatorio);
			Vencimento relatorio = new Vencimento();;
			double valor=0;
			int quantidade=0;
			for(Estoque e : estoques)
			{
				e = vd.VerificaVencimento(e);
				if(e.getQualidade()==Qualidade.Vencido);
				{
					valor += (e.getProduto().getValor() * e.getQuantidade());
					quantidade += e.getQuantidade();
				}
			}
			relatorio.setValorPrejuizo(valor);
			relatorio.setData(LocalDate.of(anoRelatorio,mesRelatorio,1));
			relatorio.setQuantidade(quantidade);
			relatorio.setEstoque(estoques);
			vd.save(relatorio);
			response.sendRedirect("RelatorioVencimento.jsp");
		}
		catch(Exception e)
		{
			response.sendRedirect("RelatorioVencimento.jsp");
		}
	}

}
