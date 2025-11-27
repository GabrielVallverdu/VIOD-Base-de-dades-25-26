
-- create
CREATE TABLE animals (
  id INT UNSIGNED AUTO_INCREMENT,
  nom VARCHAR(20),
  tipus ENUM('gos', 'gat', 'conill'),
  rasa VARCHAR(20),
  pes SMALLINT UNSIGNED,
  color ENUM('blanc', 'marro', 'negre', 'gris'),
  edat TINYINT,
  PRIMARY KEY(id)
);

DESCRIBe animals;

INSERT INTO animals (nom, tipus, rasa, pes, color, edat)
  Values ('Tobi', 'gos', 'Pastor alemany', 67, 'marro', 6),
  ('Kami', 'gat', 'Carey', 6, 'marro', 2),
  ('Pepito', 'conill', 'parajo', 67, 'marro', 2),
  ('Pepito', 'gos', 'parajo', 67, 'gris', 2),
  ('Pepito', 'gat', 'parajo', 67, 'blanc', 2),
  ('toby', 'conill', 'comic', 67, 'negre', 2);
  
  SELECT * FROM animals;
  
  SELECT nom,rasa FROM animals;
  
  SELECT nom,pes AS kg FROM animals;
  
  SELECT nom AS 'nom',
          YEAR(
            DATE_SUB(NOW(), INTERVAL edat YEAR)
          ) AS 'Any de naixement'
  FROM animals;
  
  
  
