# Inventario de servidores y ambiente

**Propósito:** entregable para Seguridad Informática con resumen de hosts, roles, IPs y recomendaciones. No contiene
contraseñas.

## Producción — Frontend

- legacy-prod-front-clientes — 192.168.44.4 — Front (Clientes)
- legacy-prod-front-clientes — 192.168.44.5 — Front  (Clientes)
- legacy-prod-front-admin — 192.168.44.6 — Front (Admin)
- legacy-prod-front-admin — 192.168.44.7 — Front  (Admin)

## Producción — Backend

- legacy-prod-back-clientes — 192.168.44.8 — Backend (Clientes)
- legacy-prod-back-clientes — 192.168.44.9 — Backend  (Clientes)
- legacy-prod-control-gestion — 192.168.44.19 — Servicio backend (Control/Gestión)
- legacy-prod-medios-pago — 192.168.181.2 — Servicio medios de pago

## Producción — Infra

- legacy-prod-database (master) — 192.168.44.12 — Base de datos (master)
- legacy-prod-database-slave — 192.168.44.13 — Base de datos (slave)
- legacy-prod-storage — 192.168.44.14 — Almacenamiento / NFS
    - NFS compartido: `/filer/whtml`
    - Segmento de red: `192.168.44.1/26`
- legacy-prod-banner — 192.168.44.15 — Banner / otros servicios

### Entradas a verificar

- legacy-prod-desconocido-1 — 192.168.44.16 — propósito por confirmar
- legacy-prod-desconocido-2 — 192.168.44.180 — propósito por confirmar

## Entorno de pruebas (test)

- legacy-test-back-admin — 192.168.44.54 — Backend (Admin)
- legacy-test-back-clientes — 192.168.44.52 — Backend (Clientes)
- legacy-test-front-admin — 192.168.44.53 — Front (Admin)
- legacy-test-front-clientes — 192.168.44.51 — Front (Clientes)
- legacy-test-db — 192.168.44.57 — Base de datos de test
- legacy-test-storage — 192.168.44.56 — Almacenamiento de test

```
