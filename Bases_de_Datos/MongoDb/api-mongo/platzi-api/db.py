from bson.json_util import dumps, ObjectId
from flask import current_app
from pymongo import MongoClient, DESCENDING
from werkzeug.local import LocalProxy


# Este método se encarga de configurar la conexión con la base de datos
def get_db():
    platzi_db = current_app.config['PLATZI_DB_URI']
    client = MongoClient(platzi_db)
    return client.platzi


# Use LocalProxy to read the global db instance with just `db`
db = LocalProxy(get_db)


def test_connection():
    return dumps(db.collection_names())


def collection_stats(collection_nombre):
    return dumps(db.command('collstats', collection_nombre))

# -----------------Carreras-------------------------

#Crear carrera C.
def crear_carrera(json):
    return str(db.carreras.insert_one(json).inserted_id)

#Leer carrera R.
def consultar_carrera_por_id(carrera_id):
    return dumps(db.carreras.find_one({'_id': ObjectId(carrera_id)}))#dumps convierte de bson a json.

#Actualizar carrera U.
def actualizar_carrera(carrera):
    # Esta función solamente actualiza nombre y descripción de la carrera
    return str(db.carreras.update_one( { '_id': ObjectId(carrera['_id'])} , {'$set': { 'nombre': carrera['nombre'], 'descripcion': carrera['descripcion']} } ).modified_count)

#Borrar carrera D.
def borrar_carrera_por_id(carrera_id):
    #Borra el objeto conforme al filtro.
    return str(db.carreras.delete_one({'_id': ObjectId(carrera_id)}).deleted_count)


# Clase de operadores
def consultar_carreras(skip, limit):
    return dumps(db.carreras.find({}).skip(int(skip)).limit(int(limit)))


def agregar_curso(json):
    curso = consultar_curso_por_id_proyeccion(json['id_curso'], proyeccion={'nombre': 1}) #Solo guarda en carreras el nombre y el id de la clase.
    return str(db.carreras.update_one({'_id': ObjectId(json['id_carrera'])}, {'$addToSet': {'cursos': curso } }).modified_count)#Agrega el curso en la colección de carreras.

def borrar_curso_de_carrera(json):
    return str(db.carreras.update_one({'_id': ObjectId(json['id_carrera'])}, {'$pull': {'cursos': {'_id': ObjectId( json['id_curso'] ) } } } ).modified_count) #Pull saca un elemento de la pila.

# -----------------Cursos-------------------------

#Crear Curso C.
def crear_curso(json):
    return str(db.cursos.insert_one(json).inserted_id)


def consultar_curso_por_id(id_curso):
    return dumps(db.cursos.find_one({'_id': ObjectId(id_curso)}))#dumps convierte de bson a json.


def actualizar_curso(curso):
    # Esta función solamente actualiza nombre, descripcion y clases del curso
    return str(db.cursos.update_one( { '_id': ObjectId(curso['_id'])}, {'$set': {'nombre': curso['nombre'], 'descripcion': curso['descripcion'], 'clases': curso['clases']} }).modified_count)

def borrar_curso_por_id(curso_id):
    return str(db.cursos.delete_one({'_id': ObjectId(curso_id)}).deleted_count)


def consultar_curso_por_id_proyeccion(id_curso, proyeccion=None):
    return db.cursos.find_one({'_id': ObjectId(id_curso)}, proyeccion)#Regresa el curso solo con los campos indicados.


def consultar_curso_por_nombre(nombre):
    return dumps(db.cursos.find({'$text': {'$search': nombre}}))

