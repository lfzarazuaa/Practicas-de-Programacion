const API_URL="https://swapi.dev/api/"
const PEOPLE_URL = 'people/:id'
const options = { crossDomain: true}//URL externa al sitio.

const onPeopleResponse = function ({name}) {
  console.log(`Hola, yo soy ${name}`); 
}

function obtenerPersonaje(id) {
  if(id>0 && id<80){
    const url = `${API_URL}${PEOPLE_URL.replace(":id",id)}`
    $.get(url, options, onPeopleResponse);
  }
}

//No se sabe cual se ejecutará primero pues son llamadas al servidor.
obtenerPersonaje(1);
obtenerPersonaje(2);
obtenerPersonaje(3);
obtenerPersonaje(4);
obtenerPersonaje(5);
obtenerPersonaje(6);

