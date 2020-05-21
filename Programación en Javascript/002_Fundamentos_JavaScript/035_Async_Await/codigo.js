const API_URL="https://swapi.dev/api/"
const PEOPLE_URL = 'people/:id'
const options = { crossDomain: true}//URL externa al sitio.

const onPeopleResponse = function ({name}) {
  console.log(`Hola, yo soy ${name}`); 
}

function obtenerPersonaje(id) {//Obtener personaje regresa una promesa como resultado
    return new Promise(function (resolve,reject) {
      const url = `${API_URL}${PEOPLE_URL.replace(":id",id)}`
      $.get(url, options, function (data) {
        resolve(data);//Resolve se manda a llamar hasta que el get devuelva un resultado exitoso.
      }).fail(() => reject(id))//En caso de error ejecuta reject.
    })
}

function onError(id) {
  console.log(`Sucedió un error al obtener el personaje ${id}.`);
  
}

async function obtenerPersonajes() {//Async permite hacer una función asíncrona, lo que signifca que cuando no pueda seguir por falta de datos se espera, dejando hacer tareas en el código, luego retoma la función.
  var ids = [1,2,8,9,13,22,3,4,5,6,7]
  var promesas = ids.map(id => obtenerPersonaje(id))//Método para ejecutar las solicitudes en paralelo.
  try {//Con await detiene la ejecución de la función hasta que todas las solucitudes tienen una respuesta.
    //Regresa objeto con los disintos resultados de las peticiones.
    var personajes = await Promise.all(promesas); //Cuando todas las promesas se resulevan guardar el resultado en personajes.
  } catch (id) {//En caso de tener un id incorrecto.
    onError(id);//Muestra el error.
  }
}

