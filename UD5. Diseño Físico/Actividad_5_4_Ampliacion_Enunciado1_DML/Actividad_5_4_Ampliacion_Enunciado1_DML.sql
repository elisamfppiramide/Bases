CREATE DATABASE Running;
SHOW DATABASES; 
USE Running; 

CREATE TABLE Empresa (
    CIF varchar (10), 
    Nombre varchar (50) NOT NULL,
    Telefono int (9) UNIQUE, 
    CONSTRAINT pk_Empresa PRIMARY KEY (CIF),
    CONSTRAINT uk_Empresa UNIQUE (telefono) 
);

CREATE TABLE Carrera (
Nombre varchar (50),
Poblacion varchar (50) NOT NULL, 
CIF_Empresa varchar (10) NOT NULL, 
CONSTRAINT pk_Carrera PRIMARY KEY (Nombre), 
CONSTRAINT fk_Carrera_Empresa FOREIGN KEY (CIF_Empresa) REFERENCES Empresa (CIF)
);

CREATE TABLE Patrocinador (
    Numero_Telefono int (9),
    Nombre varchar (50) NOT NULL,
    Ayuda_economica int (10) NOT NULL,
    CONSTRAINT pk_Patrocinador PRIMARY KEY (Numero_Telefono) 
);

CREATE TABLE Carrera_Patrocinador (
    Nombre_Carrera varchar (50),
    Numero_Telefono int (9),
    CONSTRAINT fk_Carrera_Patrocinador_Carrera FOREIGN KEY (Nombre_Carrera) REFERENCES Carrera (Nombre),
    CONSTRAINT fk_Carrera_Patrocinador_Patrocinador FOREIGN KEY (Numero_Telefono) REFERENCES Patrocinador (Numero_Telefono)
);

CREATE TABLE Categoria (
    Nombre varchar (50),
    CONSTRAINT pk_Categoria PRIMARY KEY (Nombre)
);

CREATE TABLE Persona (
    id int AUTO_INCREMENT, 
    DNI varchar (9) UNIQUE, 
    Nombre varchar (50),
    CONSTRAINT pk_Persona PRIMARY KEY (id), 
    CONSTRAINT uk_Persona UNIQUE (DNI)
);

CREATE TABLE Carrera_Categoria_Persona (
    Nombre_Carrera varchar (50),
    Nombre_Categoria varchar (50), 
    DNI_Persona varchar (9),
    Numero_dorsal int (4), 
    CONSTRAINT fk_Carrera_Categoria_Persona_Carrera FOREIGN KEY (Nombre_Carrera) REFERENCES Carrera (nombre),
    CONSTRAINT fk_Carrera_Categoria_Persona_Categoria FOREIGN KEY (Nombre_Categoria) REFERENCES Categoria (nombre),
    CONSTRAINT fk_Carrera_Categoria_Persona_Persona FOREIGN KEY (DNI_Persona) REFERENCES Persona (DNI)
);

CREATE TABLE Atleta_Popular (
    id int AUTO_INCREMENT, 
    DNI_Persona varchar (9), 
    Nombre_Persona varchar (50),
    Edad int (3),
    CONSTRAINT fk_Atleta_Popular_Persona FOREIGN KEY (DNI_Persona) REFERENCES Persona (DNI),
    CONSTRAINT pk_Atleta_Popular PRIMARY KEY (id)
);

CREATE TABLE Atleta_Profesional ( 
    id int (9) AUTO_INCREMENT,
    DNI_Persona varchar (9), 
    Nombre_Persona varchar (50),
    Atleta_Profesional_Ayudante int (9),
    CONSTRAINT pk_Atleta_Prfesional PRIMARY KEY (id),
    CONSTRAINT fk_Atleta_Profesional_Persona FOREIGN KEY (DNI_Persona) REFERENCES Persona (DNI), 
    CONSTRAINT fk_Atleta_Profesional_Atleta_Profesional FOREIGN KEY (Atleta_Profesional_Ayudante) REFERENCES Atleta_Profesional (id) 
);

CREATE TABLE Marca (
    Nombre varchar (50),
    Localidad varchar (50) NOT NULL,
    CONSTRAINT pk_Marca PRIMARY KEY (Nombre)
);

