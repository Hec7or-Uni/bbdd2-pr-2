import java.sql.Timestamp;

public class Operacion {
    private String codigo;
    private Timestamp fecha;
    private Number cantidad;
    private String descripcion;

    public Operacion(String codigo, Timestamp fecha, Number cantidad, String descripcion) {
        this.codigo = codigo;
        this.fecha = fecha;
        this.cantidad = cantidad;
        this.descripcion = descripcion;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }

    public Number getCantidad() {
        return cantidad;
    }

    public void setCantidad(Number cantidad) {
        this.cantidad = cantidad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
