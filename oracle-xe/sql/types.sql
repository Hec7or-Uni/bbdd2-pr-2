DROP TYPE retiradaUdt FORCE;
/

DROP TYPE ingresoUdt FORCE;
/

DROP TYPE tranSferenciaUdt FORCE;
/

DROP TYPE operacionUdt FORCE;
/

DROP TYPE tipoCuenta FORCE;
/

DROP TYPE cuentaCorrienteUdt FORCE;
/

DROP TYPE tipoOficina FORCE;
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

DROP TYPE tipoEntidad FORCE;
/

DROP TYPE entidadUdt FORCE;
/

CREATE TYPE entidadUdt AS OBJECT (
    id VARCHAR2(36),
    codPais VARCHAR2(2),
    codIdentificacion VARCHAR2(2)
) INSTANTIABLE NOT FINAL;
/

CREATE TYPE tipoEntidad as ARRAY(1) OF REF entidadUdt;
/

CREATE TYPE oficinaUdt AS OBJECT (
    codigo NUMBER,
    telefono NUMBER,
    direccion VARCHAR2(255),
    refEntidad tipoEntidad -- ID = codPais + codIdentificacion
) INSTANTIABLE NOT FINAL;
/

CREATE OR REPLACE TYPE clienteUdt AS OBJECT (
    DNI VARCHAR2(9),
    nombre VARCHAR2(100),
    apellido VARCHAR2(100),
    email VARCHAR2(50),
    telefono NUMBER,
    fechaNacimiento DATE,
    direccion VARCHAR2(100),
    edad NUMBER
)
INSTANTIABLE NOT FINAL;
/

CREATE TYPE tipoTitulares as VARRAY(10) of REF clienteUdt;
/

CREATE OR REPLACE TYPE cuentaUdt AS OBJECT (
    id NUMBER,
    codPais VARCHAR2(2),
    digitosCtrl VARCHAR2(4),
    codIdentificacion VARCHAR2(2),
    numCuenta VARCHAR2(16),
    fechaCreacion TIMESTAMP,
    saldo FLOAT,
    refCliente tipoTitulares, -- DNI
    refEntidad tipoEntidad -- ID = codPais + codIdentificacion
) INSTANTIABLE NOT FINAL;
/

CREATE OR REPLACE TYPE tipoCuentas AS VARRAY(100) of REF cuentaUdt;
/

ALTER TYPE clienteUdt ADD ATTRIBUTE (refCuenta tipoCuentas) CASCADE; -- IBAN = codPais + codIdentificacion + digitosCtrl + numCuenta
/

CREATE TYPE cuentaAhorroUdt UNDER cuentaUdt (
    interes NUMBER
) INSTANTIABLE NOT FINAL;
/

CREATE TYPE tipoOficina AS ARRAY(1) OF REF oficinaUdt;
/

CREATE TYPE cuentaCorrienteUdt UNDER cuentaUdt (
    refOficina tipoOficina
) INSTANTIABLE NOT FINAL;
/

CREATE TYPE tipoCuenta AS ARRAY(1) OF REF cuentaUdt;
/

CREATE TYPE operacionUdt AS OBJECT(
    codigo              number,
    cantidad            float,
    fechaYHora          timestamp,
    descripcion         varchar2(250),
    refCuentaEmisora    tipoCuenta
) INSTANTIABLE NOT FINAL;
/

CREATE TYPE transferenciaUdt UNDER operacionUdt (
    refCuentaReceptora  tipoCuenta
) INSTANTIABLE NOT FINAL;
/

CREATE TYPE ingresoUdt UNDER operacionUdt (
    refOficina          tipoOficina
) INSTANTIABLE NOT FINAL;
/

CREATE TYPE retiradaUdt UNDER operacionUdt (
    refOficina          tipoOficina
) INSTANTIABLE NOT FINAL;
/
