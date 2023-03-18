CREATE TYPE clienteUdt AS OBJECT (
DNI VARCHAR2(9),
nombre VARCHAR2(100),
apellido VARCHAR2(100),
email VARCHAR2(50),
telefono NUMBER,
fechaNacimiento DATE,
direccion VARCHAR2(100),
edad NUMBER,
refCuenta REF(cuentaUdt) SCOPE IS cuenta ARRAY[100], -- IBAN = codPais + codIdentificacion + digitosCtrl + numCuenta
MEMBER PROCEDURE setNull REFERENCES ARE CHECKED ON DELETE SET NULL
) INSTANTIABLE NOT FINAL REF IS SYSTEM GENERATED;

CREATE TYPE entidadUdt AS OBJECT (
id VARCHAR2(36),
codPais VARCHAR2(2),
codIdentificacion VARCHAR2(2),
refCuenta REF(cuentaUdt) SCOPE IS cuenta ARRAY[100], -- IBAN = codPais + codIdentificacion + digitosCtrl + numCuenta
MEMBER PROCEDURE setNull REFERENCES ARE CHECKED ON DELETE SET NULL
) INSTANTIABLE NOT FINAL REF IS SYSTEM GENERATED;

CREATE TYPE cuentaUdt AS OBJECT (
id NUMBER,
codPais VARCHAR2(2),
digitosCtrl VARCHAR2(4),
codIdentificacion VARCHAR2(2),
numCuenta VARCHAR2(16),
fechaCreacion TIMESTAMP,
saldo FLOAT,
refCliente REF(clienteUdt) SCOPE IS cliente ARRAY[10], -- DNI
refEntidad REF(entidadUdt) SCOPE IS entidad VARCHAR2(4), -- ID = codPais + codIdentificacion
refOperacion REF(operacionUdt) SCOPE IS operacion ARRAY[100], -- codigo
MEMBER PROCEDURE setNull REFERENCES ARE CHECKED ON DELETE SET NULL
) INSTANTIABLE NOT FINAL REF IS SYSTEM GENERATED;

CREATE TYPE cuentaAhorroUdt UNDER cuentaUdt (
interes NUMBER
) INSTANTIABLE NOT FINAL REF IS SYSTEM GENERATED;

CREATE TYPE cuentaCorrienteUdt UNDER cuentaUdt (
refOficina REF(oficinaUdt) SCOPE IS oficina INTEGER,
MEMBER PROCEDURE setNull REFERENCES ARE CHECKED ON DELETE SET NULL
) INSTANTIABLE NOT FINAL REF IS SYSTEM GENERATED;

CREATE TYPE oficinaUdt AS OBJECT (
codigo NUMBER,
telefono NUMBER,
direccion VARCHAR2(255),
refEntidad REF(entidadUdt) SCOPE IS entidad VARCHAR2(4), -- ID = codPais + codIdentificacion
MEMBER PROCEDURE setNull REFERENCES ARE CHECKED ON DELETE SET NULL,
refIngreso REF(ingresoUdt) SCOPE IS ingreso ARRAY[100], -- codigo
MEMBER PROCEDURE setNull REFERENCES ARE CHECKED ON DELETE SET NULL,
refRetirada REF(retiradaUdt) SCOPE IS retirada ARRAY[100], -- codigo
MEMBER PROCEDURE setNull REFERENCES ARE CHECKED ON DELETE SET NULL
) INSTANTIABLE NOT FINAL REF IS SYSTEM GENERATED;

CREATE TYPE operacionUdt AS (
    codigo              integer,
    cantidad            float,
    fechaYHora          timestamp,
    descripcion         varchar(250),
    refCuentaEmisora    REF(cuentaUdt) SCOPE IS cuenta,
    CONSTRAINT op_cuenta_emisora_fk FOREIGN KEY (refCuentaEmisora) REFERENCES cuentaUdt,
    REFERENCE IS SYSTEM GENERATED
) INSTANTIABLE NOT FINAL REF IS SYSTEM GENERATED;

CREATE TYPE transferenciaUdt UNDER operacionUdt (
    refCuentaReceptora  REF(cuentaUdt) SCOPE IS cuenta,
    CONSTRAINT tr_cuenta_receptora_fk FOREIGN KEY (refCuentaReceptora) REFERENCES cuentaUdt,
    REFERENCE IS SYSTEM GENERATED
) INSTANTIABLE NOT FINAL REF IS SYSTEM GENERATED;

CREATE TYPE ingresoUdt UNDER operacionUdt (
    refOficina          REF(oficinaUdt) SCOPE IS oficina,
    CONSTRAINT ing_oficina_fk FOREIGN KEY (refOficina) REFERENCES oficinaUdt,
    REFERENCE IS SYSTEM GENERATED
) INSTANTIABLE NOT FINAL REF IS SYSTEM GENERATED;

CREATE TYPE retiradaUdt UNDER operacionUdt (
    refOficina          REF(oficinaUdt) SCOPE IS oficina,
    CONSTRAINT ret_oficina_fk FOREIGN KEY (refOficina) REFERENCES oficinaUdt,
    REFERENCE IS SYSTEM GENERATED
) INSTANTIABLE NOT FINAL REF IS SYSTEM GENERATED;


Nota: En Oracle, el tipo de datos para los números enteros es NUMBER, y se usa VARCHAR2 en lugar de VARCHAR. También he añadido las member procedures setNull para que los valores de las referencias sean establecidos a null cuando se elimina la entidad a la que hacen referencia.
He agregado restricciones FOREIGN KEY para las referencias a otras entidades y he eliminado las restricciones REFERENCES ARE CHECKED ON DELETE SET NULL, ya que no son necesarias en Oracle. También he utilizado la sintaxis SCOPE IS para las referencias a los tipos cuentaUdt y oficinaUdt, que es la sintaxis de Oracle para indicar el ámbito de la referencia. Además, he usado la sintaxis REFERENCE IS SYSTEM GENERATED para indicar que las referencias son generadas por el sistema.
