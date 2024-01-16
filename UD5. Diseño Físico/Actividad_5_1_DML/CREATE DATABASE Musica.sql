CREATE DATABASE Musica;

USE Musica;

CREATE TABLE Cantante (

identificador int (5) NOT NULL, 
nombre varchar (50) NOT NULL, 
primer_apellido varchar (50) NOT NULL, 
segundo_apellido varchar (50),
email varchar (50) NOT NULL, 
CONSTRAINT pk_Cantante PRIMARY KEY (identificador)
CONSTRAINT uk_Cantante UNIQUE (email)
);

CREATE TABLE Cancion (

identificador int (5) NOT NULL, 
nombre varchar (50) NOT NULL, 
duracion float (50) NOT NULL, 
CONSTRAINT pk_Cancion PRIMARY KEY (identificador)
); 

CREATE TABLE Cantante_Cancion (

identificador_Cantante int (5) NOT NULL, 
identificador_Cancion int (5) NOT NULL, 
CONSTRAINT fk_Cantante_Cancion_Cantante FOREIGN KEY (identificador_Cantante) REFERENCES Cantante (identificador),
CONSTRAINT fk_Cantante_Cancion_Cancion FOREIGN KEY (identificador_Cancion) REFERENCES Cancion (identificador)
);

