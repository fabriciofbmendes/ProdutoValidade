package Models;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.joda.time.DateTime;
import org.joda.time.Days;

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
