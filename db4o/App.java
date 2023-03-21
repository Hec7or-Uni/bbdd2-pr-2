import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import com.db4o.*;


public class App {
  public static void main(String[] args) {
    File f = new File("database.db4o");
    ObjectContainer db = Db4oEmbedded.openFile(f.getAbsolutePath());
    try {
      // -----------------------------
      Cliente c1 = new Cliente("88184985G", "Rance", "Bedle", "rbedle0@bravesites.com", "+34 935-332-576","12-06-1971", "8230 Elmside Center");
      Cliente c2 = new Cliente("35757133A", "Emanuele", "Dawnay", "edawnay1@is.gd", "+34 408-600-663","15-08-1977", "3 Spohn Alley");
      Cliente c3 = new Cliente("41147501H", "Juliana", "Wickmann", "jwickmann2@goo.ne.jp", "+34 363-821-663","09-11-1979", "52 Paget Center");
      List<Cliente> clientes = Arrays.asList(c1, c2, c3);
      // -----------------------------
      List <Cliente> cli = new ArrayList<>();
      cli.add(c1);
      cli.add(c2);
      Ahorro cu1 = new Ahorro("FI74 9078 9407 6036 45", cli, 0.1);
      Corriente cu2 = new Corriente("FO20 5755 0074 4797 91", c3, 245);
      List<Cuenta> cuentas = Arrays.asList(cu1);
      // -----------------------------
      Ingresos op1 = new Ingresos(cu1, "1", 100, 245);
      Ingresos op2 = new Ingresos(cu2, "2", 200, 245);
      Ingresos op3 = new Ingresos(cu1, "3", 300, 245);
      Ingresos op4 = new Ingresos(cu2, "4", 400, 245);
      Ingresos op5 = new Ingresos(cu1, "5", 500, 245);
      Retirada op6 = new Retirada(cu2, "6", 100, 245);
      Retirada op7 = new Retirada(cu1, "7", 200, 245);
      Transferencia op8 = new Transferencia(cu1, cu2, "7", 200);
      List<Operacion> ops = Arrays.asList(op1, op2, op3, op4, op5, op6, op7, op8);
      // -----------------------------
      Oficina of = new Oficina(245, "+34 202-141-948", "7 Anhalt Place");
      // -----------------------------
      db.store(of);
      for (Cliente c : clientes) db.store(c);
      for (Cuenta cu : cuentas) db.store(cu);
      for (Operacion op : ops) db.store(op);
      // ----- CLIENTES ------------------------
      Cliente c = new Cliente();
      ObjectSet<Cliente> r1 = db.queryByExample(c);
      while (r1.hasNext()) System.out.println(r1.next());
      // ----- CUENTAS ------------------------
      Cuenta cu = new Cuenta();
      ObjectSet<Cuenta> r2 = db.queryByExample(cu);
      while (r2.hasNext()) System.out.println(r2.next());
      // ----- OPERACIONES ------------------------
      Operacion op = new Operacion();
      ObjectSet<Operacion> r3 = db.queryByExample(op);
      while (r3.hasNext()) System.out.println(r3.next());
      // ----- OFICINAS ------------------------
      Oficina o = new Oficina();
      ObjectSet<Oficina> r4 = db.queryByExample(o);
      while (r4.hasNext()) System.out.println(r4.next());
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      db.close();
    }
  }
}
