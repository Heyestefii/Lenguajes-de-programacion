// ITESM QRO
// Java Lab 2 
// Diana Estefanía Ortiz Ledesma
// A01209403

public class BotanicalGarden {
	private int count_people = 0;

	public synchronized void person_enters() {
		count_people++;
	}

	public synchronized void person_leaves() {
		count_people--;
	}

	public synchronized int get_countpeople() {
		return count_people;
	}
}