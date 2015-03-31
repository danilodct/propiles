package estudo;

import java.util.Calendar;
import java.util.Date;

public class Estudo {
	public static void main(String[] args) {
		Calendar cal1 = Calendar.getInstance();
		cal1.set(Calendar.DAY_OF_MONTH, 1);
		Calendar cal2 = Calendar.getInstance();
		Date data1 = cal1.getTime();
		Date data2 = cal2.getTime();
		System.out.println(data1.compareTo(data2));
		System.out.println(data2.compareTo(data1));
	}
}