### ER simple para el módulo Alprestamo

El siguiente diagrama ER resume las entidades y relaciones necesarias para cubrir los casos del documento adjunto:
autenticación por `x-api-key`, POST `RiskEvaluation` (request/response), POST `UpdateContactInformation` (
request/response), y un posible `Postback` futuro. Incluye los campos indicados en la documentación y muestra cómo se
encadenan ambos pasos cuando la evaluación es `preapproved`.

```puml
@startuml
hide circle
skinparam linetype ortho
skinparam class {
  BackgroundColor White
  BorderColor #999
}
' Opcional: tema claro
' !theme plain

entity "Lead" as Lead {
  *tracking_id : string <<PK>>
  national_id : string
  first_name : string
  last_name : string
  gender : string  ' "F" o "M"
  date_of_birth : date  ' YYYY-MM-DD
  employment_status : string  ' catálogo definido por el cliente
  created_at : datetime
}

entity "RiskEvaluationRequest" as RiskEvalReq {
  *id : uuid <<PK>>
  tracking_id : string <<FK Lead.tracking_id>>
  sent_at : datetime
}

entity "RiskEvaluationResponse" as RiskEvalRes {
  *id : uuid <<PK>>
  request_id : uuid <<FK RiskEvalReq.id>>
  status : enum('preapproved','rejected','error')
  error_code : string
  error_message : string
  customer_id : string  ' provisto sólo si preapproved
  redirect_url : string
  offer_max_amount : decimal(15,2)
  payment_amount : decimal(15,2)
  payment_term : int
  reject_reason : string
  received_at : datetime
}

entity "Customer" as Customer {
  *customer_id : string <<PK>>
  origin_tracking_id : string <<FK Lead.tracking_id>>
  created_at : datetime
}

entity "ContactUpdateRequest" as ContactReq {
  *id : uuid <<PK>>
  customer_id : string <<FK Customer.customer_id>>
  email : string
  phone_number : string
  sent_at : datetime
}

entity "ContactUpdateResponse" as ContactRes {
  *id : uuid <<PK>>
  request_id : uuid <<FK ContactReq.id>>
  status : enum('success','error')
  error_code : string
  error_message : string
  redirect_url : string
  received_at : datetime
}

entity "Postback" as Postback {
  *id : uuid <<PK>>
  customer_id : string <<FK Customer.customer_id>>
  granted_amount : decimal(15,2)
  payment_term : int
  disbursed_at : datetime
  notes : string
}

' Relaciones principales del flujo
Lead ||--o{ RiskEvalReq : "genera"
RiskEvalReq ||--|| RiskEvalRes : "tiene"

' Si status = preapproved, se crea/usa el Customer en el sistema del cliente
RiskEvalRes }o--|| Customer : "crea/usa (si preapproved)"
Customer ||--o{ ContactReq : "recibe"
ContactReq ||--|| ContactRes : "tiene"

' Postback futuro del cliente a Alprestamo
Customer ||--o{ Postback : "notifica (opcional)"

@enduml
```

### Correspondencia con el documento

- Paso 1 `RiskEvaluation`:
    - Request: se modela con `RiskEvaluationRequest` referenciando al `Lead` mediante `tracking_id`.
    - Response: `RiskEvaluationResponse` con `status`, `customer_id`, `redirect_url`, `offer_max_amount`,
      `payment_amount`, `payment_term`, `reject_reason`, `error_code`, `error_message`.
    - Si `status = preapproved`, se asocia/crea `Customer` con `customer_id` y se vincula al `Lead` original.
- Paso 2 `UpdateContactInformation`:
    - Request: `ContactUpdateRequest` con `customer_id`, `email`, `phone_number`.
    - Response: `ContactUpdateResponse` con `status`, `redirect_url`, `error_code`, `error_message`.
- Postback: el documento lo marca como “pendiente de documentar”; se define un placeholder `Postback` opcional con
  campos típicos de otorgamiento (`granted_amount`, `payment_term`, `disbursed_at`). Puedes ajustarlo cuando haya
  especificación oficial.

### Notas y supuestos

- `employment_status` es catálogo del cliente; aquí se trata como `string`.
- Se separan Request/Response para dejar trazabilidad y cumplir auditoría del flujo de dos pasos.
- `Customer` representa el identificador maestro del cliente externo (`customer_id`) y permite correlacionar el Paso 2 y
  futuros postbacks.
- Los montos se modelan como `decimal(15,2)`, ajusta precisión si es necesario.
- `Lead.gender` acepta "F"/"M" según el doc; si el dominio cambia, actualiza el tipo a un enum propio.

### ER simple para el módulo Alprestamo

El siguiente diagrama ER resume las entidades y relaciones necesarias para cubrir los casos del documento adjunto:
autenticación por `x-api-key`, POST `RiskEvaluation` (request/response), POST `UpdateContactInformation` (
request/response), y un posible `Postback` futuro. Incluye los campos indicados en la documentación y muestra cómo se
encadenan ambos pasos cuando la evaluación es `preapproved`.

