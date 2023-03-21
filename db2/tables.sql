CREATE TABLE cliente (
    idCliente           INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_cliente       clienteUdt NOT NULL
);

CREATE TABLE oficina (
    idOficina       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_oficina   oficinaUdt NOT NULL
);

CREATE TABLE cuenta (
    idCuenta       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_cuenta   cuentaUdt NOT NULL
);

CREATE TABLE cuentaAhorro (
    idCuentaAhorro     	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_cuentaAhorro 	cuentaAhorroUdt NOT NULL
);

CREATE TABLE cuentaCorriente (
    idCuentaCorriente     	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_cuentaCorriente 	cuentaCorrienteUdt NOT NULL,
    oficina                 integer
);

CREATE TABLE operacion (
    idOperacion    	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_operacion	operacionUdt NOT NULL,
    cuentaEmisora   varchar(40)
);

CREATE TABLE transferencia (
    idTransferencia 	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_transferencia	transferenciaUdt NOT NULL,
    cuentaReceptora   varchar(40)
);

CREATE TABLE retirada (
    idRetirada       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_retirada   retiradaUdt NOT NULL,
    oficina          integer
);

CREATE TABLE ingreso (
    idIngreso       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_ingreso   ingresoUdt NOT NULL,
    oficina         integer
);

CREATE TABLE tienen (
    idTienen       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_tienen   tienenUdt NOT NULL,
    DNI            varchar(9),
    IBAN           varchar(40)
);