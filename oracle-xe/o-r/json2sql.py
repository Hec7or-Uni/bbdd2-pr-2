import json

# CLIENTES
# Leer los datos del archivo JSON
with open('seed/MOCK_DATA_CLIENTES.json', 'r') as archivo:
    datos = json.load(archivo)

# Generar las sentencias de inserción
salida = open('oracle-xe/o-r/MOCK_DATA_CLIENTES.sql', 'w')
for dato in datos:
    if "'" in dato['apellido']:
        dato['apellido'] = dato['apellido'].replace("'", "''")
    if "'" in dato['nombre']:
        dato['nombre'] = dato['nombre'].replace("'", "''")
    sentencia = "INSERT INTO cliente (DNI, nombre, apellido, email, telefono, fechaNacimiento, direccion, edad) VALUES ('" + dato['DNI'] + "', '" + dato['nombre'] + "', '" + dato['apellido'] + "', '" + str(dato['email']) + "', '" + dato['telefono'] + "', '" + dato['fechaNacimiento'] + "', '" + dato['direccion'] + "', " + str(dato['edad']) + ");\n"
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
salida = open('oracle-xe/o-r/MOCK_DATA_CUENTAS.sql', 'w')
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
            sentencia = "INSERT INTO cuenta VALUES (cuentaCorrienteUdt('" + dato['IBAN'] + "', TO_DATE('" + fecha + "', 'YYYY-MM-DD HH24:MI:SS'), " + str(dato['saldo']) + ", '" + dato['tipoCuenta'] + "', (SELECT CAST(COLLECT(REF(t)) AS tipoTitulares) FROM cliente t WHERE "
            while len(dnis) > 0:
                sentencia = sentencia + "t.DNI = '" + dnis[0] + "'"
                dnis.remove(dnis[0])
                if len(dnis) > 0:
                    sentencia = sentencia + " OR "
            sentencia = sentencia + "), (SELECT REF(o) FROM oficina o WHERE o.codigo = " + str(dato['oficina']) + ")));\n"
        else:
            if dato['tipoCuenta'] == "AHORRO":
                sentencia = "INSERT INTO cuenta VALUES (cuentaAhorroUdt('" + dato['IBAN'] + "', TO_DATE('" + fecha + "', 'YYYY-MM-DD HH24:MI:SS'), " + str(dato['saldo']) + ", '" + dato['tipoCuenta'] + "', (SELECT CAST(COLLECT(REF(t)) AS tipoTitulares) FROM cliente t WHERE "
            while len(dnis) > 0:
                sentencia = sentencia + "t.DNI = '" + dnis[0] + "'"
                dnis.remove(dnis[0])
                if len(dnis) > 0:
                    sentencia = sentencia + " OR "
            sentencia = sentencia + "), " + str(dato['interes']) + "));\n"
        salida.write(sentencia)
salida.close()
fich.close()
archivo.close()


# UPDATE CLIENTES
# Leer los datos del archivo JSON
with open('seed/MOCK_DATA_TIENEN.json', 'r') as archivo:
    datos = json.load(archivo)

# Generar las sentencias de inserción
salida = open('oracle-xe/o-r/MOCK_DATA_UPDATE_CLIENTES.sql', 'w')
for dato in datos:
    sentencia = "UPDATE cliente SET refCuenta = (SELECT CAST(COLLECT(REF(c)) AS tipoCuentas) FROM cuenta c WHERE c.IBAN = '" + dato['IBAN'] + "') WHERE DNI = '" + dato['DNI'] + "';\n"
    salida.write(sentencia)
salida.close()
archivo.close()