import json

# CLIENTES
# Leer los datos del archivo JSON
with open('../seed/MOCK_DATA_CLIENTES.json', 'r') as archivo_clientes:
    datos = json.load(archivo_clientes)

# Generar las sentencias de inserción
salida_clientes = open('MOCK_DATA_CLIENTES.sql', 'w')
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
    salida_clientes.write(sentencia)
salida_clientes.close()
archivo_clientes.close()

# CUENTAS
# Leer los datos del archivo JSON
with open('../seed/MOCK_DATA_CUENTAS.json', 'r') as archivo_cuentas:
    datos = json.load(archivo_cuentas)

lista_cuentas = []
# Generar las sentencias de inserción
fich = open('../seed/MOCK_DATA_TIENEN.json', 'r')
datos_relacion = json.load(fich)
salida_cuentas = open('MOCK_DATA_CUENTAS.sql', 'w')
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
        lista_cuentas.append(dato['IBAN'])
        if dato['tipoCuenta'] == "CORRIENTE":
            sentencia = "INSERT INTO cuenta (IBAN, fechaCreacion, saldo, tipoCuenta, interes, oficina) VALUES ('" + dato['IBAN'] + "', TO_DATE('" + fecha + "', 'YYYY-MM-DD HH24:MI:SS'), " + str(dato['saldo']) + ", '" + dato['tipoCuenta'] + "', null, " + str(dato['oficina']) + ");\n"
        else:
            if dato['tipoCuenta'] == "AHORRO":
                 sentencia = "INSERT INTO cuenta (IBAN, fechaCreacion, saldo, tipoCuenta, interes, oficina) VALUES ('" + dato['IBAN'] + "', TO_DATE('" + fecha + "', 'YYYY-MM-DD HH24:MI:SS'), " + str(dato['saldo']) + ", '" + dato['tipoCuenta'] + "', " + str(dato['interes']) + ", null);\n"
        salida_cuentas.write(sentencia)
salida_cuentas.close()
fich.close()
archivo_cuentas.close()

# OPERACIONES
# Leer los datos del archivo JSON
with open('../seed/MOCK_DATA_OPERACIONES.json', 'r') as archivo:
    datos = json.load(archivo)

# Generar las sentencias de inserción
salida = open('MOCK_DATA_OPERACIONES.sql', 'w')
indice_cuenta = 0
for dato in datos:
    if indice_cuenta > (len(lista_cuentas) - 2):
        indice_cuenta = 0
    cuentaEmisora = lista_cuentas[indice_cuenta]
    indice_cuenta = indice_cuenta + 1
    if dato['tipoOp'] == "TRANSFERENCIA":
        cuentaReceptora = lista_cuentas[indice_cuenta]
        indice_cuenta = indice_cuenta + 1
        sentencia = "INSERT INTO transferencia (codigo, cantidad, fechaYHora, descripcion, cuentaEmisora, tipoOperacion, cuentaReceptora) VALUES ('" + dato['codigo'] + "', " + dato['cantidad'] + ", TO_DATE('" + dato['timestamp'] + "', 'YYYY-MM-DD HH24:MI:SS'), '" + str(dato['descripcion']) + "', '" + cuentaEmisora + "', '" + dato['tipoOp'] + "', '" + cuentaReceptora + "');\n"
    if dato['tipoOp'] == "INGRESO":
        sentencia = "INSERT INTO ingreso (codigo, cantidad, fechaYHora, descripcion, cuentaEmisora, tipoOperacion, oficina) VALUES ('" + dato['codigo'] + "', " + dato['cantidad'] + ", TO_DATE('" + dato['timestamp'] + "', 'YYYY-MM-DD HH24:MI:SS'), '" + str(dato['descripcion']) + "', '" + cuentaEmisora + "', '" + dato['tipoOp'] + "', " + str(dato['oficina']) + ");\n"
    if dato['tipoOp'] == "RETIRADA":
        sentencia = "INSERT INTO retirada (codigo, cantidad, fechaYHora, descripcion, cuentaEmisora, tipoOperacion, oficina) VALUES ('" + dato['codigo'] + "', " + dato['cantidad'] + ", TO_DATE('" + dato['timestamp'] + "', 'YYYY-MM-DD HH24:MI:SS'), '" + str(dato['descripcion']) + "', '" + cuentaEmisora + "', '" + dato['tipoOp'] + "', " + str(dato['oficina']) + ");\n"
    salida.write(sentencia)
salida.close()
archivo.close()