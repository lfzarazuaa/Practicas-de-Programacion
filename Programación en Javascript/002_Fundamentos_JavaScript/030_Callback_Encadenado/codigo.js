const API_URL="https://swapi.dev/api/"
const PEOPLE_URL = 'people/:id'
const options = { crossDomain: true}//URL externa al sitio.

const onPeopleResponse = function ({name}) {
  console.log(`Hola, yo soy ${name}`); 
}

function obtenerPersonaje(id, callback) {
  if(id>0 && id<80){
    const url = `${API_URL}${PEOPLE_URL.replace(":id",id)}`
    $.get(url, options, onPeopleResponse);
  }
  if (callback){
    callback();
  }
}

//No se sabe cual se ejecutará primero pues son llamadas al servidor.
obtenerPersonaje(1, function () {//Se usa function en vez de la función invocada para que se pase como parámetro y despues se indique cuando ser llamada.
  obtenerPersonaje(2, function () {
    obtenerPersonaje(3, function () {
      obtenerPersonaje(4, function () {
        obtenerPersonaje(5, function () {
          obtenerPersonaje(6, function () {
            obtenerPersonaje(7);
          });
        });
      });
    });
  });
});


