-- 1-Función para obtener las publicaciones más comentadas de un usuario
-- Para probarlo: SELECT obtener_publicaciones_mas_comentadas(1);
DELIMITER $$

CREATE FUNCTION obtener_publicaciones_mas_comentadas(usuario_id INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE publicaciones TEXT DEFAULT '';
    DECLARE post_id INT;
    DECLARE post_comentarios INT;
    DECLARE done INT DEFAULT FALSE;
    
    -- Recorrer las publicaciones y la cantidad de comentarios de cada una
    DECLARE pub_cursor CURSOR FOR
        SELECT p.id, COUNT(c.id) AS total_comentarios
        FROM Publicaciones p
        LEFT JOIN Comentarios c ON p.id = c.publicacion_id
        WHERE p.usuario_id = usuario_id
        GROUP BY p.id
        ORDER BY total_comentarios DESC;
    
    -- Manejo de excepciones
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN pub_cursor;
    
    -- Se recorren los resultados del cursor y los almacenamos en una variable
    read_loop: LOOP
        FETCH pub_cursor INTO post_id, post_comentarios;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        SET publicaciones = CONCAT(publicaciones, 'Publicación ID: ', post_id, ' - Comentarios: ', post_comentarios, '\n');
    END LOOP;
    
    CLOSE pub_cursor;
    
    RETURN publicaciones;
END $$

DELIMITER ;



-- 2-Función para obtener el historial de mensajes entre dos usuarios
-- Para probarlo:SELECT obtener_historial_mensajes(1, 2);
DELIMITER $$

CREATE FUNCTION obtener_historial_mensajes(usuario1_id INT, usuario2_id INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE mensajes TEXT DEFAULT '';
    DECLARE mensaje_texto TEXT;
    DECLARE fecha_envio DATETIME;
    DECLARE done INT DEFAULT FALSE;  -- Declaración de la variable done
    
    -- Cursor para recorrer los mensajes entre los dos usuarios
    DECLARE mensaje_cursor CURSOR FOR
        SELECT m.contenido, m.fecha_envio
        FROM Mensajes m
        WHERE (m.remitente_id = usuario1_id AND m.destinatario_id = usuario2_id)
           OR (m.remitente_id = usuario2_id AND m.destinatario_id = usuario1_id)
        ORDER BY m.fecha_envio;
    
    -- Manejo de excepciones
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN mensaje_cursor;
    
    -- Recorremos los resultados del cursor y los almacenamos en una variable
    read_loop: LOOP
        FETCH mensaje_cursor INTO mensaje_texto, fecha_envio;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        SET mensajes = CONCAT(mensajes, 'Fecha: ', fecha_envio, ' - Mensaje: ', mensaje_texto, '\n');
    END LOOP;
    
    CLOSE mensaje_cursor;
    
    RETURN mensajes;
END $$

DELIMITER ;



--  3-Función para obtener el número de publicaciones de un usuario
-- Para probarla: SELECT obtener_num_publicaciones(1);
DELIMITER $$

CREATE FUNCTION obtener_num_publicaciones(usuario_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    
    SELECT COUNT(*) INTO total
    FROM Publicaciones
    WHERE usuario_id = usuario_id;

    RETURN total;
END $$

DELIMITER ;





-- 4-Procedimiento para agregar una reacción a una publicación o comentario
-- Para probarla:CALL agregar_reaccion(1, 3, NULL, 'Me gusta');
DELIMITER $$

CREATE PROCEDURE agregar_reaccion(
    IN usuario INT,
    IN publicacion INT,
    IN comentario INT,
    IN tipo_reaccion ENUM('Me gusta', 'Me encanta', 'Me divierte', 'Me asombra', 'Me entristece', 'Me enoja')
)
BEGIN
    -- Verificamos si la reacción es para una publicación o un comentario
    IF publicacion IS NOT NULL THEN
        INSERT INTO Reacciones (usuario_id, publicacion_id, tipo, fecha_reaccion)
        VALUES (usuario, publicacion, tipo_reaccion, CURRENT_TIMESTAMP);
    ELSE
        INSERT INTO Reacciones (usuario_id, comentario_id, tipo, fecha_reaccion)
        VALUES (usuario, comentario, tipo_reaccion, CURRENT_TIMESTAMP);
    END IF;
    
END $$

DELIMITER ;



-- 5-Función para obtener los amigos de un usuario
-- Para probarla: SELECT obtener_amigos(1);

DELIMITER $$

CREATE FUNCTION obtener_amigos(usuario_id INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE amigos TEXT DEFAULT '';
    
    -- Obtenemos los amigos de la tabla de Amistades
    SELECT GROUP_CONCAT(username SEPARATOR ', ') INTO amigos
    FROM Usuarios
    WHERE id IN (
        SELECT usuario1_id FROM Amistades WHERE usuario2_id = usuario_id AND estado = 'aceptado'
        UNION
        SELECT usuario2_id FROM Amistades WHERE usuario1_id = usuario_id AND estado = 'aceptado'
    );
    
    RETURN amigos;
END $$

DELIMITER ;