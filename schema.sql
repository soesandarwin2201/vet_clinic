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

create table vets(
  id bigint generated always as identity primary key,
  name varchar(100),
  age integer,
  date_of_graduation DATE
);

create table specializations(
  species_id integer NOT NULL,
  vets_id integer NOT NULL,
  primary key(species_id, vets_id),
  constraint species_id foreign key(species_id) references species(id),
  constraint vets_id foreign key(species_id) references vets(id)
);

create table visits(
  animals_id integer NOT NULL,
  vets_id integer NOT NULL,
  date_of_visit DATE,
  primary key(animals_id, vets_id, date_of_visit),
  constraint animals_id foreign key(animals_id) references animals(id),
  constraint vets_id foreign key(vets_id) references vets(id)
);