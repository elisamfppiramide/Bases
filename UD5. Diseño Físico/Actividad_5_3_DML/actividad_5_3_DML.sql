SHOW DATABASES; 
USE Musica; 
SHOW TABLES FROM Musica; 
DELETE FROM Cancion WHERE numero_reproducciones <100; 
DELETE FROM Cantante WHERE nombre = "Fher"; 
DELETE FROM Cantante WHERE email = "dionisio@hotmail.com" AND identificador = 1;
