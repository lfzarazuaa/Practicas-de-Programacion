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

var ids = [1,2,8,9,13,22,3,4,5,6,7]

// var promesas = ids.map(function (id) {
//   return obtenerPersonaje(id);
// })
var promesas = ids.map(id => obtenerPersonaje(id))//Método para ejecutar las solicitudes en paralelo.
Promise.all(promesas)//Procesa las promesas el orden deseado..
.then(personajes => console.log(personajes))//Método para procesar las distintas promesas.
.catch(onError);//Si hay algun error llama a la función para manejar el error.