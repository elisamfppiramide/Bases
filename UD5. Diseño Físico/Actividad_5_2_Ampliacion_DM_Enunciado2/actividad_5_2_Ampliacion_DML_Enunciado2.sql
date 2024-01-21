SHOW DATABASES; 
USE Gimnasio_San_Antonio; 
SHOW TABLES FROM Gimnasio_San_Antonio; 
SHOW COLUMNS FROM Cliente; 
SHOW COLUMNS FROM Entrenador; 
INSERT INTO Persona (`dni`, `nombre`, `primer_apellido`) VALUES ("91726483J", "Lucas", "Lopeaz"), ("74893627U", "Loreto", "Sanz"), ("94789326O", "Aitana", "Bescos"), ("89456378H", "Javier", "Gonzalez"), ("74928292P", "Maria", "Arcas"), ("83827264V", "Lucia", "Lopez"), ("83637289J", "Raul", "Guerrero"), ("74982897C", "Ramon", "Vitalla");
INSERT INTO Gimnasio (`nombre`) VALUES ("San Antonio");
INSERT INTO Entrenador (`salario`, `dniPersona`, `nombreGimnasio`) VALUES (900, "91726483J", "San Antonio"), (1330, "74893627U", "San Antonio"), (950, "94789326O", "San Antonio"), (1100, "89456378H", "San Antonio");
UPDATE Entrenador SET salario = 1200  WHERE <= 1000; 
ALTER TABLE Cliente ADD COLUMNS saldo int (9);
INSERT INTO Cliente (`fecha_de_alta`, `dniPersona`, `saldo`) VALUES ("2023-11-10", "74928292P", 0), ("2023-12-15", "74982897C", 0), ("2023-10-01", "83637289J", 0), ("2023-08-08", "83827264V", 0); 
UPDATE Cliente SET saldo = 0; 
UPDATE Cliente SET saldo = 100 WHERE fecha_de_alta > "2023-11-10"; 



