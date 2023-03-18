create type clienteUdt as(
    DNI                 integer,
    apellidos           varchar(100),
    nombre              varchar(100),
    fechaNacimiento     date,
    direccion           varchar(100),
    email               varchar(50),
    telefono            integer,
    edad                integer,
    refCuenta ref(cuentaUdt) scope cuenta array[100] -- IBAN = codPais + codIdentificacion + digitosCtrl + numCuenta
    references are checked on delete set null
) instantiable not final ref is system generated;

create type cuentaUdt as (
    codPais             varchar(2),
    codIdentificacion   varchar(2),
    digitosCtrl         varchar(4),
    numCuenta           varchar(16),
    fechaCreacion       timestamp,
    saldoActual         float,
    refCliente ref(clienteUdt) scope cliente array[10] -- DNI
    references are checked on delete set null,
    refEntidad ref(entidadUdt) scope entidad varchar(4) -- ID = codPais + codIdentificacion
    references are checked on delete cascade
    refOperacion ref(operacionUdt) scope operacion array[100] -- codigo
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
    refEntidad ref(entidadUdt) scope entidad varchar(4) -- ID = codPais + codIdentificacion
    references are checked on delete set null,
    refIngreso ref(ingresoUdt) scope ingreso array[100] -- codigo
    references are checked on delete set null,
    refRetirada ref(retiradaUdt) scope retirada array[100] -- codigo
    references are checked on delete set null
) instantiable not final ref is system generated;

create type entidadUdt as (
    codPais             varchar(2),
    codIdentificacion   varchar(2),
    refCuenta ref(cuentaUdt) scope cuenta array[100] -- IBAN = codPais + codIdentificacion + digitosCtrl + numCuenta
    references are checked on delete set null
) instantiable not final ref is system generated;

create type operacionUdt as (
    codigo              integer,
    cantidad            float,
    fechaYHora          timestamp,
    descripcion         varchar(250),
    refCuentaEmisora ref(cuentaUdt) scope cuenta integer -- IBAN = codPais + codIdentificacion + digitosCtrl + numCuenta
    references are checked on delete set null,
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
