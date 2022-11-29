package Models;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "tipo_relatorio", discriminatorType = DiscriminatorType.STRING)
public abstract class Relatorio implements Comparable<Relatorio>{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@ManyToMany
	private List<Estoque> estoques;
	
	@Column(name="Quantidade_Produtos")
	private int quantidade;
	
	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	@Column(name = "Data_Emissao", columnDefinition = "DATE")
	private LocalDate data;
	
	
	public List<Estoque> getEstoque() {
		return estoques;
	}

	public void setEstoque(List<Estoque> estoque) {
		this.estoques = estoque;
	}

	public LocalDate getData() {
		return data;
	}

	public void setData(LocalDate data) {
		this.data = data;
	}
}