```puml
@startuml
hide circle
skinparam linetype ortho
skinparam class {
  BackgroundColor White
  BorderColor #999
}
' Opcional: tema claro
' !theme plain

entity "Lead" as Lead {
  *tracking_id : string <<PK>>
  national_id : string
  first_name : string
  last_name : string
  gender : string  ' "F" o "M"
  date_of_birth : date  ' YYYY-MM-DD
  employment_status : string  ' catálogo definido por el cliente
  created_at : datetime
}

entity "RiskEvaluationRequest" as RiskEvalReq {
  *id : uuid <<PK>>
  tracking_id : string <<FK Lead.tracking_id>>
  sent_at : datetime
}

entity "RiskEvaluationResponse" as RiskEvalRes {
  *id : uuid <<PK>>
  request_id : uuid <<FK RiskEvalReq.id>>
  status : enum('preapproved','rejected','error')
  error_code : string
  error_message : string
  customer_id : string  ' provisto sólo si preapproved
  redirect_url : string
  offer_max_amount : decimal(15,2)
  payment_amount : decimal(15,2)
  payment_term : int
  reject_reason : string
  received_at : datetime
}

entity "Customer" as Customer {
  *customer_id : string <<PK>>
  origin_tracking_id : string <<FK Lead.tracking_id>>
  created_at : datetime
}

entity "ContactUpdateRequest" as ContactReq {
  *id : uuid <<PK>>
  customer_id : string <<FK Customer.customer_id>>
  email : string
  phone_number : string
  sent_at : datetime
}

entity "ContactUpdateResponse" as ContactRes {
  *id : uuid <<PK>>
  request_id : uuid <<FK ContactReq.id>>
  status : enum('success','error')
  error_code : string
  error_message : string
  redirect_url : string
  received_at : datetime
}

entity "Postback" as Postback {
  *id : uuid <<PK>>
  customer_id : string <<FK Customer.customer_id>>
  granted_amount : decimal(15,2)
  payment_term : int
  disbursed_at : datetime
  notes : string
}

' Relaciones principales del flujo
Lead ||--o{ RiskEvalReq : "genera"
RiskEvalReq ||--|| RiskEvalRes : "tiene"

' Si status = preapproved, se crea/usa el Customer en el sistema del cliente
RiskEvalRes }o--|| Customer : "crea/usa (si preapproved)"
Customer ||--o{ ContactReq : "recibe"
ContactReq ||--|| ContactRes : "tiene"

' Postback futuro del cliente a Alprestamo
Customer ||--o{ Postback : "notifica (opcional)"

@enduml
```

### Correspondencia con el documento

- Paso 1 `RiskEvaluation`:
    - Request: se modela con `RiskEvaluationRequest` referenciando al `Lead` mediante `tracking_id`.
    - Response: `RiskEvaluationResponse` con `status`, `customer_id`, `redirect_url`, `offer_max_amount`,
      `payment_amount`, `payment_term`, `reject_reason`, `error_code`, `error_message`.
    - Si `status = preapproved`, se asocia/crea `Customer` con `customer_id` y se vincula al `Lead` original.
- Paso 2 `UpdateContactInformation`:
    - Request: `ContactUpdateRequest` con `customer_id`, `email`, `phone_number`.
    - Response: `ContactUpdateResponse` con `status`, `redirect_url`, `error_code`, `error_message`.
- Postback: el documento lo marca como “pendiente de documentar”; se define un placeholder `Postback` opcional con
  campos típicos de otorgamiento (`granted_amount`, `payment_term`, `disbursed_at`). Puedes ajustarlo cuando haya
  especificación oficial.

### Notas y supuestos

- `employment_status` es catálogo del cliente; aquí se trata como `string`.
- Se separan Request/Response para dejar trazabilidad y cumplir auditoría del flujo de dos pasos.
- `Customer` representa el identificador maestro del cliente externo (`customer_id`) y permite correlacionar el Paso 2 y
  futuros postbacks.
- Los montos se modelan como `decimal(15,2)`, ajusta precisión si es necesario.
- `Lead.gender` acepta "F"/"M" según el doc; si el dominio cambia, actualiza el tipo a un enum propio.

---

### Diferencia entre Lead y Customer (simple)

- Lead: persona interesada que completó el formulario en Alprestamo. Se identifica por tracking_id y aún no existe como cliente del lender.
- Customer: registro ya reconocido por el sistema del cliente/lender. Se identifica por customer_id y existe cuando la evaluación resulta preapproved.

### Diagrama de Use Case (simplificado)

```puml
@startuml
left to right direction
skinparam shadowing false
skinparam packageStyle rectangle
skinparam usecase {
  BackgroundColor White
  BorderColor #999
}

actor Usuario
actor Alprestamo
actor Cliente

rectangle "Flujo de Referidos" {
  Usuario -- (Completar formulario)
  Alprestamo -- (Evaluar riesgo - RiskEvaluation)
  Cliente -- (Evaluar riesgo - RiskEvaluation)
  Alprestamo -- (Mostrar ofertas aprobadas)
  Alprestamo -- (Enviar datos de contacto - UpdateContactInformation)
  Cliente -- (Recibir contacto y redirigir a onboarding)
  Usuario -- (Continuar onboarding del cliente)
  Cliente -- (Otorgar préstamo)
  Cliente -- (Postback a Alprestamo) : <<opcional>>
}

(Completar formulario) ..> (Evaluar riesgo - RiskEvaluation) : dispara
(Mostrar ofertas aprobadas) ..> (Evaluar riesgo - RiskEvaluation) : según respuesta
(Enviar datos de contacto - UpdateContactInformation) ..> (Evaluar riesgo - RiskEvaluation) : si preapproved
(Recibir contacto y redirigir a onboarding) ..> (Enviar datos de contacto - UpdateContactInformation)
(Postback a Alprestamo) ..> (Otorgar préstamo)

@enduml
```
