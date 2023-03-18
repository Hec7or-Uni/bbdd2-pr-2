CLIENTE
DNI (clave primaria)
apellidos
nombre
fechaNacimiento
direccion
email
telefono
edad

CUENTA
codPais + codIdentificacion + digitosCtrl + numCuenta (clave primaria)
codPais
codIdentificacion
digitosCtrl
numCuenta
fechaCreacion
saldo
entidad (codigo)

TIENE
cliente + cuenta (clave primaria)
cliente (DNI)
cuenta (codPais, codIdentificacion, digitosCtrl, numCuenta)

AHORRO
cuenta (codPais, codIdentificacion, digitosCtrl, numCuenta) (clave primaria)
interés

CORRIENTE
cuenta (codPais, codIdentificacion, digitosCtrl, numCuenta) (clave primaria)
oficina (codigo)

OFICINA
codigo (clave primaria)
telefono
dirección
entidad (codPais, codIdentificacion)

ENTIDAD
codPais + codIdentificacion (clave primaria)
codPais
codIdentificacion

TRANSFERENCIA
clave primaria (codigo)
codigo
cantidad
fechaYHora
descripcion
cuenta emisora (codPais, codIdentificacion, digitosCtrl, numCuenta)
cuenta receptora (codPais, codIdentificacion, digitosCtrl, numCuenta)

INGRESOS
clave primaria (codigo)
codigo
cantidad
fechaYHora
descripcion
cuenta emisora (codPais, codIdentificacion, digitosCtrl, numCuenta)
oficina (codigo)

RETIRADAS
clave primaria (codigo)
codigo
cantidad
fechaYHora
descripcion
cuenta emisora (codPais, codIdentificacion, digitosCtrl, numCuenta)
oficina (codigo)
