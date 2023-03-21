create type clienteUdt as(
    DNI                 varchar(9),
    nombre              varchar(100),
    apellido            varchar(100),
    email               varchar(50),
    telefono            varchar(15),
    fechaNacimiento     date,
    direccion           varchar(100),
    edad                integer,
    refCuenta ref(cuentaUdt) scope cuenta array[100], -- IBAN = codPais + codIdentificacion + digitosCtrl + numCuenta
    references are checked on delete set null
) instantiable not final ref is system generated;

create type cuentaUdt as (
    IBAN                varchar(40),
    fechaCreacion       timestamp,
    saldo               float,
    refCliente ref(clienteUdt) scope cliente array[10], -- DNI
    references are checked on delete set null
) instantiable not final ref is system generated;

create type cuentaAhorroUdt under cuentaUdt as (
    interes             integer
) instantiable not final ref is system generated;

create type cuentaCorrienteUdt under cuentaUdt as (
    refOficina ref(oficinaUdt) scope oficina integer
    references are checked on delete set null
) instantiable not final ref is system generated;

create type oficinaUdt as (
    codigo              integer,
    telefono            varchar(15),
    direccion           varchar(255),
) instantiable not final ref is system generated;

create type operacionUdt as (
    codigo              varchar(36),
    cantidad            float,
    fechaYHora          timestamp,
    descripcion         varchar(250),
    refCuentaEmisora ref(cuentaUdt) scope cuenta integer, -- IBAN = codPais + codIdentificacion + digitosCtrl + numCuenta
    references are checked on delete set null
) instantiable not final ref is system generated;

create type transferenciaUdt under operacionUdt as (
    refCuentaReceptora ref(cuentaUdt) scope cuenta integer -- IBAN = codPais + codIdentificacion + digitosCtrl + numCuenta
    references are checked on delete set null
) instantiable not final ref is system generated;

create type ingresoUdt under operacionUdt as (
    refOficina ref(oficinaUdt) scope oficina integer -- codigo
    references are checked on delete set null,
) instantiable not final ref is system generated;

create type retiradaUdt under operacionUdt as (
    refOficina ref(oficinaUdt) scope oficina integer -- codigo
    references are checked on delete set null,
) instantiable not final ref is system generated;
