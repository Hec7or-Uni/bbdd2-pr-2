import java.sql.Timestamp;

public class Ingresos extends Operacion {
    private String oficina;

    public Ingresos(String codigo, Timestamp fecha, Number cantidad, String descripcion, String oficina) {
        super(codigo, fecha, cantidad, descripcion);
        this.oficina = oficina;
    }

    public String getOficina() {
        return oficina;
    }

    public void setOficina(String oficina) {
        this.oficina = oficina;
    }
}
