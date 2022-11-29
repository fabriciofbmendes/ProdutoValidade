package Dao;

import org.joda.time.*;
import Models.Estoque;
import Models.Promocao;
import Models.Qualidade;
import Models.Vencimento;
import java.util.List;

import javax.persistence.EntityManager;

public class VencimentoDao extends Dao<Vencimento>{
	private EntityManager em = Util.JpaUtil.getEntityManagerFactory().createEntityManager();
	public Estoque VerificaVencimento(Estoque estoque)
	{
		EstoqueDao ed = new EstoqueDao();
		DateTime dataAtual = DateTime.now();
		DateTime dataValidade = DateTime.parse(estoque.getDataValidade().toString());
		int dias = Days.daysBetween(dataAtual,dataValidade).getDays();
		if( dias < 0)
		{
			estoque.setQualidade(Qualidade.Vencido);
		}
		return estoque;
	}
	
	public List<Estoque> GetEstoquesRelatorio(int mes,int ano)
	{
		String sql = "select * from estoque where Data_Validade BETWEEN '" + ano + "-" + mes + "-01' AND '" + ano + "-" + mes + "-31'";
		List<Estoque> estoques = em.createNativeQuery(sql, Estoque.class).getResultList();
		return estoques;
	}
	
	public List<Estoque> GetDetalhesRelatorio(long id)
	{
		String sql = "select e.* from estoque e join relatorio_estoque re on e.id=re.estoques_id where re.Relatorio_id="+id;
		List<Estoque> estoques = em.createNativeQuery(sql,Estoque.class).getResultList();
		return estoques;
	}
}
