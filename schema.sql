/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);

ALTER TABLE animals
ADD COLUMN species VARCHAR;

CREATE TABLE owners (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR NOT NULL,
    age INT NOT NULL
);

CREATE TABLE species (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR NOT NULL,
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT; 
ALTER TABLE animals 
ADD CONSTRAINT fk_species FOREIGN KEY (species_id)
REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals 
ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id)
REFERENCES owners(id);

CREATE TABLE vets (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL
);

CREATE TABLE specializations (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    vet_id INT NOT NULL,
    specie_id INT NOT NULL,
    CONSTRAINT fk_vets FOREIGN KEY (vet_id) REFERENCES vets(id),
    CONSTRAINT fk_species FOREIGN KEY (specie_id) REFERENCES species(id)
);

CREATE TABLE visits (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    animal_id INT NOT NULL,
    vet_id INT NOT NULL,
    date_of_visit DATE NOT NULL,
    CONSTRAINT fk_animals FOREIGN KEY (animal_id) REFERENCES animals(id)
    CONSTRAINT fk_vets FOREIGN KEY (vet_id) REFERENCES vets(id),
);




