import java.sql.Timestamp;
import java.util.List;
import java.util.ArrayList;

public class Cuentas {
    private String IBAN;
    private Timestamp fechaCreacion;
    private Number saldo;
    private List<Cliente> clientes;
    private List<Operacion> operaciones;

    public Cuentas(String IBAN, Cliente cliente) {
        this.IBAN = IBAN;
        this.fechaCreacion = new Timestamp(System.currentTimeMillis());
        this.saldo = 0;
        this.clientes = new ArrayList<>();
        this.operaciones = new ArrayList<>();
        this.clientes.add(cliente);
    }

    public Cuentas(String IBAN, List<Cliente> clientes) {
        this.IBAN = IBAN;
        this.fechaCreacion = new Timestamp(System.currentTimeMillis());
        this.saldo = 0;
        this.clientes = clientes;
        this.operaciones = new ArrayList<>();
    }

    public String getIBAN() {
        return this.IBAN;
    }

    public void setIBAN(String IBAN) {
        this.IBAN = IBAN;
    }

    public Timestamp getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Timestamp fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public Number getSaldo() {
        return saldo;
    }

    public void setSaldo(Number saldo) {
        this.saldo = saldo;
    }

    public List<Cliente> getClientes() {
        return this.clientes;
    }

    public List<Operacion> getOperaciones() {
        return this.operaciones;
    }

    public void setClientes(List<Cliente> clientes) {
        this.clientes = clientes;
    }

    public void addCliente(Cliente cliente) {
        this.clientes.add(cliente);
    }

    public void addClientes(List<Cliente> clientes) {
        for (Cliente c : clientes) {
            this.clientes.add(c);
        }
    }

    public void setOperaciones(List<Operacion> operaciones) {
        this.operaciones = operaciones;
    }

    public void addCliente(Operacion operacion) {
        this.operaciones.add(operacion);
    }

    public void addOperaciones(List<Operacion> operaciones) {
        for (Operacion op : operaciones) {
            this.operaciones.add(op);
        }
    }
}
