package Dao;

import org.joda.time.*;
import Models.Estoque;
import Models.Promocao;
import Models.Qualidade;
import Models.Vencimento;

import java.math.BigInteger;
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
			ed.update(estoque);
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
	
	public void DeleteEstoqueRelatorio(Estoque e)
	{
		if(AtualizaRelatorio(e)==true){
			String sql = "delete from relatorio_estoque where estoques_id=" + e.getId();
			em.getTransaction().begin();
			em.createNativeQuery(sql).executeUpdate();
			em.getTransaction().commit();
		}
	}
	
	public Boolean AtualizaRelatorio(Estoque e)
	{
		String sql = "select Relatorio_id from relatorio_estoque where estoques_id=" + e.getId();
		List<BigInteger> idRelatorio = em.createNativeQuery(sql).getResultList();
		if(idRelatorio.isEmpty())
		{
			return false;
		}
		else {
			String idRelatorioValor = idRelatorio.get(0).toString();
			long id = Long.parseLong(idRelatorioValor);
			Vencimento v = findById(Vencimento.class,id).get();
			List<Estoque> estoques = v.getEstoque();
			v.setQuantidade((v.getQuantidade()-e.getQuantidade()));
			v.setValorPrejuizo((v.getValorPrejuizo()-(e.getProduto().getValor()*e.getQuantidade())));
			estoques.remove(e);
			update(v);
			return true;
		}
		
	}
}
