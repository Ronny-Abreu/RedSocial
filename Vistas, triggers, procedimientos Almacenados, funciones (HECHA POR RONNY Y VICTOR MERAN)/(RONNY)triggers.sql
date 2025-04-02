--TRIGGERS PARA AUTOMAIZAR TAREAS EN LA BDD

"1- Trigger para actualizar el contador de comentarios en publicaciones:"

"ojo: Añadir columna contador de comentarios en Publicaciones"
ALTER TABLE Publicaciones ADD COLUMN contador_comentarios INT DEFAULT 0;

-- Creación trigger
DELIMITER //

CREATE TRIGGER after_comentario_insert
AFTER INSERT ON Comentarios
FOR EACH ROW
BEGIN
    UPDATE Publicaciones
    SET contador_comentarios = contador_comentarios + 1
    WHERE id = NEW.publicacion_id;
END //

DELIMITER ;

"Para que se actualice el contador de comentarios en la publicación con ID 1, se debe insertar un comentario asociado a esa publicación."
--Hacer esta consulta para que se actualice el contador:

UPDATE Publicaciones p
LEFT JOIN (
    SELECT publicacion_id, COUNT(*) AS total_comentarios
    FROM Comentarios
    GROUP BY publicacion_id
) c ON p.id = c.publicacion_id
SET p.contador_comentarios = COALESCE(c.total_comentarios, 0);


"2- Trigger para mantener la integridad referencial en amistades (Cuando un usuario es eliminado, se borra la amistad)"
DELIMITER //

CREATE TRIGGER after_usuario_delete
AFTER DELETE ON Usuarios
FOR EACH ROW
BEGIN
    DELETE FROM Amistades WHERE usuario1_id = OLD.id OR usuario2_id = OLD.id;
END //

DELIMITER ;

--Para probar el trigger:
DELETE FROM Usuarios WHERE id = 1;

-- Verificar si la amistad fue eliminada
"SI APARECE VACÍO ES PORQUE FUNCINÓ)"
SELECT * FROM Amistades WHERE usuario1_id = 1 OR usuario2_id = 1; 


"3- Trigger para prevenir correos electrónicos duplicados en la tabla Usuarios:"
DELIMITER //

CREATE TRIGGER before_usuario_insert
BEFORE INSERT ON Usuarios
FOR EACH ROW
BEGIN
    DECLARE correo_existente INT;
    SET correo_existente = (SELECT COUNT(*) FROM Usuarios WHERE correo = NEW.correo);
    IF correo_existente > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo electrónico ya está registrado.';
    END IF;
END //

DELIMITER ;


"Para probar el trigger:"
--Se crea un usuario de prueba con un correo ya existente: 

INSERT INTO Usuarios (id, nombre, correo)
VALUES (2, 'Ana Gómez', 'ana@mail.com'); --(saltará este error: ERROR 1644 (45000): La dirección de correo electrónico ya está registrada.)