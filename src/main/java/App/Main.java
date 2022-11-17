package App;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

import Dao.VencimentoDao;
import Models.Desconto;
import Models.Estoque;
import Models.NotaFiscal;
import Models.Produto;
import Models.Promocao;
import Models.Relatorio;
import Models.Vencimento;

public class Main{

	public static void main(String[] args) {
		Controller c = new Controller();
		c.Menu();
	}

}
