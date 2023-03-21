import java.sql.Date;
import java.util.List;

public class Cliente {
    private String DNI;
    private String nombre;
    private String apellido;
    private String email;
    private String telefono;
    private Date fechaNacimiento;
    private String direccion;
    private Integer edad;
    private List<Cuenta> cuentas;

    public Cliente(String DNI, String nombre, String apellido, String email,
            String telefono, String fechaNacimiento, String direccion) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.telefono = telefono;
        this.fechaNacimiento = parseDate(fechaNacimiento);
        this.direccion = direccion;
        calularEdad();
    }

    public Cliente(String DNI, String nombre, String apellido, String email,
            String telefono, Date fechaNacimiento, String direccion, List<Cuenta> cuentas) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.telefono = telefono;
        this.fechaNacimiento = fechaNacimiento;
        this.direccion = direccion;
        this.cuentas = cuentas;
        calularEdad();
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
        this.calularEdad();
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Integer getEdad() {
        return edad;
    }

    private void calularEdad() {
        this.edad = 0;
    }

    public List<Cuenta> getCuentas() {
        return cuentas;
    }

    public void setCuentas(List<Cuenta> cuentas) {
        this.cuentas = cuentas;
    }

    public void addCuenta(Cuenta cuenta) {
        this.cuentas.add(cuenta);
    }

    public void addCuentas(List<Cuenta> cuentas) {
        for (Cuenta c : cuentas) {
            this.cuentas.add(c);
        }
    }

    private Date parseDate(String fecha) {
        String fechaArray[] = fecha.split("-");
        return Date.valueOf(fechaArray[2] + "-" + fechaArray[1] + "-" + fechaArray[0]);
    }
}
