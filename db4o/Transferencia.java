public class Transferencia extends Operacion {
  private Cuenta destino;

  public Transferencia() { }

  public Transferencia(Cuenta envio, Cuenta destino, String codigo, Number cantidad) {
    super(envio, codigo, cantidad);
    this.destino = destino;
  }

  public Transferencia(Cuenta envio, Cuenta destino, String codigo, Number cantidad, String descripcion) {
    super(envio, codigo, cantidad, descripcion);
    this.destino = destino;
  }

  public Cuenta getDestino() {
    return destino;
  }

  public void setDestino(Cuenta destino) {
    this.destino = destino;
  }

  @Override
  public String toString() {
    return "Ingreso{" + "cuentaE="+ getCuenta().getIBAN() + ", cuentaD=" + destino.getIBAN() + ", codigo=" + getCodigo() + ", fecha=" + getFecha() + ", cantidad=" + getCantidad() + ", descripcion=" + getDescripcion() + '}';
  }
}
