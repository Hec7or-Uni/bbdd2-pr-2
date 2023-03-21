create table cliente of clienteUdt (
    primary key (DNI),
    nombre              with option not null,
    apellido            with option not null,
    fechaNacimiento     with option not null,
    direccion           with option not null,
    telefono            with option not null,
    email               with option not null,
    ref is clienteID system generated
);

create table cuenta of cuentaUdt (
    primary key (id),
    codPais             with option not null,
    codIdentificacion   with option not null,
    digitosCtrl         with option not null,
    numCuenta           with option not null,
    fechaCreacion       with option not null,
    saldo               with option not null,
    refEntidad          with option not null,
    foreign key (entidad) references entidad(codigo),
    on delete cascade,
    ref is cuentaID system generated
);

create table cuentaAhorro of cuentaAhorroUdt (
    interes             with option not null
) under cuenta;

create table cuentaCorriente of cuentaCorrienteUdt (
    refOficina          with option not null
    foreign key (oficina) references oficina(codigo)
    on delete cascade,
) under cuenta;

create table oficina of oficinaUdt (
    primary key (codigo),
    telefono            with option not null,
    direccion           with option not null,
    foreign key (entidad) references entidad(codigo)
    on delete set null,
    ref is oficinaID system generated
);

create table operacion of operacionUdt (
    primary key (codigo)
    cantidad            with option not null,
    fechaYHora          with option not null,
    refCuentaEmisora    with option not null,
    foreign key (cuenta) references cuenta(codPais,codIdentificacion,digitosCtrl,numCuenta),
    foreign key (oficina) references oficina(codigo),
    on delete cascade,
    ref is operacionID system generated
);
