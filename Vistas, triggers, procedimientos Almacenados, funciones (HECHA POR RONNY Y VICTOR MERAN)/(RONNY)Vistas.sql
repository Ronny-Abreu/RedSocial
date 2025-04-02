--VISTAS DE LA BASE DE DATOS Red Social


--1️⃣ Información Básica de Usuarios con estado es "activo":

CREATE VIEW VistaUsuariosActivos AS
SELECT
    id,
    nombre,
    username,
    correo,
    fecha_nacimiento
FROM
    Usuarios
WHERE
    estado = 'activo';


-- 2️⃣ Publicaciones con una configuración de privacidad en "público":
CREATE VIEW VistaPublicacionesPublicas AS
SELECT
    p.id,
    p.usuario_id,
    u.nombre AS nombre_usuario,
    p.contenido,
    p.fecha_publicacion
FROM
    Publicaciones p
    JOIN Usuarios u ON p.usuario_id = u.id
WHERE
    p.privacidad = 'público';


--3️⃣ Comentarios asociados a cada Publicación (muestra el contenido del comentario y el nombre del usuario que lo hizo):
CREATE VIEW VistaComentariosPorPublicacion AS
SELECT
    c.publicacion_id,
    p.contenido AS contenido_publicacion,
    c.id AS comentario_id,
    c.contenido_comentario AS contenido_comentario,
    u.nombre AS nombre_comentario_usuario,
    c.fecha_comentario
FROM
    Comentarios c
    JOIN Publicaciones p ON c.publicacion_id = p.id
    JOIN Usuarios u ON c.usuario_id = u.id;


--4️⃣ Reacciones por Publicación (muestra el tipo de reacción):
CREATE VIEW VistaReaccionesPorPublicacion AS
SELECT
    r.publicacion_id,
    p.contenido AS contenido_publicacion,
    r.tipo,
    COUNT(r.id) AS cantidad
FROM
    Reacciones r
    JOIN Publicaciones p ON r.publicacion_id = p.id
GROUP BY
    r.publicacion_id,
    r.tipo;


-- 5️⃣ Solicitudes de Amistad Pendientes:
CREATE VIEW VistaAmistadPendientes AS
SELECT
    a.id,
    u1.nombre AS solicitante,
    u2.nombre AS solicitado,
    a.fecha_solicitud
FROM
    Amistades a
    JOIN Usuarios u1 ON a.usuario1_id = u1.id
    JOIN Usuarios u2 ON a.usuario2_id = u2.id
WHERE
    a.estado = 'pendiente';


-- 6️⃣ Muestra los mensajes Entre Usuarios (muestra el usuario que lo envia y el que lo recibe):
CREATE VIEW VistaMensajesEntreUsuarios AS
SELECT
    m.id,
    u1.nombre AS remitente,
    u2.nombre AS destinatario,
    m.contenido,
    m.fecha_envio
FROM
    Mensajes m
    JOIN Usuarios u1 ON m.remitente_id = u1.id
    JOIN Usuarios u2 ON m.destinatario_id = u2.id;


8️⃣ Muestra los miembros de Grupos (tambien si es admin o miembro):
CREATE VIEW VistaMiembrosDeGrupos AS
SELECT
    g.nombre AS nombre_grupo,
    u.nombre AS nombre_usuario,
    ug.rol,
    ug.fecha_union
FROM
    Usuarios_Grupos ug
    JOIN Grupos g ON ug.grupo_id = g.id
    JOIN Usuarios u ON ug.usuario_id = u.id;
