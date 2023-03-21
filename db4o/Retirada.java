public class Retirada extends Operacion {
    private Integer oficina;

    public Retirada(Cuenta cuenta, String codigo, Number cantidad, Integer oficina) {
        super(cuenta, codigo,  cantidad);
        this.oficina = oficina;
    }

    public Retirada(Cuenta cuenta, String codigo, Number cantidad, String descripcion, Integer oficina) {
        super(cuenta, codigo,  cantidad, descripcion);
        this.oficina = oficina;
    }

    public Integer getOficina() {
        return oficina;
    }

    public void setOficina(Integer oficina) {
        this.oficina = oficina;
    }
}
