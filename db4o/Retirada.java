import java.sql.Timestamp;

public class Retirada extends Operacion {
    private String oficina;

    public Retirada(String codigo, Timestamp fecha, Number cantidad, String descripcion, String oficina) {
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
