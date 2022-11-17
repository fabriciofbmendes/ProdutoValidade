package Dao;

import org.joda.time.*;
import Models.Estoque;
import Models.Vencimento;

public class VencimentoDao extends Dao<Vencimento>{
	public Estoque VerificaVencimento(Estoque estoque,EstoqueDao ed)
	{
		DateTime dataAtual = DateTime.now();
		DateTime dataValidade = DateTime.parse(estoque.getDataValidade().toString());
		int dias = Days.daysBetween(dataAtual,dataValidade).getDays();
		if( dias < 0)
		{
			estoque.setAtivo(false);
		}
		return estoque;
	}
	
}
