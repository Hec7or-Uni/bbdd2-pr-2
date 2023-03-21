import java.util.List;

public class Ahorro extends Cuenta {
    private Number interes;

    public Ahorro(String IBAN, Cliente cliente, Number interes) {
        super(IBAN, cliente);
        this.interes = interes;
    }

    public Ahorro(String IBAN, List<Cliente> clientes, Number interes) {
        super(IBAN, clientes);
        this.interes = interes;
    }

    public Number getInteres() {
        return interes;
    }

    public void setInteres(Number interes) {
        this.interes = interes;
    }
}
