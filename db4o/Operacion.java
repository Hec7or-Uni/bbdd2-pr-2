import java.sql.Timestamp;

public class Operacion {
    private Cuenta cuenta;
    private String codigo;
    private Timestamp fecha;
    private Number cantidad;
    private String descripcion;

    public Operacion(Cuenta cuenta, String codigo, Number cantidad) {
        this.codigo = codigo;
        this.fecha = new Timestamp(System.currentTimeMillis());
        this.cantidad = cantidad;
        this.descripcion = "";
        this.cuenta = cuenta;
    }

    public Operacion(Cuenta cuenta, String codigo, Number cantidad, String descripcion) {
        this.codigo = codigo;
        this.fecha = new Timestamp(System.currentTimeMillis());
        this.cantidad = cantidad;
        this.descripcion = descripcion;
        this.cuenta = cuenta;
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

    public Cuenta getCuenta() {
        return cuenta;
    }

    public void setCuenta(Cuenta cuenta) {
        this.cuenta = cuenta;
    }
}
