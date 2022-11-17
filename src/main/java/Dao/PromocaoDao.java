package Dao;

import java.time.LocalDate;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Scanner;

import javax.persistence.EntityManager;

import org.joda.time.*;

import Models.Estoque;
import Models.Promocao;

public class PromocaoDao extends Dao<Promocao>{
private DateTime dataAtual;
private DateTime dataValidade;
private EntityManager em = Util.JpaUtil.getEntityManagerFactory().createEntityManager();

public Promocao CadastraPromocao(Estoque estoque,PromocaoDao promod) {
		Promocao porcentagem;		
		porcentagem=new Promocao();
		double desconto=0;
		dataAtual = DateTime.now();
		dataValidade = DateTime.parse(estoque.getDataValidade().toString());
		int dias = Days.daysBetween(dataAtual, dataValidade).getDays();
		desconto = VerificaData(dias);
		if(VerificaPromo(estoque.getId()))
		{
			porcentagem.setProcentagem(desconto);	
			porcentagem.setDataInicio(LocalDate.now());
			porcentagem.setDataTermino(LocalDate.now().plusDays(120));
			porcentagem.setEstoque(estoque);
			promod.save(porcentagem);
		}
		else
		{
			Promocao promos = getListaPorId(estoque.getId()).get(0);
			porcentagem = promos;
			if(porcentagem.getProcentagem()!=desconto) porcentagem.setProcentagem(desconto);	
			promod.update(porcentagem);
		}
		return porcentagem;
		
	}
private double VerificaData(int dias)
{
	double promocao=0;
	if(dias<7) promocao = 0.75;
	else if(dias<14) promocao = 0.5;
	else if(dias<21) promocao = 0.25;
	return promocao;
}

public boolean VerificaPromo(long id) {
	if(getListaPorId(id).isEmpty())
	{
		return true;
	}
	return false;
}

public List<Promocao> getListaPorId(long id)
{
	String sql = "select * from promocao where estoque_id="+id; 
	List<Promocao> promocoes = em.createNativeQuery(sql, Promocao.class).getResultList();
	return promocoes;
}
}
