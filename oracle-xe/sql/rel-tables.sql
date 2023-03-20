create table cliente(
    DNI             VARCHAR(9)      PRIMARY KEY,
    nombre          VARCHAR(100)    NOT NULL,
    apellido        VARCHAR(100)    NOT NULL,
    email           VARCHAR(50),
    telefono        VARCHAR(15)     NOT NULL,
    fechaNacimiento DATE            NOT NULL,
    direccion       VARCHAR(100)    NOT NULL,
    edad            INTEGER         NOT NULL
);

create table entidad (
    id              VARCHAR(36)     PRIMARY KEY,
    codPais         VARCHAR(2)      NOT NULL,
    codId           VARCHAR(4)      NOT NULL,
    UNIQUE (codPais, codId)
);

create table oficina (
    codigo          INTEGER         PRIMARY KEY,
    telefono        VARCHAR(15)     NOT NULL,
    direccion       VARCHAR(255)    NOT NULL,
    idEntidad       VARCHAR(36)     NOT NULL,
    FOREIGN KEY (idEntidad)         REFERENCES entidad(id)
);

create table cuenta (
    id              VARCHAR(24)     PRIMARY KEY,
    codPais         VARCHAR(2)      NOT NULL,
    digitosCtrl     VARCHAR(4)      NOT NULL,
    codId           VARCHAR(2)      NOT NULL,
    numCuenta       VARCHAR(16)     NOT NULL,
    fechaCreacion   TIMESTAMP       NOT NULL,
    saldo           NUMBER   		DEFAULT(0),
    tipoCuenta      VARCHAR(9)      NOT NULL,
    interes         DECIMAL(4,3),
    oficina         INTEGER         NULL,
    idEntidad       VARCHAR(36)     NOT NULL,
    UNIQUE (codPais, codId, digitosCtrl, numCuenta),
    CHECK (tipoCuenta IN ('ahorro', 'corriente')),
    CHECK ((tipoCuenta = 'ahorro' AND oficina IS NULL AND interes IS NOT NULL) OR (tipoCuenta = 'corriente' AND oficina IS NOT NULL AND interes IS NULL)),
    FOREIGN KEY (oficina)           REFERENCES oficina(codigo),
    FOREIGN KEY (idEntidad)         REFERENCES entidad(id)
);

create table operacion (
    codigo          VARCHAR(36),
    cantidad        NUMBER			NOT NULL,
    timestamp       TIMESTAMP       NOT NULL,
    tipoOp          VARCHAR(13)     NOT NULL,
    descripcion     VARCHAR(255),
    cuentaEmisora   VARCHAR(24)		NOT NULL,
    cuentaReceptora VARCHAR(24)		NOT NULL,
    oficina         INTEGER         NULL,
    CHECK (tipoOp IN ('ingreso', 'retirada', 'transferencia')),
    CHECK ((tipoOp = 'ingreso' AND cuentaReceptora IS NULL AND oficina IS NOT NULL) OR (tipoOp = 'retirada' AND cuentaReceptora IS NULL AND oficina IS NOT NULL) OR (tipoOp = 'transferencia' AND cuentaReceptora IS NOT NULL AND oficina IS NULL)),
    PRIMARY KEY (codigo),
    FOREIGN KEY (cuentaEmisora)     REFERENCES cuenta(id),
    FOREIGN KEY (cuentaReceptora)   REFERENCES cuenta(id),
    FOREIGN KEY (oficina)           REFERENCES oficina(codigo)
);

create table tiene (
    DNI         VARCHAR(9)      NOT NULL,
    idCuenta    VARCHAR(24)		NOT NULL,
    PRIMARY KEY (DNI, idCuenta),
    FOREIGN KEY (DNI)   		REFERENCES cliente(DNI),
    FOREIGN KEY (idcuenta)		REFERENCES cuenta(id)
);
