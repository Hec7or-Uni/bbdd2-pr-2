import java.io.File;
import com.db4o.*;

public class App {
  public static void main(String[] args) {
    File f = new File("database.db4o");
    ObjectContainer db = Db4oEmbedded.openFile(f.getAbsolutePath());
    System.out.println("Hello World!");
    db.close();
  }
}
