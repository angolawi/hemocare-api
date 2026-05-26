INSERT INTO hemophilia_types (id, name, affected_factor, created_at) VALUES
    (gen_random_uuid(), 'Type A', 'Factor VIII', now()),
    (gen_random_uuid(), 'Type B', 'Factor IX', now()),
    (gen_random_uuid(), 'Type C', 'Factor XI', now());
