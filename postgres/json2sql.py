import json

# CLIENTES
# Leer los datos del archivo JSON
with open('seed/MOCK_DATA_CLIENTES.json', 'r') as archivo:
    datos = json.load(archivo)

# Generar las sentencias de inserción
salida = open('postgres/MOCK_DATA_CLIENTES.sql', 'w')
for dato in datos:
    if "'" in dato['apellido']:
        dato['apellido'] = dato['apellido'].replace("'", "''")
    if "'" in dato['nombre']:
        dato['nombre'] = dato['nombre'].replace("'", "''")
    div1 = dato['fechaNacimiento'].split('-')
    dia = div1[0]
    mes = div1[1]
    agno = div1[2]
    fecha = agno + "-" + mes + "-" + dia
    sentencia = "INSERT INTO cliente (DNI, nombre, apellido, email, telefono, fechaNacimiento, direccion, edad) VALUES ('" + dato['DNI'] + "', '" + dato['nombre'] + "', '" + dato['apellido'] + "', '" + str(dato['email']) + "', '" + dato['telefono'] + "', '" + fecha + "', '" + dato['direccion'] + "', " + str(dato['edad']) + ");\n"
    salida.write(sentencia)
salida.close()
archivo.close()

# CUENTAS
# Leer los datos del archivo JSON
with open('seed/MOCK_DATA_CUENTAS.json', 'r') as archivo:
    datos = json.load(archivo)

# Generar las sentencias de inserción
fich = open('seed/MOCK_DATA_TIENEN.json', 'r')
datos_relacion = json.load(fich)
salida = open('postgres/MOCK_DATA_CUENTAS.sql', 'w')
for dato in datos:
    dnis = []
    f = dato['fechaCreacion'].split('T')
    fecha = f[0] + ' '
    hora = f[1].split('Z')
    fecha = fecha + hora[0]
    for relacion in datos_relacion:
        if relacion['IBAN'] == dato['IBAN']:
            # es esta cuenta
            dnis.append(relacion['DNI'])
    if len(dnis) > 0:
        if dato['tipoCuenta'] == "CORRIENTE":
            sentencia = "INSERT INTO cuentaCorriente (IBAN, fechaCreacion, saldo, tipoCuenta, oficina) VALUES ('" + dato['IBAN'] + "', TO_DATE('" + fecha + "', 'YYYY-MM-DD HH24:MI:SS'), " + str(dato['saldo']) + ", '" + dato['tipoCuenta'] + "', " + str(dato['oficina']) + ");\n"
        else:
            if dato['tipoCuenta'] == "AHORRO":
                sentencia = "INSERT INTO cuentaAhorro (IBAN, fechaCreacion, saldo, tipoCuenta, interes) VALUES ('" + dato['IBAN'] + "', TO_DATE('" + fecha + "', 'YYYY-MM-DD HH24:MI:SS'), " + str(dato['saldo']) + ", '" + dato['tipoCuenta'] + "', " + str(dato['interes']) + ");\n"
        salida.write(sentencia)
salida.close()
fich.close()
archivo.close()

# OPERACIONES
# Leer los datos del archivo JSON
with open('seed/MOCK_DATA_OPERACIONES.json', 'r') as archivo:
    datos = json.load(archivo)

# Generar las sentencias de inserción
salida = open('postgres/MOCK_DATA_OPERACIONES.sql', 'w')
for dato in datos:
    #if "'" in dato['descripcion']:
    #    dato['descripcion'] = dato['descripcion'].replace("'", "''")
    if dato['tipoOp'] == "TRANSFERENCIA":
        sentencia = "INSERT INTO transferencia (codigo, cantidad, fechaYHora, descripcion, cuentaEmisora, tipoOperacion, cuentaReceptora) VALUES ('" + dato['codigo'] + "', " + dato['cantidad'] + ", TO_DATE('" + dato['timestamp'] + "', 'YYYY-MM-DD HH24:MI:SS'), '" + str(dato['descripcion']) + "', '" + dato['cuentaEmisora'] + "', '" + dato['tipoOp'] + "', '" + dato['cuentaReceptora'] + "');\n"
    if dato['tipoOp'] == "INGRESO":
        sentencia = "INSERT INTO ingreso (codigo, cantidad, fechaYHora, descripcion, cuentaEmisora, tipoOperacion, oficina) VALUES ('" + dato['codigo'] + "', " + dato['cantidad'] + ", TO_DATE('" + dato['timestamp'] + "', 'YYYY-MM-DD HH24:MI:SS'), '" + str(dato['descripcion']) + "', '" + dato['cuentaEmisora'] + "', '" + dato['tipoOp'] + "', " + str(dato['oficina']) + ");\n"
    if dato['tipoOp'] == "RETIRADA":
        sentencia = "INSERT INTO retirada (codigo, cantidad, fechaYHora, descripcion, cuentaEmisora, tipoOperacion, oficina) VALUES ('" + dato['codigo'] + "', " + dato['cantidad'] + ", TO_DATE('" + dato['timestamp'] + "', 'YYYY-MM-DD HH24:MI:SS'), '" + str(dato['descripcion']) + "', '" + dato['cuentaEmisora'] + "', '" + dato['tipoOp'] + "', " + str(dato['oficina']) + ");\n"
    salida.write(sentencia)
salida.close()
archivo.close()