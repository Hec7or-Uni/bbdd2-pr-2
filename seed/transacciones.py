import random
import datetime
import json
import time
import uuid


def getDate(start="1/1/1970 1:30 PM", end="3/20/2023 4:50 AM", time_format='%m/%d/%Y %I:%M %p', prop=random.random()):
    stime = time.mktime(time.strptime(start, time_format))
    etime = time.mktime(time.strptime(end, time_format))

    ptime = stime + prop * (etime - stime)

    return datetime.datetime.fromtimestamp(ptime).isoformat()[:19].replace('T', ' ')


with open("MOCK_DATA_CUENTAS.json", "r") as f:
    cuentas = json.load(f)
    cuentas = [cuenta["IBAN"] for cuenta in cuentas]
    f.close()

lista = []
data = {}
for i in range(10000):
    data["codigo"] = str(uuid.uuid4())
    data["cantidad"] = "{:.3f}".format(random.uniform(0, 25000))
    data["timestamp"] = getDate()
    data["descripcion"] = "null"
    data["tipoOp"] = random.choice(["INGRESO", "RETIRADA", "TRANSFERENCIA"])
    data["cuentaEmisora"] = random.choice(cuentas)
    if data["tipoOp"] == "TRANSFERENCIA":
        data["oficina"] = "null"
        data["cuentaReceptora"] = random.choice(cuentas)
        while data["cuentaEmisora"] == data["cuentaReceptora"]:
            data["cuentaReceptora"] = random.choice(cuentas)

    else:
        data["oficina"] = 245
        data["cuentaReceptora"] = "null"

    lista.append(data)

print(lista)
with open("MOCK_DATA_OPERACIONES.json", "w") as f:
    json.dump(lista, f, indent=4)
    f.close()
