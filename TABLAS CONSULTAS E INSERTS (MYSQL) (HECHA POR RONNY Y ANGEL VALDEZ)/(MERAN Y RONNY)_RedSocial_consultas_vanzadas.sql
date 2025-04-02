--consultas avanzadas
-- 1: obtener información de un usuario, sus publicaciones más populares (según la cantidad de comentarios), las reacciones de los usuarios en esas publicaciones y la lista de amigos de ese usuario. 
SELECT 
    u.id AS usuario_id,
    u.nombre AS usuario_nombre,
    u.username AS usuario_username,
    COUNT(DISTINCT p.id) AS total_publicaciones,
    COUNT(DISTINCT c.id) AS total_comentarios,
    COUNT(DISTINCT r.id) AS total_reacciones,
    GROUP_CONCAT(DISTINCT f.username SEPARATOR ', ') AS amigos,
    p.id AS publicacion_id,
    p.contenido AS publicacion_contenido,
    COUNT(c.id) AS comentarios_en_publicacion,
    COUNT(r.id) AS reacciones_en_publicacion,
    GROUP_CONCAT(DISTINCT r.tipo SEPARATOR ', ') AS tipos_reacciones
FROM 
    Usuarios u
    -- Obtener las publicaciones de cada usuario
    LEFT JOIN Publicaciones p ON p.usuario_id = u.id
    -- Obtener los comentarios de esas publicaciones
    LEFT JOIN Comentarios c ON c.publicacion_id = p.id
    -- Obtener las reacciones de las publicaciones
    LEFT JOIN Reacciones r ON r.publicacion_id = p.id
    -- Obtener la lista de amigos del usuario
    LEFT JOIN Amistades a ON a.usuario1_id = u.id OR a.usuario2_id = u.id
    LEFT JOIN Usuarios f ON (a.usuario1_id = f.id AND a.usuario2_id != u.id) OR (a.usuario2_id = f.id AND a.usuario1_id != u.id)
WHERE 
    u.id = 1  -- El ID del usuario que deseas consultar
GROUP BY 
    u.id, p.id
ORDER BY 
    comentarios_en_publicacion DESC, reacciones_en_publicacion DESC;

-- 2obtener las publicaciones más populares (por cantidad de comentarios y reacciones) de los usuarios en función de sus amistades. 
SELECT 
    u.id AS usuario_id,
    u.nombre AS usuario_nombre,
    u.username AS usuario_username,
    p.id AS publicacion_id,
    p.contenido AS publicacion_contenido,
    p.fecha_publicacion AS publicacion_fecha,
    COUNT(c.id) AS total_comentarios,
    COUNT(r.id) AS total_reacciones,
    GROUP_CONCAT(DISTINCT r.tipo ORDER BY r.fecha_reaccion DESC SEPARATOR ', ') AS tipos_reacciones,
    a.estado AS estado_amistad,
    p.privacidad AS privacidad_publicacion
FROM 
    Usuarios u
    -- Obtener las publicaciones de los usuarios
    JOIN Publicaciones p ON p.usuario_id = u.id
    -- Obtener los comentarios de las publicaciones
    LEFT JOIN Comentarios c ON c.publicacion_id = p.id
    -- Obtener las reacciones de las publicaciones
    LEFT JOIN Reacciones r ON r.publicacion_id = p.id
    -- Obtener las amistades del usuario
    LEFT JOIN Amistades a ON (a.usuario1_id = u.id OR a.usuario2_id = u.id) 
    -- Filtrar por los amigos del usuario, por estado de amistad aceptado
    LEFT JOIN Usuarios f ON (a.usuario1_id = f.id AND a.usuario2_id != u.id) 
                         OR (a.usuario2_id = f.id AND a.usuario1_id != u.id)
WHERE 
    (a.estado = 'aceptado' AND (f.id = 2 OR f.id = 3)) -- Filtra por amigos con ID 2 o 3, puedes cambiar según necesites
    AND p.privacidad = 'público'  -- Solo publicaciones públicas
GROUP BY 
    u.id, p.id
ORDER BY 
    total_comentarios DESC, total_reacciones DESC;


--3-amigos de un ususario
SELECT 
    u1.nombre AS usuario_1, 
    u2.nombre AS usuario_2,
    a.fecha_solicitud
FROM 
    Amistades a
JOIN 
    Usuarios u1 ON a.usuario1_id = u1.id
JOIN 
    Usuarios u2 ON a.usuario2_id = u2.id
WHERE 
    (a.usuario1_id = 1 OR a.usuario2_id = 1) 
    AND a.estado = 'aceptado';

--4-mensajes recibido y enviados por un usuario
SELECT 
    m.contenido,
    m.fecha_envio,
    u1.nombre AS remitente,
    u2.nombre AS destinatario
FROM 
    Mensajes m
JOIN 
    Usuarios u1 ON m.remitente_id = u1.id
JOIN 
    Usuarios u2 ON m.destinatario_id = u2.id
WHERE 
    m.remitente_id = 1 OR m.destinatario_id = 1 
ORDER BY 
    m.fecha_envio DESC;

--5-comentarios por publicacion 
SELECT 
    p.id AS publicacion_id,
    COUNT(c.id) AS total_comentarios
FROM 
    Publicaciones p
LEFT JOIN 
    Comentarios c ON p.id = c.publicacion_id
GROUP BY 
    p.id
ORDER BY 
    total_comentarios DESC;

--6-cantidad de publicacion por un usuario

SELECT 
    u.nombre,
    COUNT(p.id) AS total_publicaciones
FROM 
    Usuarios u
LEFT JOIN 
    Publicaciones p ON u.id = p.usuario_id
GROUP BY 
    u.id, u.nombre;
