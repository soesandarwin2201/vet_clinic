/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
    species VARCHAR(100),
    PRIMARY KEY(id)
);

 ALTER TABLE animals ADD species varchar(100)

 CREATE TABLE owners (
    id BIGSERIAL PRIMARY KEY ,
    full_name VARCHAR(100),
    age INT
);

CREATE TABLE species (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR
);

 ALTER TABLE animals
   DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id  INT references species(id);

ALTER TABLE animals
ADD COLUMN owner_id INT references owners(id);
CREATE INDEX animals_index ON visits(animals_id);
CREATE INDEX vets_index ON visits(vets_id);
CREATE INDEX owners_index ON owners(email);