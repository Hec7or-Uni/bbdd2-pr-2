DROP TABLE cliente FORCE;
/

DROP TABLE cuenta FORCE;
/

DROP TABLE cuentaAhorro FORCE;
/

DROP TABLE cuentaCorriente FORCE;
/

DROP TABLE oficina FORCE;
/

DROP TABLE entidad FORCE;
/

DROP TABLE operacion FORCE;
/

DROP TABLE transferencia FORCE;
/

DROP TABLE ingreso FORCE;
/

DROP TABLE retirada FORCE;
/

CREATE TABLE cliente OF clienteUdt (
    DNI                 PRIMARY KEY,
    nombre              NOT NULL,
    apellido            NOT NULL,
    fechaNacimiento     NOT NULL,
    direccion           NOT NULL,
    telefono            NOT NULL,
    email               NOT NULL,
    refCuenta           NOT NULL
);
/

CREATE TABLE cuenta OF cuentaUdt (
    id                  PRIMARY KEY,
    codPais             NOT NULL,
    codIdentificacion   NOT NULL,
    digitosCtrl         NOT NULL,
    numCuenta           NOT NULL,
    fechaCreacion       NOT NULL,
    saldo               NOT NULL,
    refCliente          NOT NULL,
    refEntidad          NOT NULL
);
/

CREATE TABLE cuentaAhorro OF cuentaAhorroUdt(
    interes             NOT NULL,
    PRIMARY KEY (id)
);
/

CREATE TABLE cuentaCorriente OF cuentaCorrienteUdt (
    refOficina         NOT NULL,
    PRIMARY KEY (id)
);
/

create table oficina of oficinaUdt (
    codigo              primary key,
    telefono            not null,
    direccion           not null,
    refEntidad          not null
);
/

create table entidad of entidadUdt (
    codPais          not null,
    codId   not null,
    primary key (id)
);
/

create table operacion of operacionUdt (
    codigo              primary key,
    cantidad            not null,
    fechaYHora          not null,
    refCuentaEmisora    not null
);
/

create table transferencia of transferenciaUdt (
    codigo              primary key,
    refCuentaReceptora  not null
);
/

create table ingreso of ingresoUdt (
    codigo              primary key,
    refOficina          not null
);
/

create table retirada of retiradaUdt (
    codigo              primary key,
    refOficina          not null
);
/
