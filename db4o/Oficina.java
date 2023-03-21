import java.util.List;

public class Oficina {
    private Integer codigo;
    private String telefono;
    private String direccion;
    private List<Ingresos> ingresos;
    private List<Retirada> retiros;

    public Oficina() { 
        this.ingresos = null;
        this.retiros = null;
    }

    public Oficina(Integer codigo, String telefono, String direccion) {
        this.codigo = codigo;
        this.telefono = telefono;
        this.direccion = direccion;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public List<Ingresos> getIngresos() {
        return this.ingresos;
    }

    public List<Retirada> getRetiradas() {
        return this.retiros;
    }

    public void setIngresos(List<Ingresos> ingresos) {
        this.ingresos = ingresos;
    }

    public void addIngreso(Ingresos ingresos) {
        this.ingresos.add(ingresos);
    }

    public void addIngresos(List<Ingresos> ingresos) {
        for (Ingresos op : ingresos) {
            this.ingresos.add(op);
        }
    }

    public void setRetiradas(List<Retirada> retiradas) {
        this.retiros = retiradas;
    }

    public void addRetiradas(Retirada retiradas) {
        this.retiros.add(retiradas);
    }

    public void addRetiradas(List<Retirada> retiradas) {
        for (Retirada op : retiradas) {
            this.retiros.add(op);
        }
    }

    @Override
    public String toString() {
        return  "Oficina{" + "codigo=" + codigo + ", telefono=" + telefono + ", direccion=" + direccion + '}';
    }
}
