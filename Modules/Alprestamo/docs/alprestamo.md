# Integración API Referidos AR

## Manual de Referencia para desarrollar una API según el modelo de integración modelo de Alprestamo

## Índice

- [Índice](#índice)
- [Glosario](#glosario)
- [Flujo End to End](#flujo-end-to-end-alprestamo--cliente)
- [General](#general)
- [Servicio REST API](#servicio-rest-api)
- [Autenticación](#autenticación)
- [Método: RiskEvaluation](#método-riskevaluation)
    - [Request](#request)
    - [Response](#response)
- [Método: UpdateContactInformation](#método-updatecontactinformation)
    - [Request](#request-1)
    - [Response](#response-1)
- [Postback](#postback)
- [Version Control](#version-control)

## Glosario

| Término | Definición                                                                   |
|---------|------------------------------------------------------------------------------|
| Cliente | Institución financiera que realiza la integración con Alprestamo.            |
| Usuario | Persona que navega el sitio de Alprestamo y solicita un producto financiero. |

### Flujo End to End (Alprestamo & Cliente)

El usuario entra al portal de Alprestamo donde tiene que llenar el cuestionario con sus datos personales (nombre,
apellido paterno, DNI, género, fecha de nacimiento, situación laboral, correo electrónico y número celular).

**Ambiente de producción:** https://alprestamo.ar/  
**Ambiente de testing:** https://sandbox.alprestamo.ar/

Una vez que el usuario completa el formulario, se aplican reglas duras de segmentación para ver si el usuario califica
según reglas previamente establecidas con el cliente.

Si cumple con el perfil, finalmente se realiza la conexión API de dos pasos hacia el cliente. En función de la respuesta
del primer paso, se muestra la Oferta en la página de ofertas o termina la conexión para ese usuario.

En la página de ofertas, únicamente se muestran ofertas APROBADAS que tiene el usuario. Una vez que un usuario elige una
oferta, el mismo es redireccionado al onboarding del lender con los datos precargados vía API.

El usuario continuará en el onboarding del cliente hasta terminar la solicitud del crédito. Una vez realizada la
operación, el cliente podrá informar a Alprestamo vía API qué monto se otorgó, cantidad de cuotas y demás detalles del
préstamo otorgado.

## General

El presente documento describe las recomendaciones de Alprestamo que el Cliente podrá tomar como referencia para la
implementación de un API propietario en sus sistemas, con el cual Alprestamo podrá enlazarse para mejorar los flujos,
conversiones y experiencia del Usuario.

El esquema consiste en un API de 2 pasos, de la siguiente manera:

- **PASO 1**: Alprestamo envía una primera petición al momento de la evaluación de un usuario que ingresa al sitio. En
  el paquete de información se envían los datos generales de la persona (DNI, nombre y apellido, fecha de nacimiento,
  género y situación laboral) con los cuales el Cliente deberá realizar una primera evaluación de riesgo y determinar
  si (i) Pre-aprueba o (ii) Rechaza al Usuario.

- **PASO 2**: Si la respuesta de evaluación de riesgo es pre-aprobatoria, entonces Alprestamo envía una segunda petición
  con la cual se comparten los datos de contacto del Usuario para alimentar los registros internos del Cliente.

Se recomienda generar dos ambientes independientes entre sí: (i) Ambiente de Pruebas/Sandbox, y (ii) Ambiente
Productivo.

## Servicio REST API

Se recomienda la implementación de un servicio de tipo REST API sobre HTTP/HTTPS, utilizando codificación JSON para el
envío y recepción de información.

Las peticiones serán disparadas por los motores de Alprestamo mediante peticiones HTTP POST, con el contenido dentro del
body de la petición codificado en JSON.

Las peticiones deberán ser autenticadas por el Cliente antes de ser procesadas e ingresadas a sus sistemas.

A continuación se describen las recomendaciones y pautas de Alprestamo para la implementación de los servicios del
Cliente.

## Autenticación

La opción recomendada y más sencilla es mediante la implementación de un Token alfanumérico el cual se envía por medio
de un HTTP Header dentro de cada petición.

Por convención, este Header debería de llevar el nombre `x-api-key` y dentro de cada petición se enviaría de la
siguiente manera:

```
x-api-key: {token}
```

| Nombre | Tipo   | Descripción                                                                   |
|--------|--------|-------------------------------------------------------------------------------|
| Token  | string | ID único de autenticación para permitirle a Alprestamo hacer las solicitudes. |

## Método: RiskEvaluation

Esta petición se envía como un primer paso con la cual el Cliente podrá analizar la información del Usuario y
determinar, de acuerdo a sus políticas internas de riesgo, si éste puede ser Pre-aprobado y permitirle continuar con el
flujo para recibir una oferta.

**Método:** HTTP Post  
**Endpoint:** https://client.com/api/risk-evaluation

### Request

Lista de variables disponibles para armar el payload en función de requerimientos del cliente:

| Nombre             | Tipo   | Descripción                                                                                    |
|--------------------|--------|------------------------------------------------------------------------------------------------|
| National_id        | string | DNI                                                                                            |
| First_name         | string | Nombre                                                                                         |
| Paternal_last_name | string | Apellido Paterno                                                                               |
| Gender             | string | Género: "F" para femenino, "M" para masculino                                                  |
| Date_of_birth      | string | Fecha de nacimiento en formato YYYY-MM-DD                                                      |
| Employment_status  | string | Situación laboral del usuario: empleado, empleado del gobierno, trabajador independiente, etc. |
| Tracking_id        | string | Código identificador del lead.                                                                 |

La definición del catálogo de `employment_status` deberá ser definido por el Cliente de acuerdo a sus clasificaciones
internas.

Ejemplo de Request Body en JSON con algunos campos:

```json
{
    "national_id": "38788807",
    "first_name": "tomas",
    "last_name": "perez",
    "gender": "M",
    "date_of_birth": "1980-04-27",
    "employment_status": "E",
    "tracking_id": "nf39d39dm30md"
}
```

### Response

| Nombre           | Tipo   | Descripción                                                                                                                                                                              |
|------------------|--------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| status           | string | Resultado de la operación: `preapproved` la solicitud del Usuario fue pre-aprobada, `rejected` la solicitud del Usuario fue rechazada, `error` ocurrió un error en la operación          |
| error_code       | string | Opcional. Código de error en caso de haber ocurrido alguno.                                                                                                                              |
| error_message    | string | Opcional. Mensaje de detalle del error en caso de haber ocurrido alguno.                                                                                                                 |
| customer_id      | string | Opcional, en caso de respuesta Pre-aprobada. ID único que identifica al Usuario dentro del sistema del Cliente, será utilizada en el segundo paso del API para referenciar la solicitud. |
| redirect_url     | string | Opcional. URL a la cual redirigir al usuario para concluir su proceso de onboarding.                                                                                                     |
| offer_max_amount | float  | Opcional, en caso de respuesta Pre-aprobada. Monto máximo que pudiera ser otorgado al Usuario                                                                                            |
| payment_amount   | float  | Opcional, en caso de respuesta Pre-aprobada. Monto a pagar por cuota                                                                                                                     |
| payment_term     | int    | Opcional, en caso de respuesta Pre-aprobada. Números de cuotas.                                                                                                                          |
| reject_reason    | string | Opcional, en caso de respuesta Rechazada. Motivo del rechazo.                                                                                                                            |

Ejemplo de respuesta Pre-Aprobada:

```json
{
    "status": "preapproved",
    "customer_id": "123456",
    "redirect_url": "https://client.com/onboarding/123456",
    "offer_max_amount": 50000.00,
    "payment_amount": 5000.00,
    "payment_term": 12
}
```

Ejemplo de respuesta Rechazada:

```json
{
    "status": "rejected",
    "reject_reason": "No cumple con los requisitos mínimos"
}
```

Ejemplo de respuesta con Error:

```json
{
    "status": "error",
    "error_code": "500",
    "error_message": "Error interno del servidor"
}
```

## Método: UpdateContactInformation

Esta petición se envía en un segundo paso sólo cuando la respuesta del primer paso es Pre-Aprobatorio, y se utiliza para
complementar la información de contacto del Usuario en los sistemas del Cliente para que pueda continuar el flujo de
otorgamiento del producto financiero.

**Método:** HTTP Post  
**Endpoint:** https://client.com/api/update-contact

### Request

| Nombre       | Tipo   | Descripción                                                                                                           |
|--------------|--------|-----------------------------------------------------------------------------------------------------------------------|
| customer_id  | string | ID único que identifica al Usuario en el sistema del Cliente. Será el mismo valor que fue recibido en el primer paso. |
| email        | string | Email de contacto del Usuario                                                                                         |
| phone_number | string | Teléfono celular de contacto del Usuario                                                                              |

Ejemplo de Request Body en JSON:

```json
{
    "customer_id": "123456",
    "email": "usuario@ejemplo.com",
    "phone_number": "+541112345678"
}
```

### Response

| Nombre        | Tipo   | Descripción                                                                                                          |
|---------------|--------|----------------------------------------------------------------------------------------------------------------------|
| status        | string | Resultado de la operación: `success` la actualización de datos fue exitosa, `error` ocurrió un error en la operación |
| error_code    | string | Opcional. Código de error en caso de haber ocurrido alguno.                                                          |
| error_message | string | Opcional. Mensaje de detalle del error en caso de haber ocurrido alguno.                                             |
| redirect_url  | string | Opcional. URL a la cual redirigir al usuario para concluir su proceso de onboarding.                                 |

Ejemplo de respuesta Exitosa:

```json
{
    "status": "success",
    "redirect_url": "https://client.com/onboarding/123456"
}
```

Ejemplo de respuesta con Error:

```json
{
    "status": "error",
    "error_code": "400",
    "error_message": "Datos de contacto inválidos"
}
```

## Postback

*Sección pendiente de documentar.*

## Version Control

| Version | Author                                                                                           | Comments                          |
|---------|--------------------------------------------------------------------------------------------------|-----------------------------------|
| 1.0     | Edmundo Fuentes <edmundo@alprestamo.com>                                                         | Initial publish                   |
| 1.1     | Edmundo Fuentes <edmundo@alprestamo.com>                                                         | Updating endpoint paths and texts |
| 1.2     | Edmundo Fuentes <edmundo@alprestamo.com>                                                         | Adding optional data fields       |
| 1.3     | Luciano Della Savia <luciano.dellasavia@alprestamo.com>                                          | Adding required body parameters   |
| 1.4     | Santiago Peralta <santiago.peralta@alprestamo.com><br>Agustin Ryan <agustin.ryan@alprestamo.com> | New documentation                 |

---

Alprestamo 2022. Todos los derechos reservados. Propietario y confidencial.

