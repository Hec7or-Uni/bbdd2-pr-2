CREATE TYPE clienteUdt AS (
	DNI                 varchar(9),
    nombre              varchar(100),
    apellido            varchar(100),
    email               varchar(50),
    telefono            varchar(15),
    fechaNacimiento     varchar(10),
    direccion           varchar(100),
    edad                integer)
    NOT FINAL
    MODE DB2SQL;

CREATE TYPE oficinaUdt AS (
	codigo              integer,
    telefono            varchar(15),
    direccion           varchar(255))
    NOT FINAL
    MODE DB2SQL;

CREATE TYPE cuentaUdt AS (
	IBAN                varchar(40),
    fechaCreacion       timestamp,
    saldo               float)
    NOT FINAL
    MODE DB2SQL;
    
CREATE TYPE cuentaAhorroUdt UNDER cuentaUdt AS (
    interes             float)
    NOT FINAL
    MODE DB2SQL;

CREATE TYPE cuentaCorrienteUdt UNDER cuentaUdt AS (
    oficina             REF(oficinaUdt))
    NOT FINAL
    MODE DB2SQL;

CREATE TYPE operacionUdt AS (
	codigo              varchar(36),
    cantidad            float,
    fechaYHora          timestamp,
    descripcion         varchar(250),
    cuentaEmisora       REF(cuentaUdt))
    NOT FINAL
    MODE DB2SQL;

CREATE TYPE transferenciaUdt UNDER operacionUdt AS (
    cuentaReceptora     REF(cuentaUdt))
    NOT FINAL
    MODE DB2SQL;

CREATE TYPE ingresoUdt AS (
	oficina             REF(oficinaUdt))
    NOT FINAL
    MODE DB2SQL;

CREATE TYPE retiradaUdt AS (
    oficina             REF(oficinaUdt))
    NOT FINAL
    MODE DB2SQL;

CREATE TYPE tienenUdt AS (
	DNI                 REF(clienteUdt),
    IBAN                REF(cuentaUdt))
    NOT FINAL
    MODE DB2SQL;