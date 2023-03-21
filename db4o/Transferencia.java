import java.sql.Timestamp;

public class Transferencia extends Operacion {
  private String IBAN;

  public Transferencia(String codigo, Timestamp fecha, Number cantidad, String descripcion, String IBAN) {
    super(codigo, fecha, cantidad, descripcion);
    this.IBAN = IBAN;
  }

  public String getIBAN() {
    return IBAN;
  }

  public void setIBAN(String IBAN) {
    this.IBAN = IBAN;
  }
}
