--DATOS DE LAS TABLAS DE LA BASE DE DATOS Red Social


--DATOS DE LA TABLA USUARIOS
INSERT INTO usuarios (nombre, username, genero, biografia, correo, contrasena, estado, fecha_nacimiento) VALUES
('Juan Pérez', 'juanp', 'Masculino', 'Amante del fútbol.', 'juanp@mail.com', SHA2('pass123', 256), 'activo', '1995-03-15'),
('María Gómez', 'mariag', 'Femenino', 'Me encanta viajar.', 'mariag@mail.com', SHA2('pass456', 256), 'activo', '1992-07-21'),
('Carlos López', 'carlosl', 'Masculino', 'Cine y tecnología.', 'carlosl@mail.com', SHA2('pass789', 256), 'activo', '1988-11-03'),
('Ana Torres', 'anatorres', 'Femenino', 'Amante de los libros.', 'ana@mail.com', SHA2('pass101', 256), 'suspendido', '1999-05-29'),
('Pedro Díaz', 'pedrod', 'Masculino', 'Fotógrafo aficionado.', 'pedro@mail.com', SHA2('pass202', 256), 'bloqueado', '1990-12-10'),
('Lucía Fernández', 'luciaf', 'Femenino', 'Música y arte.', 'lucia@mail.com', SHA2('pass303', 256), 'activo', '2000-06-25'),
('Javier Ortega', 'javiero', 'Masculino', 'Fanático de los videojuegos.', 'javier@mail.com', SHA2('pass404', 256), 'activo', '1993-09-08'),
('Sofía Herrera', 'sofiaher', 'Femenino', 'Amante de los animales.', 'sofia@mail.com', SHA2('pass505', 256), 'activo', '1997-04-14'),
('Andrés Castro', 'andresc', 'Masculino', 'Runner y montañista.', 'andres@mail.com', SHA2('pass606', 256), 'activo', '1991-01-31'),
('Paula Rojas', 'paular', 'Femenino', 'Cocina y repostería.', 'paula@mail.com', SHA2('pass707', 256), 'activo', '1985-08-20'),
('David Salazar', 'davids', 'Masculino', 'Apasionado por la programación.', 'david@mail.com', SHA2('pass909', 256), 'activo', '1994-12-05'),
('Elena Cruz', 'elenac', 'Femenino', 'Yoga y meditación.', 'elena@mail.com', SHA2('pass010', 256), 'activo', '1987-03-11'),
('Sergio Mendoza', 'sergiom', 'Masculino', 'Me gusta el ajedrez.', 'sergio@mail.com', SHA2('pass111', 256), 'activo', '1995-09-17'),
('Camila Duarte', 'camilad', 'Femenino', 'Aprendiendo idiomas.', 'camila@mail.com', SHA2('pass222', 256), 'activo', '1998-12-24'),
('Fernando Ruiz', 'fernandor', 'Masculino', 'Aficionado a la astronomía.', 'fernando@mail.com', SHA2('pass333', 256), 'activo', '1990-05-30'),
('Gabriela Soto', 'gabrielas', 'Femenino', 'Me encanta la moda.', 'gabriela@mail.com', SHA2('pass444', 256), 'activo', '2001-06-18'),
('Roberto Vargas', 'robertov', 'Masculino', 'Músico de corazón.', 'roberto@mail.com', SHA2('pass555', 256), 'activo', '1986-10-05'),
('Angela Morales', 'angelam', 'Femenino', 'Fanática de la tecnología.', 'angela@mail.com', SHA2('pass666', 256), 'activo', '1993-07-08'),
('Cristian López', 'cristianl', 'Masculino', 'Guitarrista y viajero.', 'cristian@mail.com', SHA2('pass777', 256), 'activo', '1997-11-22'),
('Patricia Ramírez', 'patriciar', 'Femenino', 'Escritora en progreso.', 'patricia@mail.com', SHA2('pass888', 256), 'activo', '1989-08-14');


