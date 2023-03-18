CLIENTE
DNI (clave primaria)
apellidos
nombre
fechaNacimiento
direccion
email
telefono

CUENTA
numero
IBAN control
IBAN resto
fecha creacion
saldo actual
entidad (codigo)
clave primaria numero

TITULAR
clave primaria DNI + IBAN control
cliente (DNI)
cuenta (IBAN control)

CUENTA AHORRO
cuenta (IBAN control) clave primaria
interés

CUENTA CORRIENTE
cuenta (IBAN control) clave primaria
oficina (codigo)

OFICINA
codigo (clave primaria)
telefono
dirección
entidad (codigo)

ENTIDAD
codigo (clave primaria)
pais
nombre

TRANSFERENCIA
clave primaria (codigo + cuenta emisora)
codigo
cuenta emisora (IBAN control)
importe
fecha y hora
descripcion
cuenta receptora (IBAN control)

INGRESORETIRADA
clave primaria (codigo + IBAN control)
codigo
cuenta emisora (IBAN control)
importe
fecha y hora
descripcion
oficina (codigo)
tipo

HAY QUE PONER CHECK EN EL CAMPO TIPO DE INGRESORETIRADA