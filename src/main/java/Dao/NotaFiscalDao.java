package Dao;

import java.time.LocalDate;
import java.util.Date;
import java.util.Random;

import javax.print.attribute.standard.DateTimeAtCompleted;

import Models.NotaFiscal;

public class NotaFiscalDao extends Dao<NotaFiscal>{
	private NotaFiscal nf;
	public NotaFiscal GerarNotaFiscal(NotaFiscalDao nfd)
	{
		nf = new NotaFiscal();
		nf.setData(LocalDate.now());
		Random r = new Random();
		Integer nome = r.nextInt(999999);
		nf.setNome(nome.toString());
		nfd.save(nf);
		return nf;
	}
}
