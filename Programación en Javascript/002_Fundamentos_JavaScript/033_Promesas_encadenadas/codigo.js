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

obtenerPersonaje(1).then(function (personaje) {//Data (el parámetro de resolve), es el parámetro recibido en esta función.
  console.log(`El personaje 1 es ${personaje.name}`);
  return obtenerPersonaje(2);//Regresa una nueva promesa encadenándolas de tal forma.
})
.then(function (personaje) {
  console.log(`El personaje 2 es ${personaje.name}`);
  return obtenerPersonaje(3);//Regresa una nueva promesa encadenándolas de tal forma.
}).then(function (personaje) {
  console.log(`El personaje 3 es ${personaje.name}`);
  return obtenerPersonaje(4);//Regresa una nueva promesa encadenándolas de tal forma.
}).then(function (personaje) {
  console.log(`El personaje 4 es ${personaje.name}`);
  return obtenerPersonaje(5);//Regresa una nueva promesa encadenándolas de tal forma.
}).then(function (personaje) {
  console.log(`El personaje 5 es ${personaje.name}`);
  return obtenerPersonaje(6);//Regresa una nueva promesa encadenándolas de tal forma.
}).then(function (personaje) {
  console.log(`El personaje 6 es ${personaje.name}`);
  return obtenerPersonaje(17);//Regresa una nueva promesa encadenándolas de tal forma.
}).then(function (personaje) {
  console.log(`El personaje 17 es ${personaje.name}`);
}).catch(function (id) {//Id es un parámetro que se envió en reject.
  onError(id);
})

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
