CREATE TABLE cliente OF clienteUdt (
    DNI                 VARCHAR2(9) PRIMARY KEY,
    nombre              VARCHAR2(100) NOT NULL,
    apellido            VARCHAR2(100) NOT NULL,
    fechaNacimiento     DATE NOT NULL,
    direccion           VARCHAR2(100) NOT NULL,
    telefono            INTEGER NOT NULL,
    email               VARCHAR2(50) NOT NULL,
    refCuenta           REF(cuentaUdt) SCOPE IS cuenta ARRAY[100],
    CONSTRAINT fk_cliente_cuenta FOREIGN KEY (refCuenta) REFERENCES cuenta(cuentaID)
);

CREATE TABLE cuenta OF cuentaUdt (
    id                  INTEGER PRIMARY KEY,
    codPais             VARCHAR2(2) NOT NULL,
    codIdentificacion   VARCHAR2(2) NOT NULL,
    digitosCtrl         VARCHAR2(4) NOT NULL,
    numCuenta           VARCHAR2(16) NOT NULL,
    fechaCreacion       TIMESTAMP NOT NULL,
    saldo               FLOAT NOT NULL,
    refCliente          REF(clienteUdt) SCOPE IS cliente ARRAY[10],
    refEntidad          REF(entidadUdt) SCOPE IS entidad VARCHAR2(4),
    refOperacion        REF(operacionUdt) SCOPE IS operacion ARRAY[100],
    CONSTRAINT fk_cuenta_cliente FOREIGN KEY (refCliente) REFERENCES cliente(clienteID),
    CONSTRAINT fk_cuenta_entidad FOREIGN KEY (refEntidad) REFERENCES entidad(id)
);

CREATE TABLE cuentaAhorro OF cuentaAhorroUdt (
    interes             INTEGER NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_cuentaAhorro_cuenta FOREIGN KEY (id) REFERENCES cuenta(id)
);

CREATE TABLE cuentaCorriente OF cuentaCorrienteUdt (
    refOficina          INTEGER NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_cuentaCorriente_cuenta FOREIGN KEY (id) REFERENCES cuenta(id),
    CONSTRAINT fk_cuentaCorriente_oficina FOREIGN KEY (refOficina) REFERENCES oficina(codigo)
);

create table oficina of oficinaUdt (
    codigo              integer primary key,
    telefono            varchar(50) not null,
    direccion           varchar(250) not null,
    entidad             integer,
    foreign key (entidad) references entidad(codigo)
    on delete set null,
    ref is system generated
);

create table entidad of entidadUdt (
    codigoPais          varchar(2) not null,
    codIdentificacion   varchar(10) not null,
    primary key (codigoPais, codIdentificacion),
    ref is system generated
);

create table operacion of operacionUdt (
    codigo              integer primary key,
    cantidad            float not null,
    fechaYHora          timestamp not null,
    descripcion         varchar(250),
    refCuentaEmisora    integer not null,
    refCuentaReceptora  integer,
    refOficina          integer,
    foreign key (refCuentaEmisora) references cuenta(cuentaID),
    foreign key (refCuentaReceptora) references cuenta(cuentaID),
    foreign key (refOficina) references oficina(oficinaID)
    on delete cascade,
    ref is system generated
);
