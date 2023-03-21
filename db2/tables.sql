CREATE TABLE cliente (
    idCliente           INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_cliente       clienteUdt
);

CREATE TABLE oficina (
    idOficina       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_oficina   oficinaUdt NOT NULL
);

CREATE TABLE cuenta (
    idCuenta       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_cuenta   cuentaUdt NOT NULL
);

CREATE TABLE cuentaAhorro UNDER cuenta(
    idCuentaAhorro     	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_cuentaAhorro 	cuentaAhorroUdt NOT NULL
);

CREATE TABLE cuentaCorriente UNDER cuenta(
    idCuentaCorriente     	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_cuentaCorriente 	cuentaCorrienteUdt NOT NULL,
);

CREATE TABLE operacion (
    idOperacion    	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_operacion	operacionUdt NOT NULL
);

CREATE TABLE transferencia (
    idTransferencia 	INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_transferencia	transferenciaUdt NOT NULL
);

CREATE TABLE retirada (
    idRetirada       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_retirada   retiradaUdt NOT NULL
);

CREATE TABLE ingreso (
    idIngreso       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_ingreso   ingresoUdt NOT NULL
);

CREATE TABLE tienen (
    idTienen       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    datos_tienen   tienenUdt NOT NULL
);