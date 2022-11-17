package Dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import Models.Estoque;
import Models.Produto;

public class EstoqueDao extends Dao<Estoque>{
	Scanner input = new Scanner(System.in);
	
	private List<Produto> produto;
	private Produto pro;
	private Estoque estoque;
	private List<Estoque> estoques;
	private long entrada =0;
	public Estoque InserirProduto(ProdutoDao pd,NotaFiscalDao nfd)
	{
		produto = pd.findAll(Produto.class);
		estoque = new Estoque();
		ListarProdutos();
		
		estoque.setNota(nfd.GerarNotaFiscal(nfd));
		
		System.out.println("Entre com a Quantidade de produtos do lote");
		estoque.setQuantidade(input.nextInt());
		estoque.setAtivo(true);
		estoque.setDataValidade(InserirValidade());
		
		return estoque;
	}
	
	private LocalDate InserirValidade()
	{
		System.out.println("Entre com a Data de Validade dos Produtos");
		System.out.println("Ano de Validade");
		int ano = input.nextInt();
		System.out.println("Mes de Validade");
		int mes = input.nextInt();
		System.out.println("Dia de Validade");
		int dia = input.nextInt();
		LocalDate data = LocalDate.of(ano, mes, dia);
		return data;
	}
	
	private void ListarProdutos()
	{
		System.out.println("Selecione um Produto da Lista");
		for(Produto p : produto)
		{
			System.out.println(p.getId() + ":" + p.getNome());
		}
		entrada = input.nextLong();
		for(Produto p : produto)
		{
			if(p.getId()==entrada)
			{
				estoque.setProduto(p);
			}
		}
	}
	public Estoque AtualizarValidade(EstoqueDao ed,ProdutoDao pd)
	{
		estoques = ed.findAll(Estoque.class);
		System.out.println("Selecione um Produto da Lista");
		for(Estoque e : estoques)
		{
			System.out.println(e.getId() + ": " + e.getProduto().getNome() + " - Validade: " + e.getDataValidade().toString());
		}
		entrada = input.nextLong();
			
				for(Estoque e: estoques)
				{
					if(e.getId()==entrada)
					{
						LocalDate novaData = InserirValidade();
						e.setDataValidade(novaData);
						return e;
					}
				}	
		return null;
		}
	}
