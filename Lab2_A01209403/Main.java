// ITESM QRO
// Java Lab 2 
// Diana Estefanía Ortiz Ledesma
// A01209403 

public class Main {

	public static void main(String args[]) throws InterruptedException {
		BotanicalGarden garden = new BotanicalGarden();
		
		Door east_door = new Door(garden, 6, "east door");
		Door west_door = new Door(garden, 3, "west door");
		
		Thread t1 = new Thread(east_door, "east door");
		Thread t2 = new Thread(west_door, "west door");
		east_door.door_name(west_door);
		west_door.door_name(east_door);
		
		t1.start();
		t2.start();
		t1.join();
		t2.join();
		
		System.out.print("There are " + garden.get_countpeople() + " visitants left in the garden.");
	}

}
