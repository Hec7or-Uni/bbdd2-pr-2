create table cliente of clienteUdt (
    primary key (DNI),
    nombre with option not null,
    apellidos with option not null,
    fechaNacimiento with option not null,
    direccion with option not null,
    email with option not null,
    telefono with option not null,
    ref is clienteID system generated
);

create table cuenta of cuentaUdt (
    primary key (IBANresto),
    numero with option not null,
    IBANcontrol with option not null,
    fechaCreacion with option not null,
    saldoActual with option not null,
    refCliente with option not null,
    refEntidad with option not null,
    foreign key (entidad) references entidad(codigo)
    on delete cascade,
    ref is cuentaID system generated
);

create table cuentaAhorro of cuentaAhorroUdt (
    interes with option not null
) under cuenta;

create table cuentaCorriente of cuentaCorrienteUdt (
    refOficina with option not null
) under cuenta;

create table oficina of oficinaUdt (
    primary key (codigo),
    telefono with option not null,
    direccion with option not null,
    foreign key (entidad) references entidad(codigo)
    on delete set null,
    ref is oficinaID system generated
);

create table entidad of entidadUdt (
    primary key (codigo),
    pais with option not null,
    ref is entidadID system generated
);

create table operacion of operacionUdt (
    primary key (codigo, cuenta)
    importe with option not null,
    fecha with option not null,
    refCuentaEmisora with option not null,
    foreign key (cuenta) references cuenta(IBANresto)
    on delete cascade,
    ref is operacionID system generated
);

create table transferencia of transferenciaUdt (
    refCuentaReceptora with option not null
) under operacion;

create table ingreso of ingresoUdt (
    refOficina with option not null
) under operacion;

create table retirada of retiradaUdt (
    refOficina with option not null
) under operacion;