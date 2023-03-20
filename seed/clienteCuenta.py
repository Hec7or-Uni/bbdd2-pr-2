import json
import random

with open("MOCK_DATA_CUENTAS.json", "r") as f:
    cuentas = json.load(f)
    cuentas = [cuenta["IBAN"] for cuenta in cuentas]
    f.close()

with open("MOCK_DATA_CLIENTES.json", "r") as f:
    clientes = json.load(f)
    clientes = [cliente["DNI"] for cliente in clientes]
    f.close()

data = {}
lista = []
for i in range(1000):
    shared = []
    cuenta = random.choice(cuentas)

    for j in range(random.randint(1, 4)):
        cliente = random.choice(clientes)

        while cliente in shared:
            cliente = random.choice(cliente)

        data["DNI"] = cliente
        data["IBAN"] = cuenta
        shared.append(cliente)
        lista.append(data.copy())
    shared = []

with open("MOCK_DATA_TIENEN.json", "w") as f:
    json.dump(lista, f, indent=4)
    f.close()
