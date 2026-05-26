CREATE TABLE IF NOT EXISTS hemophilia_types (
    id UUID PRIMARY KEY,
    name varchar UNIQUE NOT NULL,
    description TEXT,
    affected_factor varchar NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);