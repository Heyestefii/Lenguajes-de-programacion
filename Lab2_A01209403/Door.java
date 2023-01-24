// ITESM QRO
// Java Lab 2 
// Diana Estefanía Ortiz Ledesma
// A01209403

public class Door implements Runnable {

	BotanicalGarden garden;
	long num_people;
	String which_door;

	Door door;
	
	public Door(BotanicalGarden garden, long num_people, String which_door) {
		this.garden = garden;
		this.num_people = num_people;
		this.which_door = which_door;
	}

	public void door_name(Door door) {
		this.door = door;
	}

	public String getName() {
		return which_door;
	}

	public void leave() {
		garden.person_leaves();
	}

	@Override
	public void run() {
		String which_door = Thread.currentThread().getName();
		long random_milliseconds;
		
		try {
			Thread.sleep(2000);
			System.out.println(num_people + " people will enter the garden through " + which_door + " during the day");
			
			for (int i = 1; i <= num_people; i++) {
				
				garden.person_enters();
				
				System.out.println( "Visitant " + i + " has entered through " + which_door);
				random_milliseconds = getRandom(1, 5);
				
				if (random_milliseconds == 1) {
					System.out.println("Visitant " + i + " stay for " + random_milliseconds + " second");
					Thread.sleep(random_milliseconds * 1000);
				} else {
					System.out.println("Visitant " + i + " stay for " + random_milliseconds + " seconds");
					Thread.sleep(random_milliseconds * 1000);
				}
				
				int rand = getRandom(0, 2);
				if (rand == 0) {
					garden.person_leaves();
					System.out.println("Visitant " + i + " has left through " + which_door);
				} else {
					door.leave();
					System.out.println("Visitant " + i + " has left through " + door.getName());
				}
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
		}
	}

	public static Integer getRandom(int min, int max) {
		return (int) ((Math.random() * (max - min)) + min);
	}

}
