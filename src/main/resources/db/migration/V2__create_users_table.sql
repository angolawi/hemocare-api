CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY,
    name varchar NOT NULL,
    email varchar UNIQUE NOT NULL,
    password_hash varchar NOT NULL,
    role varchar NOT NULL,
    hemophilia_type_id UUID REFERENCES hemophilia_types(id) ON DELETE RESTRICT,
    severity varchar,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NOT NULL DEFAULT now()
 );