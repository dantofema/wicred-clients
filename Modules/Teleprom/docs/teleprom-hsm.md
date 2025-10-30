# API Reference Teleprom

Documentación completa de los servicios API de Teleprom para integración con WhatsApp.

**AUTHORIZATION:** Bearer Token

---

## Tabla de Contenidos

1. [Autentificación](#1-autentificación)
2. [Integración HSM](#2-integración-hsm)
3. [Consultar Cuentas](#3-consultar-cuentas)
4. [Consultar Plantillas](#4-consultar-plantillas)

---

## 1. Autentificación

**Método:** POST  
**URL:** `https://mayten.cloud/Auth`

### Descripción

Este método será utilizado para realizar la autentificación de su cuenta con nuestro sistema.

Usted contará con un usuario `username` y una contraseña `password` para hacer el login. Como respuesta, obtendrá un JSON con el token de autenticación.

**Nota:** A los fines prácticos el token ha sido recortado.

### Headers

- `Content-Type`: `application/json`

### Request Body

```json
{
  "username": "",
  "password": "•••••••"
}
```

### Response (200 OK)

```json
{
  "token": "****",
  "expires": "2022-05-06T14:35:25.1723881-03:00",
  "passwordState": "Ok"
}
```

### Notas Importantes

- El token obtenido deberá utilizarlo en cada petición enviándolo como HEADER HTTP: `Authorization: Bearer yJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...`
- La validez del token es de 24 horas desde que se loguea
- Si se vuelve a solicitar dentro de la ventana de 24 hs, el token y el expires devueltos serán los mismos
- Una vez transcurridas las 24 hs, el token se vence y debe solicitar uno nuevo
- Si el token está vencido obtendrá como respuesta `401 Unauthorized`
- El campo `passwordState` indica si la contraseña está vencida (Expired), pronta a vencer (ExpiresSoon), o es válida (Ok)

### Example Request

```bash
curl --location 'https://mayten.cloud/Auth' \
--header 'Content-Type: application/json' \
--data '{
    "username": "someuser",
    "password": "somepassword"
}'
```

---

## 2. Integración HSM

**Método:** POST  
**URL:** `https://mayten.cloud/api/Integration/MessageWpp`

### Descripción

Este método se utiliza para realizar la integración y el envío de mensajes a través de WhatsApp utilizando plantillas HSM (Highly Structured Messages).

### Authorization

Bearer Token

```
Authorization: Bearer yJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

### Headers

- `Content-Type`: `application/json`
- `Authorization`: `Bearer {token}`

### Request Body Structure

El JSON de integración debe tener los siguientes campos:

#### Campos Principales

- **`hsmId`** (integer): Identificador numérico asociado a su HSM y a la cuenta
- **`sourceId`** (integer): Identificador propio de la cuenta de WhatsApp desde la cual se realizarán los envíos

**Nota:** Cada HSM está asociado a la cuenta en la que se creó la plantilla.

#### Destinations

**`destinations`** (array): Lista de destinos a los cuales se enviará el HSM especificado

Cada elemento de `destinations` contiene:

- **`trackingNumber`** (string, opcional): Identificador para realizar un seguimiento del envío
- **`dstNumber`** (string, requerido): Número de teléfono del contacto en formato E.123 (ej: `5493516723999`)
- **`hsmParams`** (array of strings): Lista de parámetros del HSM ordenados
- **`internalParams`** (array of strings, opcional): Lista de parámetros no visibles en conversaciones. Útil para identificadores y datos personalizados visibles en sábanas
- **`chatParams`** (array of strings, opcional): Lista de parámetros visibles en conversaciones. Pueden usarse en las interacciones con bots o agentes

### Request Body Example

```json
{
  "messages": [
    {
      "sourceId": 5,
      "hsmId": 10,
      "destinations": [
        {
          "trackingNumber": "645564456",
          "dstNumber": "5493516723999",
          "hsmParams": [
            "13"
          ],
          "internalParams": [
            "111111111"
          ],
          "chatParams": [
            "client"
          ]
        },
        {
          "trackingNumber": "564548",
          "dstNumber": "5493516724000",
          "hsmParams": [
            "14"
          ],
          "internalParams": [
            "111111111"
          ],
          "chatParams": [
            "client"
          ]
        }
      ]
    },
    {
      "sourceId": 6,
      "hsmId": 11,
      "destinations": [
        {
          "trackingNumber": "645564457",
          "dstNumber": "5493516724001",
          "hsmParams": [
            "15"
          ],
          "internalParams": [
            "111111111"
          ],
          "chatParams": [
            "client"
          ]
        },
        {
          "trackingNumber": "564549",
          "dstNumber": "5493516724002",
          "hsmParams": [
            "16"
          ],
          "internalParams": [
            "111111111"
          ],
          "chatParams": [
            "client"
          ]
        }
      ]
    }
  ]
}
```

### Response Structure

La respuesta de la integración será un JSON con el siguiente formato:

```json
{
  "responses": [
    {
      "trackingNumber": "645564456",
      "messageId": "a8bc2294-5164-459d-9035-42366aa3d5a9",
      "status": "OK"
    },
    {
      "trackingNumber": "564548",
      "messageId": "d1fac407-1a23-453e-b65f-fb8cf0d748d6",
      "status": "OK"
    }
  ],
  "trackUuid": "4f195c43-80a4-4b51-8d00-4e4204076440"
}
```

#### Campos de Respuesta

- **`responses`** (array): Lista de respuestas que incluye:
  - **`trackingNumber`**: El mismo trackingNumber del JSON de integración
  - **`messageId`**: Identificador de cada destino para uso interno
  - **`status`**: Estado de la integración del destino
- **`trackUuid`**: Identificador de la integración que podrá ser utilizado para trackear los envíos

### Advertencias Importantes

#### Sobre hsmParams

- Si la lista `hsmParams` tiene más parámetros de los indicados en el HSM, solo serán tenidos en cuenta los primeros hasta completar el número de parámetros aprobados, el resto se enviará vacío
- **Ejemplo:** Si se tiene un HSM con 4 parámetros:
  - Se envían 6 parámetros → solo se reemplazarán los primeros 4
  - Se envían 2 parámetros → solo se reemplazarán los primeros 2
- Si la lista de `hsmParams` contiene algún parámetro con salto de línea, este será borrado antes de enviar el mensaje ya que WhatsApp no acepta estos caracteres. En ese caso, el status devolverá `"OK, with line break"`

### Example cURL Request

```bash
curl --location 'https://mayten.cloud/api/Integration/MessageWpp' \
--header 'Authorization: Bearer yJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...' \
--header 'Content-Type: application/json' \
--data '{
  "messages": [
    {
      "sourceId": 5,
      "hsmId": 10,
      "destinations": [
        {
          "trackingNumber": "645564456",
          "dstNumber": "5493516723999",
          "hsmParams": [
            "13"
          ],
          "internalParams": [
            "111111111"
          ],
          "chatParams": [
            "client"
          ]
        },
        {
          "trackingNumber": "564548",
          "dstNumber": "5493516724000",
          "hsmParams": [
            "14"
          ],
          "internalParams": [
            "111111111"
          ],
          "chatParams": [
            "client"
          ]
        }
      ]
    },
    {
      "sourceId": 6,
      "hsmId": 11,
      "destinations": [
        {
          "trackingNumber": "645564457",
          "dstNumber": "5493516724001",
          "hsmParams": [
            "15"
          ],
          "internalParams": [
            "111111111"
          ],
          "chatParams": [
            "client"
          ]
        },
        {
          "trackingNumber": "564549",
          "dstNumber": "5493516724002",
          "hsmParams": [
            "16"
          ],
          "internalParams": [
            "111111111"
          ],
          "chatParams": [
            "client"
          ]
        }
      ]
    }
  ]
}'
```

### Example Response (200 OK)

```json
{
  "responses": [
    {
      "trackingNumber": "645564456",
      "messageId": "a8bc2294-5164-459d-9035-42366aa3d5a9",
      "status": "OK"
    },
    {
      "trackingNumber": "564548",
      "messageId": "d1fac407-1a23-453e-b65f-fb8cf0d748d6",
      "status": "OK"
    }
  ],
  "trackUuid": "4f195c43-80a4-4b51-8d00-4e4204076440"
}
```

---

## 3. Consultar Cuentas

_(Pendiente de documentación)_

---

## 4. Consultar Plantillas

_(Pendiente de documentación)_

---

## Flujo de Integración Recomendado

Para realizar un envío deberá seguir los siguientes pasos:

1. **Realizar la autentificación** y guardar el token (ver [Autentificación](#1-autentificación))
2. **Obtener las cuentas** de WhatsApp y las plantillas asociadas a su cuenta (ver endpoints 3 y 4)
3. **Realizar la Integración** con los identificadores de plantilla y cuentas (ver [Integración HSM](#2-integración-hsm))
4. **Recibir callbacks** (notificaciones de envío) con los estados de cada uno de sus envíos realizados

**Nota:** Si usted ya conoce la información obtenida en el paso 2, no es necesario que los vuelva a obtener ya que los identificadores de las cuentas y las plantillas son únicos y permanentes.

---

## Notas Adicionales

### Antes de Empezar

Es necesario contar con:

- Una cuenta activa en la plataforma
- Un usuario con su contraseña (otorgada por su asesor comercial)
- Identificadores de cuentas WhatsApp (sourceId)
- Identificadores de plantillas HSM (hsmId)

### Formato de Números de Teléfono

Todos los números de teléfono deben utilizar el formato E.123:

- Incluir código de país
- Sin espacios, guiones ni paréntesis
- Ejemplo: `5493516723999` (Argentina)

### Manejo de Errores

- **401 Unauthorized**: Token vencido o inválido. Debe autenticarse nuevamente
- **400 Bad Request**: Revise el formato del JSON y los parámetros requeridos
- **500 Internal Server Error**: Error del servidor. Contacte a soporte técnico
