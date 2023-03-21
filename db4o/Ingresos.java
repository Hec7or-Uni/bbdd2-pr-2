public class Ingresos extends Operacion {
    private Integer oficina;

    public Ingresos() { super(); }

    public Ingresos(Cuenta cuenta, String codigo, Number cantidad, Integer oficina) {
        super(cuenta, codigo,  cantidad);
        this.oficina = oficina;
    }

    public Ingresos(Cuenta cuenta, String codigo, Number cantidad, String descripcion, Integer oficina) {
        super(cuenta, codigo,  cantidad, descripcion);
        this.oficina = oficina;
    }

    public Integer getOficina() {
        return oficina;
    }

    public void setOficina(Integer oficina) {
        this.oficina = oficina;
    }

    @Override
    public String toString() {
        return "Ingreso{" + "cuenta="+ getCuenta().getIBAN() + ", codigo=" + getCodigo() + ", fecha=" + getFecha() + ", cantidad=" + getCantidad() + ", descripcion=" + getDescripcion() + "oficina=" + oficina + '}';
    }
}
