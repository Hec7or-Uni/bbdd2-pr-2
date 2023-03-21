import java.util.List;

public class Corriente extends Cuenta {
    private Number oficina;

    public Corriente() { super(); }

    public Corriente(String IBAN, Cliente cliente, Number oficina) {
        super(IBAN, cliente);
        this.oficina = oficina;
    }

    public Corriente(String IBAN, List<Cliente> clientes, Number oficina) {
        super(IBAN, clientes);
        this.oficina = oficina;
    }

    public Number getOficina() {
        return oficina;
    }

    public void setOficina(Number oficina) {
        this.oficina = oficina;
    }

    @Override
    public String toString() {
        return "Corriente{" + "IBAN=" + getIBAN() + ", fechaCreacion=" + getFechaCreacion() + ", saldo=" + getSaldo() + ", oficina=" + oficina + '}';
    }
}
