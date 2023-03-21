INSERT INTO oficina(codigo, telefono, direccion) VALUES (245, '+34 202-141-948', '7 Anhalt Place');
/

(SELECT CAST(COLLECT(REF(t)) AS tipoTitulares) FROM cliente t WHERE t.DNI = '05215912L' OR t.DNI = '42291455M' OR t.DNI = '27195146E');
/

INSERT INTO cuenta (IBAN, fechaCreacion, saldo, tipo, refCliente) VALUES ('CH50 5682 234S RJST SUTP Z', TO_DATE('1989-11-11 14:24:42', 'YYYY-MM-DD HH24:MI:SS'), 145826.21, 'CORRIENTE', (SELECT CAST(COLLECT(REF(t)) AS tipoTitulares) FROM cliente t WHERE t.DNI = '05215912L' OR t.DNI = '42291455M' OR t.DNI = '27195146E'));
/
