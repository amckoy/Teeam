//creates devlog entries, to keep entries in the same format

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Scanner;
import java.io.FileWriter;

public class devlog {

    public static void main(String[] args) throws Exception {
	String[] peoples = {"Ayman", "Derek", "Adam"};
	Scanner io = new Scanner(System.in);
	FileWriter devlog = new FileWriter("devlog.txt", true);
	int person;
	String progress;
	DateFormat date = new SimpleDateFormat("E',' MM/dd/yy',' hh:mm a");
	Date today = new Date();
	String timestamp = date.format(today);
	System.out.print("0)Ayman\n1)Derek\n2)Adam\nWho are you: ");
	//parsing int because nextline skips over progress call
	person = Integer.parseInt(io.nextLine());
	System.out.print("Progress made: ");
	progress = io.nextLine();
	devlog.write(timestamp + "\n");
	devlog.write("\t" + peoples[person] + ": " + progress + "\n\n");
	devlog.close();
    }
    
}
