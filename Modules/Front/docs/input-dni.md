# Input DNI

## Check

### 1. Chequear si tiene un prestamo

- Si el prestamo está activo no se puede solicitar un nuevo prestamo
    - Query a consultas y cta cte
- Si el prestamo está saldado puede continuar (como RENOVADOR)
    - Query a cta cte

### 2. Si es cliente de Telecentro

- Query a tabla (tenemos un endpoint para consultar si es cliente o no)

### 3. Buscar en el padron

- Query a people_registers

