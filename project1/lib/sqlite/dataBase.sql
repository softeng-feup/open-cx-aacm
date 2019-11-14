PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS orador;
DROP TABLE IF EXISTS participante; 
DROP TABLE IF EXISTS palestra ;
DROP TABLE IF EXISTS perguntas;
DROP TABLE IF EXISTS respostas;
DROP TABLE IF EXISTS material;

-- Create the table in the specified schema
CREATE TABLE orador
(
    id SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL UNIQUE,
    photo TEXT,
    "description" TEXT
);

CREATE TABLE participante
(
    id SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL UNIQUE
);

CREATE TABLE palestra
(
    id SERIAL PRIMARY KEY,
    "date" datetime DEFAULT CURRENT_TIMESTAMP,
    about TEXT,
    FOREIGN KEY (orador_id) REFERENCES orador (orador_id)
);

CREATE TABLE perguntas
(
    id SERIAL PRIMARY KEY,
    "date" datetime DEFAULT CURRENT_TIMESTAMP,
    content TEXT,
    FOREIGN KEY (participante_id) REFERENCES participante (participante_id),
    FOREIGN KEY (palestra_id) REFERENCES palestra (palestra_id)
);

CREATE TABLE respostas
(
    id SERIAL PRIMARY KEY,
    "date" datetime DEFAULT CURRENT_TIMESTAMP,
    content TEXT,
    FOREIGN KEY (perguntas_id) REFERENCES perguntas (perguntas_id),
    FOREIGN KEY (orador_id) REFERENCES orador (orador_id)
);

CREATE TABLE material
(
    id SERIAL PRIMARY KEY,
    "date" datetime DEFAULT CURRENT_TIMESTAMP,
    content TEXT,
    FOREIGN KEY (palestra_id) REFERENCES palestra (palestra_id)
);
