create type cliente (
    DNI             INTEGER         PRIMARY KEY,
    apellidos       VARCHAR(100)    NOT NULL,
    nombre          VARCHAR(100)    NOT NULL,
    fechaNacimiento DATE            NOT NULL,
    direccion       VARCHAR(100)    NOT NULL,
    email           VARCHAR(50),
    telefono        INTEGER         NOT NULL,
    edad
);

create table cuenta (
    PRIMARY KEY (codPais, codIdentificacion, digitosCtrl, numCuenta)
    codPais         VARCHAR(2)      NOT NULL,
    codIdentificacion VARCHAR(2)    NOT NULL,
    digitosCtrl     VARCHAR(4)      NOT NULL,
    numCuenta       VARCHAR(16)     NOT NULL,
    fechaCreacion   TIMESTAMP       NOT NULL,
    saldo           FLOAT           NOT NULL,
    FOREIGN KEY (entidad) REFERENCES entidad(codigo)
);

create table tiene (
    PRIMARY KEY (cliente, cuenta)
    FOREIGN KEY (cliente) REFERENCES cliente(DNI),
    FOREIGN KEY (cuenta) REFERENCES cuenta(codPais, codIdentificacion, digitosCtrl, numCuenta),
);

create table ahorro (
    cuenta          INTEGER         PRIMARY KEY,
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
