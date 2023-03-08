create type cliente(
    DNI             INTEGER         PRIMARY KEY,
    apellidos       VARCHAR(100)    NOT NULL        CHECK (apellidos<>''),
    nombre          VARCHAR(100)    NOT NULL        CHECK (nombre<>''),
    fechaNacimiento DATE            NOT NULL,
    direccion       VARCHAR(100)    NOT NULL        CHECK (direccion<>''),
    email           VARCHAR(50)     NOT NULL        CHECK (email<>''),
    telefono        INTEGER         NOT NULL        CHECK (telefono>0),
);

create table cuenta (
    numero          INTEGER         NOT NULL,
    IBANcontrol     INTEGER         NOT NULL,
    IBANresto       INTEGER         PRIMARY KEY,
    fechaCreacion   TIMESTAMP       NOT NULL,
    saldoActual     FLOAT           NOT NULL        CHECK (saldo<>0.0),
    FOREIGN KEY (entidad) REFERENCES entidad(codigo)
);

create table titular (
    FOREIGN KEY (cliente) REFERENCES cliente(DNI),
    FOREIGN KEY (cuenta) REFERENCES cuenta(IBANcontrol),
    PRIMARY KEY (cliente,cuenta)
);

create table cuentaAhorro (
    IBANcontrol     INTEGER         PRIMARY KEY,
    interes         INTEGER         NOT NULL
);

create table cuentaCorriente (
    IBANcontrol     INTEGER         PRIMARY KEY,
    FOREIGN KEY (oficina) REFERENCES oficina(codigo)
);

create table oficina (
    codigo          INTEGER         PRIMARY KEY,
    telefono        INTEGER         NOT NULL,
    direccion       VARCHAR(255)    NOT NULL,
    FOREIGN KEY (entidad) REFERENCES entidad(codigo)
);

create table entidad (
    codigo          INTEGER         PRIMARY KEY,
    pais            VARCHAR(255)    NOT NULL,
    nombre          VARCHAR(255)    NOT NULL
);

create table transferencia (
    codigo          INTEGER,
    importe         FLOAT           NOT NULL        CHECK (importe<>0.0),
    fecha           TIMESTAMP       NOT NULL,
    descripcion     VARCHAR(255),
    FOREIGN KEY (cuentaEmisora) REFERENCES cuenta(IBANcontrol)
    FOREIGN KEY (cuentaReceptora) REFERENCES cuenta(IBANcontrol)
    PRIMARY KEY (codigo,cuentaEmisora)
);

create table ingresoRetirada (
    codigo          INTEGER,
    importe         FLOAT           NOT NULL        CHECK (importe<>0.0),
    fecha           TIMESTAMP       NOT NULL,
    descripcion     VARCHAR(250),
    tipo            VARCHAR(8)      NOT NULL        CHECK(tipo=='ingreso' OR tipo=='retirada')
    FOREIGN KEY (cuentaEmisora) REFERENCES cuenta(IBANcontrol),
    FOREIGN KEY (oficina) REFERENCES oficina(codigo),
    PRIMARY KEY (codigo, cuentaEmisora)
);
