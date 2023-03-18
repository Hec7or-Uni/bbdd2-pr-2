create type clienteUdt as(
    DNI                 varchar(9),
    nombre              varchar(100),
    apellido            varchar(100),
    email               varchar(50),
    telefono            integer,
    fechaNacimiento     date,
    direccion           varchar(100),
    edad                integer,
    refCuenta ref(cuentaUdt) scope cuenta array[100], -- IBAN = codPais + codIdentificacion + digitosCtrl + numCuenta
    references are checked on delete set null
) instantiable not final ref is system generated;

create type entidadUdt as (
    id                  varchar(36),
    codPais             varchar(2),
    codIdentificacion   varchar(2),
    refCuenta ref(cuentaUdt) scope cuenta array[100], -- IBAN = codPais + codIdentificacion + digitosCtrl + numCuenta
    references are checked on delete set null
) instantiable not final ref is system generated;

create type cuentaUdt as (
    id                  integer,
    codPais             varchar(2),
    digitosCtrl         varchar(4),
    codIdentificacion   varchar(2),
    numCuenta           varchar(16),
    fechaCreacion       timestamp,
    saldo               float,
    refCliente ref(clienteUdt) scope cliente array[10], -- DNI
    refEntidad ref(entidadUdt) scope entidad varchar(4), -- ID = codPais + codIdentificacion
    refOperacion ref(operacionUdt) scope operacion array[100], -- codigo
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
    telefono            integer,
    direccion           varchar(255),
    refEntidad ref(entidadUdt) scope entidad varchar(4), -- ID = codPais + codIdentificacion
    references are checked on delete set null,
    refIngreso ref(ingresoUdt) scope ingreso array[100], -- codigo
    references are checked on delete set null,
    refRetirada ref(retiradaUdt) scope retirada array[100], -- codigo
    references are checked on delete set null
) instantiable not final ref is system generated;

create type operacionUdt as (
    codigo              integer,
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
