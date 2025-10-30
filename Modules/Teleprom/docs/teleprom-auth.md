# API Reference Teleprom

Documentacion API de servicios de Teleprom.

**AUTHORIZATION:** Bearer Token

---

## API Integración de WhatsApp

En la siguiente documentación encontrarán los métodos necesarios para realizar la autentificación con nuestra plataforma y luego realizar los envios a través de una integración via API en diversos lenguajes.

### Antes de empezar

Es necesario contar con una cuenta activa y un usuario con su constraseña. La misma será otorgada por su asesor comercial.

### Cómo empezar

Para realizar cualquier request debe enviar en el HEADER HTTP una clave de la forma: `Authorization: Bearer yJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...` donde el token es obtenido a través del endpoint de Autentificación.

Puede visualizar ejemplos haciendo click en "Run in Postman" en la esquina superior derecha y luego abriendo la documentación con Postman.

Para realizar un envío deberá seguir los siguientes pasos:

1. Realizar la autentificación y guardar el token de la misma (Revisar endpoint 1).
2. Con el token obtenido del paso 1, obtener las cuentas (de WhatsApp) y las plantillas asociadas a su cuenta (revisar endpoints 3 y 4).
3. Una vez que tenga los identificadores de plantilla y cuentas, podrá realizar la Integración (revisar endpoint 2).
4. Luego de realizar la Integración recibirá callbacks (notificaciones de envío) con los estados de cada uno de sus envíos realizados.

**Nota:** Si usted ya conoce la información obtenida en el paso 2, no es necesario que los vuelva obtener ya que los identificadores de las cuentas y las plantillas son únicos y permanentes.

---

## API Reference WhatsApp

**AUTHORIZATION:** Bearer Token

### POST 1. Autentificación

**URL:** `https://mayten.cloud/Auth`

#### Descripción

Este método será utilizado para realizar la autentificación de su cuenta con nuestro sistema.

Usted contará con un usuario `username` y una contraseña `password` para hacer el login. Como respuesta, obtendrá un JSON con el formato que se muestra en el ejemplo:

**Nota:** A los fines prácticos el token ha sido recortado.

```json
{
  "token": "****",
  "expires": "2022-05-06T14:35:25.1723881-03:00",
  "passwordState": "Ok"
}
```

El token obtenido deberá utilizarlo en cada petición enviándolo como HEADER HTTP de la forma: `Authorization: Bearer yJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9......`

Tener en cuenta que la validez del token es de 24 hs desde que se loguea. Si se vuelve a solicitar dentro de la ventana de 24 hs, el token y el expires devueltos serán los mismos.

**Ejemplo:** Si realiza el login a las 15:05 hs y una segunda vez a las 20:30 hs obtendrá en ambos casos el mismo token y expires.

Una vez transcurridas las 24 hs, el token se vence y debe solicitar uno nuevo mediante un login.

Si el token está vencido y lo utiliza para realizar alguna integración, obtendrá como respuesta `401 Unauthorized`.

El campo `passwordState` indica si la contraseña está vencida (Expired), pronta a vencer (ExpiresSoon), o es válida (Ok).

#### AUTHORIZATION

Bearer Token

#### HEADERS

- Content-Type: `application/json`

#### Body

```json
{
  "username": "",
  "password": "•••••••"
}
```

#### Example Request (Success)

```bash
curl --location 'https://mayten.cloud/Auth' \
--header 'Content-Type: application/json' \
--data '{
    "username": "someuser",
    "password": "somepassword"
}'
```

#### Example Response (200 OK)

```json
{
  "token": "***",
  "expires": "2022-05-06T14:35:25.1723881-03:00",
  "passwordState": "Ok"
}
```
