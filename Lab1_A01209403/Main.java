// ITESM QRO
// Java Lab 1 
// Diana Estefanía Ortiz Ledesma
// A01209403

public class Main {
	public static void main(String[] args) throws Exception {
		
		System.out.println("Primer carrera.");
		Carrera conejo = new Carrera(100, 20, 30, 100);
		Carrera tortuga = new Carrera(100, 5, 6, 10);
		race(conejo, tortuga);
		
		System.out.println("\nSegunca carrera.");
		conejo = new Carrera(100, 20, 30, 100);
		tortuga = new Carrera(100, 4, 10, 10);
		race(conejo, tortuga);
		
		System.out.println("\nTercer carrera.");
		conejo = new Carrera(50, 30, 40, 80);
		tortuga = new Carrera(50, 3, 6, 10);
		race(conejo, tortuga);
		
		System.out.println("\nCuarta carrera.");
		conejo = new Carrera(75, 50, 60, 80);
		conejo = new Carrera(75, 6, 8, 10);
		race(conejo, tortuga);
	}

	private static void race(Carrera conejo, Carrera tortuga) throws InterruptedException {
		Thread rabbit = new Thread(conejo, "Conejo");
		Thread turtle = new Thread(tortuga, "Tortuga");
		rabbit.start();
		turtle.start();
		boolean cg = false, tg = false;
		
		while (rabbit.isAlive() || turtle.isAlive()) {
			
			if (!rabbit.isAlive()) {
				cg = true;
				turtle.interrupt();
				turtle.join();
				System.out.println(rabbit.getName() + " gano la carrera.");
				break;
			} else if (!turtle.isAlive()) {
				tg = true;
				rabbit.interrupt();
				rabbit.join();
				System.out.println(turtle.getName() + " gano la carrera.");
				break;
			}
		}
		if (!(cg || tg)) {
			System.out.println("Cualquiera podría ganar.");
		}
	}
}
