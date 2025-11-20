CREATE DATABASE IF NOT EXISTS abogados;
USE abogados;

-- Tabla 1
CREATE TABLE procurador (
    ID_P INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(20),
    adreca VARCHAR(50),
    DNI_P VARCHAR(10)
);

-- Tabla 2
CREATE TABLE assumpte (
    ID_A INT AUTO_INCREMENT PRIMARY KEY,
    periode DATE,
    estat ENUM('actiu', 'inactiu') NOT NULL
);

-- Tabla 3
CREATE TABLE client (
    ID_C INT AUTO_INCREMENT PRIMARY KEY,
    DNI_C VARCHAR(50),
    nom VARCHAR(50),
    adreca VARCHAR(50),
    ID_As INT,
    FOREIGN KEY (ID_As) REFERENCES assumpte(ID_A)
);
    
-- Tabla N-M
CREATE TABLE PROCURADOR_ASSUMPTE (
    ID_As INT,
    ID_Pr INT,
    PRIMARY KEY(ID_As, ID_Pr),
    FOREIGN KEY(ID_As) REFERENCES assumpte(ID_A),
    FOREIGN KEY(ID_Pr) REFERENCES procurador(ID_P)
);

-- ============================================================
-- EXERCICI 8: APARTAT A
-- Canviar nom de PROCURADOR → ADVOCATS
-- ============================================================

ALTER TABLE procurador
RENAME TO advocats;

-- ============================================================
-- EXERCICI 8: APARTAT B
-- ON DELETE CASCADE per eliminar tot relacionat amb un client
-- ============================================================

-- 1) Eliminar i recrear la FK del client
ALTER TABLE client
DROP FOREIGN KEY client_ibfk_1;

ALTER TABLE client
ADD CONSTRAINT fk_client_assumpte
FOREIGN KEY (ID_As) REFERENCES assumpte(ID_A)
ON DELETE CASCADE;

-- 2) Eliminar i recrear les FKs de la taula intermitja

ALTER TABLE PROCURADOR_ASSUMPTE
DROP FOREIGN KEY PROCURADOR_ASSUMPTE_ibfk_1;

ALTER TABLE PROCURADOR_ASSUMPTE
DROP FOREIGN KEY PROCURADOR_ASSUMPTE_ibfk_2;

ALTER TABLE PROCURADOR_ASSUMPTE
ADD CONSTRAINT fk_pa_assumpte
FOREIGN KEY (ID_As) REFERENCES assumpte(ID_A)
ON DELETE CASCADE;

ALTER TABLE PROCURADOR_ASSUMPTE
ADD CONSTRAINT fk_pa_advocats
FOREIGN KEY (ID_Pr) REFERENCES advocats(ID_P)
ON DELETE CASCADE;

-- Verificació
DESCRIBE advocats;
DESCRIBE assumpte;
DESCRIBE client;
DESCRIBE PROCURADOR_ASSUMPTE;
