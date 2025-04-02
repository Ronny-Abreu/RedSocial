# BASE DE DATOS EN MEMORIA UTILIZANDO REDIS
# Este código crea una base de datos en memoria utilizando Redis para almacenar usuarios, publicaciones, comentarios, reacciones, amistades y mensajes.

# pip install redis
import redis

def create_redis_db():
    r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
    
    # Insertacion usuarios ya existentes
    r.hset("user:1", mapping={"nombre": "Juan", "username": "juan123", "correo": "juan@example.com", "estado": "activo"})
    r.hset("user:2", mapping={"nombre": "Ana", "username": "ana456", "correo": "ana@example.com", "estado": "activo"})
    
    # Insertacion una publicación ya existente
    r.hset("post:1", mapping={"usuario_id": "1", "contenido": "Hola mundo!", "privacidad": "público"})
    
    # Insertacion un comentario ya existente
    r.hset("comment:1", mapping={"usuario_id": "2", "publicacion_id": "1", "contenido": "¡Genial!"})
    
    # Insertacion una reacción ya existente
    r.hset("reaction:1", mapping={"usuario_id": "2", "publicacion_id": "1", "tipo": "Me gusta"})
    
    # Insertacion de amistad ya existente
    r.sadd("friendship:1:2", "aceptado")
    
    # Insertacion de mensaje ya existente
    r.hset("message:1", mapping={"remitente_id": "1", "destinatario_id": "2", "contenido": "Hola Ana!"})
    
    print("Base de datos en Redis creada con éxito.")

create_redis_db()
