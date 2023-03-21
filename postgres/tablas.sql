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
    tipoCuenta          varchar(9)  not null
);

CREATE TABLE cuentaAhorro  (
    IBAN                varchar(40) primary key,
    fechaCreacion       timestamp   not null,
    saldo               float       default(0),
    tipoCuenta          varchar(9)  not null,
    interes             integer     not null
) INHERITS (cuenta);

CREATE TABLE cuentaCorriente (
    IBAN                varchar(40) primary key,
    fechaCreacion       timestamp   not null,
    saldo               float       default(0),
    tipoCuenta          varchar(9)  not null,
    oficina             INTEGER     REFERENCES oficina(codigo)
) INHERITS (cuenta);

CREATE TABLE operacion (
    codigo              varchar(36) primary key,
    cantidad            float       not null,
    fechaYHora          timestamp   not null,
    descripcion         varchar(250),
    cuentaEmisora   VARCHAR(24)		NOT NULL    REFERENCES cuenta(IBAN)   
);

CREATE TABLE transferencia (
    codigo              varchar(36) primary key,
    cantidad            float       not null,
    fechaYHora          timestamp   not null,
    descripcion         varchar(250),
    cuentaEmisora   VARCHAR(24)		NOT NULL    REFERENCES cuenta(IBAN),
    cuentaReceptora VARCHAR(24)		NOT NULL    REFERENCES cuenta(IBAN)
) INHERITS (operacion);

CREATE TABLE ingreso (
    codigo              varchar(36) primary key,
    cantidad            float       not null,
    fechaYHora          timestamp   not null,
    descripcion         varchar(250),
    cuentaEmisora   VARCHAR(24)		NOT NULL    REFERENCES cuenta(IBAN),
    oficina         INTEGER         REFERENCES oficina(codigo)
) INHERITS (operacion);

CREATE TABLE retirada (
    codigo              varchar(36) primary key,
    cantidad            float       not null,
    fechaYHora          timestamp   not null,
    descripcion         varchar(250),
    cuentaEmisora   VARCHAR(24)		NOT NULL    REFERENCES cuenta(IBAN),
    oficina         INTEGER         REFERENCES oficina(codigo)
) INHERITS (operacion);

CREATE TABLE TIENEN (
    DNI     VARCHAR(9)      REFERENCES cliente(DNI),
    IBAN    VARCHAR(40)     REFERENCES cuenta(IBAN),
    PRIMARY KEY (DNI, IBAN)	
);