--DATOS DE LA TABLA PUBLICACIONES
INSERT INTO publicaciones (usuario_id, contenido, compartidos, privacidad) VALUES
(1, 'Mi primer post en la red!', 2, 'público'),
(2, 'Hermosa vista desde la montaña!', 5, 'público'),
(3, 'Recomendaciones de películas?', 1, 'privado'),
(4, 'Nuevo libro favorito!', 0, 'público'),
(5, 'Fotos de mi último viaje.', 3, 'Mejores Amigos'),
(6, 'Iniciando en el mundo de la programación!', 10, 'Mejores Amigos'),
(7, '¿Alguien más ama los videojuegos retro?', 7, 'Mejores Amigos'),
(8, 'Consejos para cuidar a un cachorro?', 4, 'privado'),
(9, 'Mañana haré mi primera maratón!', 3, 'público'),
(10, 'Receta de brownies deliciosos.', 8, 'público'),
(11, 'Descubrí un nuevo planeta en el telescopio!', 5, 'Mejores Amigos'),
(12, 'Practicando yoga todas las mañanas!', 3, 'público'),
(13, 'Aprendiendo alemán! Es difícil pero emocionante.', 2, 'público'),
(14, 'Jugué mi mejor partida de ajedrez hoy!', 1, 'privado'),
(15, 'Nuevo outfit para la fiesta.', 6, 'público'),
(16, 'Concierto increíble anoche!', 9, 'público'),
(17, 'Probando nuevas funciones en Python.', 4, 'público'),
(18, 'Buscando recomendaciones de libros.', 3, 'público'),
(19, 'Primera vez que toco la guitarra en público!', 7, 'público'),
(20, 'Hoy terminé mi primer cuento corto.', 10, 'privado');


--DATOS DE LA TABLA COMENTARIOS
INSERT INTO comentarios (usuario_id, publicacion_id, contenido) VALUES
(1, 1, '¡Qué emocionante tu primer post!'),
(2, 2, 'Esa vista es impresionante, ¿dónde es?'),
(3, 3, 'Totalmente de acuerdo, ¿alguna recomendación?'),
(4, 4, 'Leí ese libro, es fascinante.'),
(5, 5, '¡Qué fotos tan increíbles de tu viaje!'),
(6, 6, 'Bienvenido al mundo de la programación, es genial.'),
(7, 7, 'Los videojuegos retro tienen un encanto especial.'),
(8, 8, 'Los cachorros son adorables, ¿qué raza es?'),
(9, 9, '¡Mucho éxito en tu maratón!'),
(10, 10, 'Definitivamente probaré esa receta, suena deliciosa.'),
(11, 11, 'La astronomía es fascinante, ¿qué telescopio usas?'),
(12, 12, 'El yoga ha cambiado mi vida, ¿qué estilo practicas?'),
(13, 13, 'Aprender alemán es un reto, pero muy gratificante.'),
(14, 14, 'El ajedrez es un juego de estrategia increíble.'),
(15, 15, 'Ese conjunto es perfecto para la ocasión.'),
(16, 16, '¿Dónde fue el concierto? Suena increíble.'),
(17, 17, 'Python es muy versátil, ¿qué proyectos tienes en mente?'),
(18, 18, 'Te recomiendo "Cien años de soledad", es un clásico.'),
(19, 19, '¡Qué valiente al tocar en público!'),
(20, 20, 'Tu cuento corto me inspiró, gracias por compartirlo.');


--DATO DE LA TABLA DE REACCIONES
INSERT INTO reacciones (usuario_id, publicacion_id, comentario_id, tipo) VALUES
(1, 1, 2, 'Me gusta'),
(2, 2, 3, 'Me encanta'),
(3, 3, 5, 'Me divierte'),
(4, 4, 7, 'Me asombra'),
(5, 5, 5, 'Me entristece'),
(6, 6, 5, 'Me enoja'),
(7, 7, 3, 'Me gusta'),
(8, 8, 2, 'Me encanta'),
(9, 9, 11, 'Me divierte'),
(10, 10, 19, 'Me asombra'),
(11, 11, 20, 'Me entristece'),
(12, 12, 17, 'Me enoja'),
(13, 13, 18, 'Me gusta'),
(14, 14, 15, 'Me encanta'),
(15, 15, 13, 'Me divierte'),
(16, 16, 11, 'Me asombra'),
(17, 17, 12, 'Me entristece'),
(18, 18, 1, 'Me enoja'),
(19, 19, 4, 'Me gusta'),
(20, 20, 14, 'Me encanta');


--DATOS DE LA TABLA DE AMISTADES
INSERT INTO amistades (usuario1_id, usuario2_id, estado) VALUES
(1, 2, 'aceptado'),
(2, 3, 'pendiente'),
(3, 4, 'aceptado'),
(4, 5, 'bloqueado'),
(5, 6, 'pendiente'),
(6, 7, 'aceptado'),
(7, 8, 'pendiente'),
(8, 9, 'aceptado'),
(9, 10, 'pendiente'),
(10, 11, 'aceptado'),
(11, 12, 'pendiente'),
(12, 13, 'aceptado'),
(13, 14, 'pendiente'),
(14, 15, 'aceptado'),
(15, 16, 'pendiente'),
(16, 17, 'aceptado'),
(17, 18, 'pendiente'),
(18, 19, 'aceptado'),
(19, 20, 'pendiente'),
(20, 1, 'aceptado');


