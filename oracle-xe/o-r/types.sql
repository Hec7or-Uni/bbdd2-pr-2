DROP TYPE retiradaUdt FORCE;
/

DROP TYPE ingresoUdt FORCE;
/

DROP TYPE transferenciaUdt FORCE;
/

DROP TYPE operacionUdt FORCE;
/

DROP TYPE tipoCuenta FORCE;
/

DROP TYPE cuentaCorrienteUdt FORCE;
/

DROP TYPE cuentaAhorroUdt FORCE;
/

DROP TYPE tipoCuentas FORCE;
/

DROP TYPE cuentaUdt FORCE;
/

DROP TYPE tipoTitulares FORCE;
/

DROP TYPE clienteUdt FORCE;
/

DROP TYPE oficinaUdt FORCE;
/

CREATE TYPE oficinaUdt AS OBJECT (
    codigo NUMBER,
    telefono VARCHAR(15),
    direccion VARCHAR2(255)
) INSTANTIABLE NOT FINAL;
/

CREATE OR REPLACE TYPE clienteUdt AS OBJECT (
    DNI VARCHAR2(9),
    nombre VARCHAR2(100),
    apellido VARCHAR2(100),
    email VARCHAR2(50),
    telefono VARCHAR(15),
    fechaNacimiento DATE,
    direccion VARCHAR2(100),
    edad NUMBER
)
INSTANTIABLE NOT FINAL;
/

CREATE TYPE tipoTitulares as VARRAY(50) of REF clienteUdt;
/

CREATE OR REPLACE TYPE cuentaUdt AS OBJECT (
    IBAN VARCHAR(40),
    fechaCreacion TIMESTAMP,
    saldo FLOAT,
    tipo VARCHAR(9),
    refCliente tipoTitulares
) INSTANTIABLE NOT FINAL;
/

CREATE TYPE cuentaAhorroUdt UNDER cuentaUdt (
    interes NUMBER
) INSTANTIABLE NOT FINAL;
/

CREATE TYPE cuentaCorrienteUdt UNDER cuentaUdt (
    refOficina REF oficinaUdt
) INSTANTIABLE NOT FINAL;
/

CREATE OR REPLACE TYPE tipoCuentas AS VARRAY(100) of REF cuentaUdt;
/

ALTER TYPE clienteUdt ADD ATTRIBUTE (refCuenta tipoCuentas) CASCADE; -- IBAN = codPais + codIdentificacion + digitosCtrl + numCuenta
/

CREATE TYPE operacionUdt AS OBJECT(
    codigo              varchar(36),
    cantidad            float,
    fechaYHora          timestamp,
    descripcion         varchar2(250),
    refCuentaEmisora    ref cuentaUdt,
    tipoOperacion       varchar(13)
) INSTANTIABLE NOT FINAL;
/

CREATE TYPE transferenciaUdt UNDER operacionUdt (
    refCuentaReceptora  REF cuentaUdt
) INSTANTIABLE NOT FINAL;
/

CREATE TYPE ingresoUdt UNDER operacionUdt (
    refOficina          REF oficinaUdt
) INSTANTIABLE NOT FINAL;
/

CREATE TYPE retiradaUdt UNDER operacionUdt (
    refOficina          REF oficinaUdt
) INSTANTIABLE NOT FINAL;
/
