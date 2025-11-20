CREATE DATABASE abogados;
USE abogados;

create table procurador (
	ID_P int AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(20),
	adreca VARCHAR(50),
	DNI_P VARCHAR(10)
);

create table assumpte (
	ID_A int AUTO_INCREMENT PRIMARY KEY,
	periode date,
	estat ENUM('actiu', 'inactiu') NOT NULL
);

create table client (
	ID_C int AUTO_INCREMENT PRIMARY KEY,
	DNI_C VARCHAR(50),
	nom VARCHAR(50),
	adreca VARCHAR(50),
	ID_As INT,
	foreign KEY (ID_As) references assumpte (ID_A)
);

create table PROCURADOR_ASSUMPTE (
	ID_As INT,
	ID_Pr INT,
	PRIMARY KEY(ID_AS, ID_Pr),
	FOREIGN KEY(ID_As) REFERENCES assumpte (ID_A),
	FOREIGN KEY(ID_Pr) REFERENCES procurador (ID_P)
);

DESCRIBE  procurador;
DESCRIBE assumpte;
DESCRIBE client;
DESCRIBE PROCURADOR_ASSUMPTE;

DROP TABLE IF EXISTS PROCURADOR_ASSUMPTE;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS assumpte;
DROP TABLE IF EXISTS procurador;

SHOW TABLES;

