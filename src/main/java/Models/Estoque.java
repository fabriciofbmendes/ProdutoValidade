package Models;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.*;

import org.hibernate.annotations.ManyToAny;
@Entity
public class Estoque {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	public long getId() {
		return id;
	}
	@ManyToOne(cascade = CascadeType.REMOVE)
	private Produto produto;
	
	@Enumerated(EnumType.STRING)
	private Qualidade qualidade;

	public Qualidade getQualidade() {
		return qualidade;
	}
	public void setQualidade(Qualidade qualidade) {
		this.qualidade = qualidade;
	}
	private int quantidade;
	
	@Column(name = "Data_Validade", columnDefinition = "DATE")
	private LocalDate dataValidade;
	
	@ManyToOne(cascade = CascadeType.REMOVE)
	private NotaFiscal nota;
	
	public Produto getProduto() {
		return produto;
	}
	public void setProduto(Produto produto) {
		this.produto = produto;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public LocalDate getDataValidade() {
		return dataValidade;
	}
	public void setDataValidade(LocalDate dataValidade) {
		this.dataValidade = dataValidade;
	}
	public NotaFiscal getNota() {
		return nota;
	}
	public void setNota(NotaFiscal nota) {
		this.nota = nota;
	}

}
