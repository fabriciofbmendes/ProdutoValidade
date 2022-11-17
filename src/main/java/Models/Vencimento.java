package Models;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@DiscriminatorValue("Vencimento")
public class Vencimento extends Relatorio {

	@Column(precision = 6, scale = 2)
	private double valorPrejuizo;

	public double getValorPrejuizo() {
		return valorPrejuizo;
	}

	public void setValorPrejuizo(double valorPrejuizo) {
		this.valorPrejuizo = valorPrejuizo;
	}
}
