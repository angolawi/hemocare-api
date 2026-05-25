# HemoCare API

A RESTful API for managing hemophilia patient care — patient registration, clinical profile assignment, and hemophilia type catalog management.

## Tech Stack

| Layer | Technology |
|---|---|
| Runtime | Java 21 |
| Framework | Spring Boot 4.0.6 |
| Security | Spring Security + JWT |
| Database | PostgreSQL |
| Migrations | Flyway |
| Tests | JUnit 5 + TestContainers |
| Build | Maven |

## Domain Overview

### Roles

| Role | Description |
|---|---|
| `PATIENT` | Hemophilia patient |
| `DOCTOR` | Healthcare professional — can assign hemophilia types to patients |
| `ADMIN` | Full access, manages the hemophilia type catalog |

### Hemophilia Types (seeded)

| Type | Affected Factor |
|---|---|
| Type A | Factor VIII |
| Type B | Factor IX |
| Type C | Factor XI |

Severity levels: `MILD`, `MODERATE`, `SEVERE`

## API Endpoints

### Auth
```
POST /auth/login          Login and receive a JWT token
```

### Users
```
POST   /users             Register a new user
GET    /users/me          Get authenticated user's profile
PUT    /users/me          Update name or email
GET    /users/{id}        Get any user's profile (ADMIN only)
PATCH  /users/{id}/hemophilia   Assign hemophilia type to a patient (DOCTOR, ADMIN)
```

### Hemophilia Types
```
GET    /hemophilia-types        List all types (any authenticated user)
POST   /hemophilia-types        Create a new type (ADMIN)
PUT    /hemophilia-types/{id}   Update a type (ADMIN)
DELETE /hemophilia-types/{id}   Delete a type (ADMIN)
```

## Getting Started

### Prerequisites

- Java 21+
- Maven 3.9+
- PostgreSQL 15+
- Docker (for TestContainers)

### Configuration

Copy the environment template and fill in your values:

```bash
cp hemocare.env .env
```

Set the following variables (via `.env`, environment, or `application.properties`):

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/hemocaredb
spring.datasource.username=your_user
spring.datasource.password=your_password
```

### Run

```bash
./mvnw spring-boot:run
```

The API will start on `http://localhost:8080`.

### Test

```bash
./mvnw test
```

Integration tests use TestContainers — Docker must be running.

## Database Schema

```
hemophilia_types
  id              UUID  PK
  name            VARCHAR  UNIQUE
  description     TEXT
  affected_factor VARCHAR
  created_at      TIMESTAMP

users
  id                  UUID  PK
  name                VARCHAR
  email               VARCHAR  UNIQUE
  password_hash       VARCHAR
  role                ENUM(PATIENT, DOCTOR, ADMIN)
  hemophilia_type_id  UUID  FK → hemophilia_types.id
  severity            ENUM(MILD, MODERATE, SEVERE)
  created_at          TIMESTAMP
  updated_at          TIMESTAMP
```

Migrations are managed by Flyway and run automatically on startup.

## Project Board

User stories are tracked as GitHub Issues: [angolawi/hemocare-api/issues](https://github.com/angolawi/hemocare-api/issues)

| Epic | Stories |
|---|---|
| User Domain | [#1](../../issues/1) [#2](../../issues/2) [#3](../../issues/3) [#4](../../issues/4) [#5](../../issues/5) |
| Hemophilia Type Domain | [#6](../../issues/6) [#7](../../issues/7) [#8](../../issues/8) [#9](../../issues/9) |
| Database Structures | [#10](../../issues/10) [#11](../../issues/11) [#12](../../issues/12) |