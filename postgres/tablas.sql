CREATE TABLE cliente (
    DNI                 varchar(9)      primary key,
    nombre              varchar(100)    not null,
    apellido            varchar(100)    not null,
    email               varchar(50)     not null,
    telefono            varchar(15)     not null,
    fechaNacimiento     date            not null,
    direccion           varchar(100)    not null,
    edad                integer         not null
);

CREATE TABLE oficina (
    codigo              integer         primary key,
    telefono            varchar(15),
    direccion           varchar(255)
);

CREATE TABLE cuenta (
    IBAN                varchar(40) primary key,
    fechaCreacion       timestamp   not null,
    saldo               float       default(0),
    tipoCuenta          varchar(9)  not null,
    interes             float,
    oficina             INTEGER     REFERENCES oficina(codigo),
    CHECK (tipoCuenta IN ('AHORRO', 'CORRIENTE')),
    CHECK ((tipoCuenta = 'AHORRO' AND oficina IS NULL AND interes IS NOT NULL) OR (tipoCuenta = 'CORRIENTE' AND oficina IS NOT NULL AND interes IS NULL))
);

CREATE TABLE operacion (
    codigo              varchar(36) primary key,
    cantidad            float       not null,
    fechaYHora          timestamp   not null,
    descripcion         varchar(250),
    cuentaEmisora       VARCHAR(40)		NOT NULL    REFERENCES cuenta(IBAN),
    tipoOperacion       varchar(13) not null
);

CREATE TABLE transferencia (
    codigo              varchar(36) primary key,
    cantidad            float       not null,
    fechaYHora          timestamp   not null,
    descripcion         varchar(250),
    cuentaEmisora   VARCHAR(40)		NOT NULL    REFERENCES cuenta(IBAN),
    tipoOperacion       varchar(13) not null,
    cuentaReceptora VARCHAR(40)		NOT NULL    REFERENCES cuenta(IBAN)
) INHERITS (operacion);

CREATE TABLE ingreso (
    codigo              varchar(36) primary key,
    cantidad            float       not null,
    fechaYHora          timestamp   not null,
    descripcion         varchar(250),
    cuentaEmisora   VARCHAR(40)		NOT NULL    REFERENCES cuenta(IBAN),
    tipoOperacion       varchar(13) not null,
    oficina         INTEGER         REFERENCES oficina(codigo)
) INHERITS (operacion);

CREATE TABLE retirada (
    codigo              varchar(36) primary key,
    cantidad            float       not null,
    fechaYHora          timestamp   not null,
    descripcion         varchar(250),
    cuentaEmisora   VARCHAR(40)		NOT NULL    REFERENCES cuenta(IBAN),
    tipoOperacion       varchar(13) not null,
    oficina         INTEGER         REFERENCES oficina(codigo)
) INHERITS (operacion);

CREATE TABLE tienen (
    DNI     VARCHAR(9)      REFERENCES cliente(DNI),
    IBAN    VARCHAR(40)     REFERENCES cuenta(IBAN),
    PRIMARY KEY (DNI, IBAN)	
);