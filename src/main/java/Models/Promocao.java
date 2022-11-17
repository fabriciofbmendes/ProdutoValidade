package Models;
import java.sql.Date;
import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
@Entity
public class Promocao {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@ManyToOne
	private Estoque estoque;
	
	@Column(name = "Data_Inicio_Promocao", columnDefinition = "DATE")
	private LocalDate dataInicio;
	@Column(name = "Data_Termino_Promocao", columnDefinition = "DATE")
	private LocalDate dataTermino;
	
	@Column(precision = 2, scale = 2)
	private double porcentagem;
	
	public Estoque getEstoque() {
		return estoque;
	}
	public void setEstoque(Estoque estoque) {
		this.estoque = estoque;
	}
	public LocalDate getDataInicio() {
		return dataInicio;
	}
	public void setDataInicio(LocalDate dataInicio) {
		this.dataInicio = dataInicio;
	}
	public LocalDate getDataTermino() {
		return dataTermino;
	}
	public void setDataTermino(LocalDate dataTermino) {
		this.dataTermino = dataTermino;
	}
	public double getProcentagem() {
		return porcentagem;
	}
	public void setProcentagem(double porcentagem) {
		this.porcentagem = porcentagem;
	}

}
