package App;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import Dao.*;
import Models.*;

public class Controller {
	
	Scanner input = new Scanner(System.in);
	private int entrada;
	
	private Produto produto;
	private List<Produto> produtos;
	private List<Estoque> estoques;
	private List<Promocao> promos;
	private Estoque estoque;
	private PromocaoDao promocao;
	private Promocao promo;
	
	public VencimentoDao vd= new VencimentoDao();
	public DescontoDao dd = new DescontoDao();
	public EstoqueDao ed = new EstoqueDao();
	public NotaFiscalDao nfd = new NotaFiscalDao();
	public ProdutoDao pd = new ProdutoDao();
	public PromocaoDao promod = new PromocaoDao();
	
	public void Menu()
	{
		while(entrada!=7)
		{
			System.out.println("####################Valida Produtos####################");
			System.out.println("Digita sua opção:");
			System.out.println("1.Cadastrar Produto");
			System.out.println("2.Inserir Produto no Estoque");
			System.out.println("3.Atualizar Promocoes");
			System.out.println("4.Vizualizar Preços");
			System.out.println("5.Atualizar Data de Validade do Produto");
			System.out.println("6.Verifica Vencimento");
			System.out.println("7.Sair");
			entrada = input.nextInt();
			switch(entrada)
			{
				case 1:
					produto = pd.CadastrarProduto();
					pd.save(produto);
					break;
				case 2:
					estoque = ed.InserirProduto(pd,nfd);
					ed.save(estoque);
					break;
				case 3:
					estoques = ed.findAll(Estoque.class);
					for(Estoque e : estoques) {
						promod.CadastraPromocao(e,promod);
					}
					break;
				case 4:
					promos = promod.findAll(Promocao.class);
					for(Promocao p : promos)
					{
						double valor = p.getEstoque().getProduto().getValor() * (1 - p.getProcentagem());		
						System.out.println(p.getEstoque().getProduto().getNome() + " R$" + valor + " Validade:" + p.getEstoque().getDataValidade().toString());
					}
					break;
				case 5:
					estoque = ed.AtualizarValidade(ed,pd);
					ed.update(estoque);
					break;
				case 6:
					estoques = ed.findAll(Estoque.class);
					for(Estoque e : estoques) {
						estoque = vd.VerificaVencimento(e, ed);
						ed.update(estoque);
					}
					break;
			}
		}
	}
}
