CREATE FUNCTION cliente_t (cli clienteUdt)
    returns varchar(410) language sql
    return cli..DNI || ", " || cli..nombre || ", " || cli..apellido ||
    ", " || cli..email || ", " || cli..telefono || ", " || cli..fechaNacimiento
    || ", " ||cli..direccion || ", " || cli..edad

CREATE FUNCTION oficina_t (ofi oficinaUdt)
    returns varchar(280) language sql
    return ofi..codigo || ', ' || ofi..telefono || ', ' || ofi..direccion

CREATE FUNCTION cuenta_t (cue cuentaUdt)
    returns varchar(60) language sql
    return cue..IBAN || ', ' || cue..fechaCreacion || ', ' || cue..saldo

CREATE FUNCTION cuentaAhorro_t (aho cuentaAhorroUdt)
    returns varchar(5) language sql
    return aho..interes

CREATE FUNCTION cuentaCorriente_t (corr cuentaCorrienteUdt)
    returns varchar(5) language sql
    return corr..oficina

CREATE FUNCTION operacion_t (op operacionUdt)
    returns varchar(180) language sql
    return op..codigo || ', ' || op..cantidad || ', ' || op..fechaYHora ||
    ', ' || op..descripcion || ', ' || op..cuentaEmisora

CREATE FUNCTION transferencia_t (tra transferenciaUdt)
    return varchar(27) language sql
    return op..cuentaReceptora

CREATE FUNCTION ingreso_t (ing ingresoUdt)
    returns varchar(5) language sql
    return ing..oficina

CREATE FUNCTION retirada_t (ret retiradaUdt)
    returns varchar(5) language sql
    return ret..oficina

CREATE FUNCTION tienen_t (tie tienenUdt)
    returns varchar(49) language sql
    return tie..DNI || ', ' || tie..IBAN