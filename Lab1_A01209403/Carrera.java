// ITESM QRO
// Java Lab 1 
// Diana Estefanía Ortiz Ledesma
// A01209403

public class Carrera implements Runnable {
	int longitud, velocidad_min, velocidad_max, sleeping, correr;
	String name;

	public Carrera(int longitud, int velocidad_min, int velocidad_max, int sleeping) {
		super();
		this.longitud = longitud;
		this.velocidad_min = velocidad_min;
		this.velocidad_max = velocidad_max;
		this.sleeping = sleeping;
		correr = getRandom(velocidad_min, sleeping);
	}

	public static Integer getRandom(int min, int max) {
		return (int) ((Math.random() * (max + 1 - min)) + min);
	}

	@Override
	public void run() {
		int distancia;
		name = Thread.currentThread().getName();
		
		try {
			for (distancia = correr; distancia < longitud; distancia += correr) {
				System.out.println(name + " corrio " + correr + " pies " + "(" + distancia + "/" + longitud + ")");
				Thread.sleep(sleeping);
				correr = getRandom(velocidad_min, velocidad_max);
			}
			System.out.println(
					name + " corrio " + correr + " pies y llego a la meta " + "(" + distancia + "/" + longitud + ")");
		} catch (InterruptedException e) {
		}
	}
}
