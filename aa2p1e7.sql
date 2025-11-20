

CREATE TABLE animals (
    nom VARCHAR(20),
    tipus VARCHAR(20),
    rasa VARCHAR(20),
    pes INTEGER,
    color VARCHAR(20)
);

ALTER TABLE animals
ADD PRIMARY KEY (nom);

CREATE TABLE Encantaris (
    id_encanteri INT AUTO_INCREMENT PRIMARY KEY,
    data_encanteri DATE,
    nom_mag VARCHAR(50),
    nom_animal VARCHAR(20),
    FOREIGN KEY (nom_animal) REFERENCES animals(nom)
);
SELECT * FROM animals;
DESCRIBE animals;
DESCRIBE Encantaris;
