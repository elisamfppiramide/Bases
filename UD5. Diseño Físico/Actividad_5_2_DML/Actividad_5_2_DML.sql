SHOW DATABASES; 

USE Musica; 

ALTER TABLE Cancion ADD COLUMN numero_reproducciones float; 

UPDATE Cancion SET numero_reproducciones = 38000987 WHERE nombre = Goosebumps;

UPDATE Cancion SET numero_reproducciones = 2000100 WHERE Nombre = "Cuando zarpa el amor";

UPDATE Cancion SET numero_reproducciones = 2000300 WHERE Nombre = "Lagrimas de amor";

UPDATE Cancion SET numero_reproducciones = 5000700 WHERE Nombre = "No puedo estar sin él";

UPDATE Cancion SET numero_reproducciones = 12000000 WHERE Nombre = "Sudores fríos";

UPDATE Cantante SET primer_apellido = Muñoz WHERE identificador = 2; 

UPDATE Cantante SET nombre = "Fer" WHERE identificador = 1; 

UPDATE Cantante SET email = "dio@hotmail.com" WHERE identificador = 1;