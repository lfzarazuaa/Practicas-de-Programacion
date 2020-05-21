const API_URL="https://swapi.dev/api/"
const PEOPLE_URL = 'people/:id'
const options = { crossDomain: true}//URL externa al sitio.

const onPeopleResponse = function ({name}) {
  console.log(`Hola, yo soy ${name}`); 
}

function obtenerPersonaje(id, callback) {
    const url = `${API_URL}${PEOPLE_URL.replace(":id",id)}`
    $.get(url, options, callback).fail(function () {
      console.log(`Sucedió un error no se pudo obtener el personaje ${id}.`);      
    });
}

var id = 5;

function llamadoCallback(personaje) {
  onPeopleResponse(personaje);
  if (id<85) {
    id = id + 1;
    if (id==17) {
      id = 18;
    }
    obtenerPersonaje(id, llamadoCallback)
  }
}

obtenerPersonaje(id, llamadoCallback);

// obtenerPersonaje(1, function (personaje) {//Hasta que se recibe el personaje se ejecuta la llamada a lo siguiente a realizar.
//   onPeopleResponse(personaje);
//   obtenerPersonaje(2, function (personaje) {
//     onPeopleResponse(personaje);
//     obtenerPersonaje(3, function (personaje) {
//       onPeopleResponse(personaje);
//       obtenerPersonaje(4, function (personaje) {
//         onPeopleResponse(personaje);
//         obtenerPersonaje(5, function (personaje) {
//           onPeopleResponse(personaje);
//           obtenerPersonaje(6, function (personaje) {
//             onPeopleResponse(personaje);
//             obtenerPersonaje(7, function (personaje) {
//               onPeopleResponse(personaje);
//             });
//           });
//         });
//       });
//     });
//   });
// });
