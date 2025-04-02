# Proyecto de Base de Datos para Red Social G5
Representante:
 - Ronny De León - 20240236

INTEGRANTES:
 - Angel Jesus Hidalgo - 2024-1793
 - Victor meran - 20241729


Este proyecto tiene como objetivo el diseño y desarrollo de una base de datos para una red social utilizando **MySQL** como sistema de gestión de bases de datos relacional. Además, el proyecto integra bases de datos no relacionales (**MongoDB**) y bases de datos en memoria (**Redis** con Python).

## Contenido

El proyecto incluye los siguientes componentes:

- **Diagrama de Base de Datos**: Un diagrama visual que muestra la estructura de la base de datos relacional, incluyendo las tablas y sus relaciones.
  
- **Diagrama de Arquitectura**: Representación de la arquitectura general del sistema, destacando cómo interactúan las distintas bases de datos y componentes.
  
- **Script SQL para Creación de la Base de Datos y Tablas**: Un script que contiene las instrucciones para crear la base de datos y todas las tablas necesarias para el funcionamiento del sistema.
  
- **Script SQL con Inserción de Datos de Ejemplo**: Un script que inserta datos de ejemplo para facilitar las pruebas y el uso del sistema.
  
- **Consultas Avanzadas en SQL**: Consultas complejas que permiten realizar operaciones avanzadas sobre la base de datos, como obtener estadísticas de interacciones, gestionar relaciones entre usuarios y más.

- **Script SQL con la Creación de Vistas, Procedimientos Almacenados, Funciones y Triggers**: Un conjunto de scripts que incluyen vistas, procedimientos almacenados, funciones y triggers para automatizar y optimizar tareas comunes en la base de datos.

## Características

1. **Base de Datos Relacional (MySQL)**:
   - Diseño relacional que incluye tablas como `Usuarios`, `Publicaciones`, `Comentarios`, `Reacciones`, `Mensajes`, entre otras.
   - Funciones y procedimientos almacenados para facilitar el manejo de la red social.
  
2. **Base de Datos No Relacional (MongoDB)**:
   - Se utiliza MongoDB para almacenar información no estructurada o semi-estructurada, como logs de actividad y configuraciones dinámicas.
  
3. **Base de Datos en Memoria (Redis)**:
   - Implementación de Redis para manejar datos temporales como sesiones de usuario y estadísticas en tiempo real.

## Requisitos

- **MySQL**: Para gestionar la base de datos relacional.
- **MongoDB**: Para gestionar la base de datos no relacional.
- **Redis**: Para la base de datos en memoria.
- **Python**: Para integrar Redis y MongoDB con el sistema.
- **Git**: Para clonar o descargar el repositorio.
  
## Instalación

1. Clonar el repositorio:
    ```bash
    git clone https://github.com/Ronny-Abreu/RedSocial.git
    ```
   
2. Configurar MySQL, MongoDB y Redis en tu entorno local o servidor.

3. Ejecutar los scripts de SQL:
    - Crea la base de datos y tablas en MySQL.
    - Inserta los datos de ejemplo con el segundo script.

4. Para interactuar con Redis y MongoDB, instala las dependencias de Python:
    ```bash
    pip install redis
    ```

5. Ejecución de los scripts SQL para funciones avanzadas y triggers.

## Uso

Para ver cómo interactúan las bases de datos y cómo se ejecutan las consultas avanzadas, puedes probar los siguientes ejemplos:

1. **Consulta avanzada**: Obtén las publicaciones más comentadas de un usuario específico.
   
2. **Procedimiento almacenado**: Enviar un mensaje entre dos usuarios.
   
3. **Función SQL**: Obtener el historial de mensajes entre dos usuarios.

## Contribución

Si deseas contribuir al proyecto, por favor sigue estos pasos:

1. Haz un fork del repositorio.
2. Crea tu rama de características (`git checkout -b feature/nueva-funcionalidad`).
3. Realiza tus cambios.
4. Realiza un commit de tus cambios (`git commit -m 'Agrega nueva funcionalidad'`).
5. Envía tu rama (`git push origin feature/nueva-funcionalidad`).
6. Abre un pull request.

## Licencia

Este proyecto está bajo la Licencia MIT - consulta el archivo [LICENSE](LICENSE) para más detalles.