--DATOS DE LA TABLA MENSAJES
INSERT INTO mensajes (remitente_id, destinatario_id, contenido) VALUES
(1, 2, 'Hola, ¿cómo estás?'),
(2, 3, '¿Te gustaría salir este fin de semana?'),
(3, 4, 'Tengo novedades sobre el proyecto.'),
(4, 5, '¿Leíste el artículo que te recomendé?'),
(5, 6, '¡Felicidades por tu logro!'),
(6, 7, '¿Cuándo nos vemos para la práctica?'),
(7, 8, 'Necesito tu opinión sobre este tema.'),
(8, 9, '¿Te unes al plan para el viernes?'),
(9, 10, 'Reenvío el documento que solicitaste.'),
(10, 11, '¿Confirmas tu asistencia al evento?'),
(11, 12, 'Recordatorio de la reunión de mañana.'),
(12, 13, 'Gracias por tu ayuda en el proyecto.'),
(13, 14, '¿Tienes disponibilidad para una llamada?'),
(14, 15, 'Te envío las fotos del viaje.'),
(15, 16, '¿Cómo va todo con el nuevo trabajo?'),
(16, 17, 'Confirmado, nos vemos a las 6 PM.'),
(17, 18, 'Adjunto el informe que pediste.'),
(18, 19, '¿Puedes revisar este documento?'),
(19, 20, 'Última oportunidad para registrarse.'),
(20, 1, 'Fue un placer conocerte ayer.');


--DATOS DE LA TABLA GRUPOS
INSERT INTO grupos (nombre, descripcion, privacidad, creador_id) VALUES
('Aventureros', 'Grupo para compartir experiencias de viaje.', 'público', 1),
('Lectores Nocturnos', 'Club de lectura para noctámbulos.', 'privado', 2),
('Techies', 'Espacio para discutir sobre tecnología y gadgets.', 'público', 3),
('Cinefilia', 'Amantes del cine clásico y moderno.', 'privado', 4),
('Cocina Creativa', 'Recetas y tips culinarios innovadores.', 'público', 5),
('Músicos Unidos', 'Comunidad para músicos de todos los géneros.', 'privado', 6),
('Deportistas Extremos', 'Para quienes buscan aventuras deportivas.', 'público', 7),
('Fotografía Artística', 'Espacio para compartir y aprender fotografía.', 'privado', 8),
('Viajeros del Mundo', 'Conexión para quienes aman explorar nuevos destinos.', 'público', 9),
('Amigos de los Animales', 'Grupo dedicado al cuidado y bienestar animal.', 'privado', 10),
('Cine Independiente', 'Debates y recomendaciones sobre cine independiente.', 'público', 11),
('Gastronomía Global', 'Explorando sabores de todo el mundo.', 'privado', 12),
('Innovadores Tecnológicos', 'Para discutir las últimas tendencias en tecnología.', 'público', 13),
('Club de Poesía', 'Espacio para compartir y analizar poesía.', 'privado', 14),
('Aficionados al Vino', 'Catas y discusiones sobre vinos de diferentes regiones.', 'público', 15),
('Cultura Pop', 'Debates sobre series, películas y música popular.', 'privado', 16),
('Ecologistas Unidos', 'Iniciativas y discusiones sobre medio ambiente.', 'público', 17),
('Emprendedores Creativos', 'Red de apoyo para emprendedores innovadores.', 'privado', 18),
('Ciclismo Urbano', 'Para amantes del ciclismo en la ciudad.', 'público', 19),
('Astronomía para Todos', 'Explorando el universo y compartiendo descubrimientos.', 'privado', 20);


-- DATOS DE LA TABLA USUARIOS_GRUPOS
INSERT INTO usuarios_grupos (grupo_id, usuario_id, rol) VALUES
(1, 1, 'admin'),
(1, 2, 'miembro'),
(1, 3, 'miembro'),
(2, 2, 'admin'),
(2, 3, 'miembro'),
(2, 4, 'miembro'),
(3, 3, 'admin'),
(3, 4, 'miembro'),
(3, 5, 'miembro'),
(4, 4, 'admin'),
(4, 5, 'miembro'),
(4, 6, 'miembro'),
(5, 5, 'admin'),
(5, 6, 'miembro'),
(5, 7, 'miembro'),
(6, 6, 'admin'),
(6, 7, 'miembro'),
(6, 8, 'miembro'),
(7, 7, 'admin'),
(7, 8, 'miembro'),
(7, 9, 'miembro');