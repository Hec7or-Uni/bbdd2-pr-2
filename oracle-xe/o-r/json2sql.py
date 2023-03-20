import json

# OFICINA
# Leer los datos del archivo JSON
with open('data/json/oficina.json', 'r') as archivo:
    datos = json.load(archivo)

# Generar las sentencias de inserción
salida = open('oracle-xe/o-r/insert-oficina.sql', 'w')
for dato in datos:
    fich = open('data/json/entidad.json', 'r')
    ent = json.load(fich)
    entidad_codPais = ""
    entidad_codId = ""
    for e in ent:
        if e['id'] == dato['idEntidad']:
            entidad_codPais = e['codPais']
            entidad_codId = e['codId']
            break
    sentencia = "INSERT INTO oficina (codigo, telefono, direccion, refEntidad) VALUES (" + str(dato['codigo']) + ", '" + dato['telefono'] + "', '" + dato['direccion'] + "', entidadUdt(" + str(dato['idEntidad']) + ", '" + entidad_codPais + "', '" + entidad_codId + "'));\n"
    salida.write(sentencia)
salida.close()

