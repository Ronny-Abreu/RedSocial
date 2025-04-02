--Procedimientos Almacenados

"1- Procedimiento para suspender a un usuario por su ID"
DELIMITER //

CREATE PROCEDURE SuspenderUsuario(IN p_usuario_id INT)
BEGIN
    UPDATE Usuarios
    SET estado = 'suspendido'
    WHERE id = p_usuario_id;
END //

DELIMITER ;

-- Para ejecutar la función de suspender al usuario con ID 1:  CALL SuspenderUsuario(5); ojo: Ya se ejecutó ese id


"2- Procedimiento para eliminar una publicación y sus comentarios:"
DELIMITER //

CREATE PROCEDURE EliminarPublicacionYComentarios(
    IN p_publicacion_id INT
)
BEGIN
    DELETE FROM Comentarios WHERE publicacion_id = p_publicacion_id;
    DELETE FROM Publicaciones WHERE id = p_publicacion_id;
END //

DELIMITER ;

--Para ejecutarlo:  CALL EliminarPublicacionYComentarios(10); ojo: Ya se ejecutó ese id


"3- Procedimiento para ver la lista de amigos de un usuario:"
DELIMITER //

CREATE PROCEDURE ObtenerAmigos(
    IN p_usuario_id INT
)
BEGIN
    SELECT u.id, u.nombre, u.username
    FROM Usuarios u
    JOIN Amistades a ON (u.id = a.usuario1_id OR u.id = a.usuario2_id)
    WHERE (a.usuario1_id = p_usuario_id OR a.usuario2_id = p_usuario_id)
        AND a.estado = 'aceptado'
        AND u.id != p_usuario_id;
END //

DELIMITER ;

--Para ejecutarlo: CALL ObtenerAmigos(3); ojo: Ya se ejecutó ese id


"4-  Procedimiento para enviar un mensaje:"
DELIMITER //

CREATE PROCEDURE EnviarMensaje(
    IN p_remitente_id INT,
    IN p_destinatario_id INT,
    IN p_contenido TEXT
)
BEGIN
    INSERT INTO Mensajes (remitente_id, destinatario_id, contenido, fecha_envio)
    VALUES (p_remitente_id, p_destinatario_id, p_contenido, NOW());
END //

DELIMITER ;

--Para ejecutarlo: CALL EnviarMensaje(1, 2, 'Hola corazón, ¿cómo estás?'); ojo: Ya se ejecutó ese id

"5- Procedimiento para agregar un usuario a un grupo como admin o miembro:"
DELIMITER //

CREATE PROCEDURE AgregarUsuarioAGrupo(
    IN p_grupo_id INT,
    IN p_usuario_id INT,
    IN p_rol ENUM('admin', 'miembro')
)
BEGIN
    INSERT INTO Usuarios_Grupos (grupo_id, usuario_id, rol, fecha_union)
    VALUES (p_grupo_id, p_usuario_id, p_rol, NOW());
END //

DELIMITER ;

--Para ejecutarlo: CALL AgregarUsuarioAGrupo(2, 5, 'miembro'); ojo: Ya se ejecutó ese id