package Models;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.joda.time.*;

@Entity
@DiscriminatorValue("Desconto")
public class Desconto extends Relatorio{
	@Column(precision = 6, scale = 2)
	private double valorDesconto;

	public double getValorDesconto() {
		return valorDesconto;
	}

	public void setValorDesconto(double valorDesconto) {
		this.valorDesconto = valorDesconto;
	}
	
	@Override public int compareTo(Relatorio outroRelatorio) { 
		DateTime esteRelatorio = DateTime.parse(this.getData().toString());
		DateTime dataOutroRelatorio = DateTime.parse(outroRelatorio.getData().toString());
		if(Days.daysBetween(esteRelatorio, dataOutroRelatorio).getDays() > 0)
		{
			return -1;
		}if (Days.daysBetween(esteRelatorio, dataOutroRelatorio).getDays() < 0) { 
			  return 1; 
		 } 
		  return 0;
	}
}
