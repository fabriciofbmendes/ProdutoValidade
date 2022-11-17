package Dao;

import java.util.Scanner;

import Models.Produto;
import Models.Qualidade;

public class ProdutoDao extends Dao<Produto>{
	Scanner input = new Scanner(System.in);
	private Produto produto;
	
	public Produto CadastrarProduto()
	{
		produto = new Produto();
		System.out.println("Digite o Nome do Produto");
		produto.setNome(input.next());
		System.out.println("Digite a Descricao do Produto");
		produto.setDescricao(input.next());
		System.out.println("Digite o Valor do Produto");
		produto.setValor(input.nextDouble());
		produto.setQualidade(Qualidade.DentroDaValidade);
		return produto;
	}
}
