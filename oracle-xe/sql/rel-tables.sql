CREATE TABLE CLIENTES (
    DNI             VARCHAR(9)      PRIMARY KEY,
    nombre          VARCHAR(30)     NOT NULL,
    apellido        VARCHAR(30)     NOT NULL,
    email           VARCHAR(75),
    telefono        VARCHAR(15)     NOT NULL,
    fechaNacimiento DATE            NOT NULL ,
    direccion       VARCHAR(50)     NOT NULL,
    edad            INTEGER         NOT NULL
);

CREATE TABLE OFICINAS (
    codigo          INTEGER         PRIMARY KEY,
    telefono        VARCHAR(15)     NOT NULL,
    direccion       VARCHAR(255)    NOT NULL,
);

CREATE TABLE CUENTAS (
    IBAN            VARCHAR(24)     PRIMARY KEY,
    fechaCreacion   TIMESTAMP       NOT NULL,
    saldo           NUMBER          DEFAULT(0),
    tipoCuenta      ENUM('AHORRO', 'CORRIENTE') NOT NULL,
    interes         DECIMAL(4,3),
    oficina         INTEGER         NULL,
    CHECK ((tipoCuenta = 'AHORRO' AND oficina IS NULL AND interes IS NOT NULL) OR (tipoCuenta = 'CORRIENTE' AND oficina IS NOT NULL AND interes IS NULL)),
    FOREIGN KEY (oficina)   REFERENCES oficina(codigo),
);

CREATE TABLE OPERACIONES (
    codigo          VARCHAR(36),
    cantidad        NUMBER			NOT NULL,
    timestamp       TIMESTAMP       NOT NULL,
    tipoOp          ENUM('INGRESO', 'RETIRADA', 'TRANSFERENCIA') NOT NULL,
    descripcion     VARCHAR(255),
    cuentaEmisora   VARCHAR(24)		NOT NULL,
    cuentaReceptora VARCHAR(24)		NOT NULL,
    oficina         INTEGER         NULL,
    CHECK ((tipoOp = 'INGRESO' AND cuentaReceptora IS NULL AND oficina IS NOT NULL) OR (tipoOp = 'RETIRADA' AND cuentaReceptora IS NULL AND oficina IS NOT NULL) OR (tipoOp = 'TRANSFERENCIA' AND cuentaReceptora IS NOT NULL AND oficina IS NULL)),
    PRIMARY KEY (codigo),
    FOREIGN KEY (cuentaEmisora)     REFERENCES cuenta(id),
    FOREIGN KEY (cuentaReceptora)   REFERENCES cuenta(id),
    FOREIGN KEY (oficina)           REFERENCES oficina(codigo)
);

CREATE TABLE TIENEN (
    DNI         VARCHAR(9)      NOT NULL,
    idCuenta    VARCHAR(24)		NOT NULL,
    PRIMARY KEY (DNI, idCuenta),
    FOREIGN KEY (DNI)   		REFERENCES cliente(DNI),
    FOREIGN KEY (idcuenta)		REFERENCES cuenta(id)
);