CREATE TABLE Marca_Deportiva ( 
    Nombre_Marca varchar (50),
    Numero_Zapatillas int (5) NOT NULL, 
    CONSTRAINT fk_Marca_Deportiva_Marca FOREIGN KEY (Nombre_Marca) REFERENCES Marca (nombre)
); 

CREATE TABLE Marca_Nutricional (
    Nombre_Marca varchar (50), 
    Numero_Productos_Veganos int (5) NOT NULL, 
    CONSTRAINT fk_Marca_Nutricional_Marca FOREIGN KEY (Nombre_Marca) REFERENCES Marca (nombre)
); 

INSERT INTO Persona (`DNI`,`Nombre`) VALUES ("82375637U", "Marcos"), ("732972160", "Lucia"), ("45367382X", "Amanda"), ("82171911M", "Manuel"), ("35287641V", "Victoria"), ("64732896A", "Loreto"), ("26473278H", "Adrian"), ("74736456Q", "Luis"), ("74892710Y", "Nuria"), ("64638264Ñ", "Elisa"), ("36474828G", "Gamiz"), ("83718362W", "Miguel"), ("64738282K", "Samuel"), ("74639621B", "Elena"), ("64836297F", "Raul");
INSERT INTO Atleta_Popular (`DNI_Persona`, `edad`) VALUES ("26473278H", 18), ("35287641V", 23), ("36474828G", 27), ("45367382X", 29), ("64638264Ñ", 33); 
INSERT INTO Atleta_Profesional (`DNI_Persona`, `Atleta_Profesional_Ayudante`) VALUES ("64732896A", NULL), ("64738282K", NULL), ("64836297F", NULL), ("732972160", NULL), ("74639621B", NULL), ("74736456Q", NULL), ("74892710Y", NULL), ("82171911M", NULL), ("82375637U", NULL), ("83718362W", NULL);
UPDATE Atleta_Profesional SET Atleta_Profesional_Ayudante = 7  WHERE id = 8;
UPDATE Atleta_Profesional SET Atleta_Profesional_Ayudante = 4 WHERE id = 2;
UPDATE Atleta_Profesional SET Atleta_Profesional_Ayudante = 10 WHERE id = 5;
UPDATE Atleta_Profesional SET Atleta_Profesional_Ayudante = 1 WHERE id = 10;
INSERT INTO Empresa (`CIF`, `Nombre`, `Telefono`) VALUES (717119181, "La Oscense", 974245667), (7291836539, "La maña", 974347777), (6372846289, "El torico", 974345678);
INSERT INTO Carrera (`nombre`, `poblacion`, `CIF_Empresa`) VALUES ("Maratoniano", "Huesca", 717119181), ("A toda zapatilla", "Zaragoza", 7291836539), ("A toda mecha", "Teruel", 6372846289);
INSERT INTO Categoria (`nombre`) VALUES ("Principiante"), ("Intermediario"), ("Confirmado"), ("Experto"), ("Élite");
INSERT INTO Carrera_Categoria_Persona (`Nombre_Carrera`, `Nombre_Categoria`, `DNI_Persona`, `Numero_dorsal`) VALUES ("Maratoniano", "Experto", "64738282K", 123), ("A toda zapatilla", "Confirmado", "82171911M", 11), ("A toda mecha", "Intermediario", "82375637U", 734);
INSERT INTO Patrocinador (`Numero_Telefono`, `Nombre`, `Ayuda_economica`) VALUES (974384673, "Amelio", 100), (976234576, "Andrea", 230), (978784321, "Lucia", 158);
INSERT INTO Carrera_Patrocinador (`Nombre_Carrera`, `Numero_telefono`) VALUES ("A toda zapatilla", 974384673), ("A toda mecha", 976234576), ("Maratoniano", 978784321);
INSERT INTO Marca (`Nombre`, `Localidad`) VALUES ("Adidas", "Huesca"), ("Nike", "Zaragoza"), ("Arboleda", "Teruel");
INSERT INTO Marca_Deportiva (`Nombre_Marca`, `Numero_Zapatillas`) VALUES ("Nike", 30), ("Adidas", 30);
INSERT INTO Marca_Nutricional (`Nombre_Marca`, `Numero_Productos_Veganos`) VALUES ("Arboleda", 120);