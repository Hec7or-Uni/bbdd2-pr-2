create type clienteUdt as(
    DNI integer,
    apellidos varchar(100),
    nombre varchar(100),
    fechaNacimiento date,
    direccion varchar(100),
    email varchar(50),
    telefono integer,
    refCuentas ref(cuentaUdt) scope cuenta array[100]
    references are checked on delete set null
) instantiable not final ref is system generated;

create type cuentaUdt as (
    numero integer,
    IBANcontrol varchar(4);
    IBANresto  varchar(20),
    fechaCreacion timestamp,
    saldoActual float,
    refCliente ref(clienteUdt) scope cliente array[10]
    references are checked on delete set null,
    refEntidad ref(entidadUdt) scope entidad integer
    references are checked on delete cascade
) instantiable not final ref is system generated;

create type cuentaAhorroUdt under cuentaUdt as (
    interes integer
) instantiable not final ref is system generated;

create type cuentaCorrienteUdt under cuentaUdt as (
    refOficina ref(oficinaUdt) scope oficina integer
    references are checked on delete set null
) instantiable not final ref is system generated;

create type oficinaUdt as (
    codigo integer,
    telefono integer,
    direccion varchar(255),
    refEntidad ref(entidadUdt) scope entidad integer
    references are checked on delete set null,
    refIngreso ref(ingresoUdt) scope ingreso array[100]
    references are checked on delete set null,
    refRetirada ref(retiradaUdt) scope retirada array[100]
    references are checked on delete set null
) instantiable not final ref is system generated;

create type entidadUdt as (
    codigo integer,
    pais varchar(50),
    nombre varchar(50),
    refCuenta ref(cuentaUdt) scope cuenta array[100]
    references are checked on delete set null
) instantiable not final ref is system generated;

create type operacionUdt as (
    codigo integer,
    importe float,
    fecha timestamp,
    descripcion varchar(250),
    refCuentaEmisora ref(cuentaUdt) scope cuenta integer
    references are checked on delete cascade,
) instantiable not final ref is system generated;

create type transferenciaUdt under operacionUdt as (
    refCuentaReceptora ref(cuentaUdt) scope cuenta integer
    references are checked on delete set null
) instantiable not final ref is system generated;

create type ingresoUdt under operacionUdt as (
    refOficina ref(oficinaUdt) scope oficina integer
    references are checked on delete set null,
) instantiable not final ref is system generated;

create type retiradaUdt under operacionUdt as (
    refOficina ref(oficinaUdt) scope oficina integer
    references are checked on delete set null,
) instantiable not final ref is system generated;
