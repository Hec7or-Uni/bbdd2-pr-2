DROP TABLE cliente FORCE;
/

DROP TABLE cuenta FORCE;
/

DROP TABLE oficina FORCE;
/

DROP TABLE operacion FORCE;
/

CREATE TABLE cliente OF clienteUdt (
    DNI                 PRIMARY KEY,
    nombre              NOT NULL,
    apellido            NOT NULL,
    fechaNacimiento     NOT NULL,
    direccion           NOT NULL,
    telefono            NOT NULL,
    email               NOT NULL
    -- refCuenta se deja con la posibilidad de tener valor nulo para
    -- poder hacer la población. Se van a introducir los clientes,
    -- después las cuentas, y por último se modificarán los clientes
    -- para introducirles la cuenta.
)
object id system generated;
/

CREATE TABLE cuenta OF cuentaUdt (
    IBAN                PRIMARY KEY,
    fechaCreacion       NOT NULL,
    saldo               NOT NULL,
    tipo                NOT NULL,
    refCliente          NOT NULL
)
object id system generated;
/

create table oficina of oficinaUdt (
    codigo              primary key,
    telefono            not null,
    direccion           not null
)
object id system generated;
/

create table operacion of operacionUdt (
    codigo              primary key,
    cantidad            not null,
    fechaYHora          not null,
    refCuentaEmisora    not null,
    tipoOperacion       not null
)
object id system generated;
/
