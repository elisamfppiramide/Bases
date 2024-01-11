CREATE DATABASE Instituto;

USE Instituto;

CREATE TABLE Departamento (
codigo int (9),
nombre varchar (50) NOT NULL,
CONSTRAINT pk_Departamento PRIMARY KEY (codigo)
);


CREATE TABLE Ciclo (
codigo int (9),
nombre varchar (50) NOT NULL,
numero_creditos int (3),
CONSTRAINT pk_Ciclo PRIMARY KEY (codigo),
CONSTRAINT ck_numero_creditos CHECK (numero_creditos >=0)
);

CREATE TABLE Departamento_Ciclo (
codigo_Departamento int (9),
codigo_Ciclo int (9),
CONSTRAINT fk_Departamento_Ciclo_Departamento FOREIGN KEY (codigo_Departamento) REFERENCES Departamento (codigo),
CONSTRAINT fk_Departamento_Ciclo_Ciclo FOREIGN KEY (codigo_Ciclo) REFERENCES Ciclo (codigo)
);

CREATE TABLE Modulo_Profesional (
nombre varchar (50),
numero_horas int (3) NOT NULL,
CONSTRAINT pk_Modulo_Profesional PRIMARY KEY (nombre),
CONSTRAINT ck_numero_horas CHECK (numero_horas >=0)
);

CREATE TABLE CICLO_MODULO_PROFESIONAL (
codigo_Ciclo int (9),
nombre_Modulo_Profesional varchar(50),
CONSTRAINT fk_Ciclo_Modulo_Profesional_Ciclo FOREIGN KEY (codigo_Ciclo) REFERENCES Ciclo (codigo),
CONSTRAINT fk_Ciclo_Modulo_Profesional_Modulo_Profesional FOREIGN KEY (nombre_Modulo_Profesional) REFERENCES Modulo_Profesional (nombre)
);

CREATE TABLE Docente (
dni varchar (9),
nombre varchar (50) NOT NULL,
email varchar (50) NOT NULL,
CONSTRAINT pk_Docente PRIMARY KEY (dni)
);

CREATE TABLE Modulo_Profesional_Docente (
nombre_Modulo_Profesional varchar (50),
dni_Docente varchar (9),
CONSTRAINT fk_Modulo_Profesional_Docente_Modulo_Profesional FOREIGN KEY (nombre_Modulo_Profesional) REFERENCES Modulo_Profesional (nombre),
CONSTRAINT fk_Modulo_Profesional_Docente_Docente FOREIGN KEY (dni_Docente) REFERENCES Docente (dni)
); 


