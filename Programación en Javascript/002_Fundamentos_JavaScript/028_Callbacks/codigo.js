const API_URL="https://swapi.dev/api/"
const PEOPLE_URL = 'people/:id'

const lukeUrl = `${API_URL}${PEOPLE_URL.replace(":id",1)}`
const options = { crossDomain: true}//URL externa al sitio.
//Para hacer un request con Jquery se llamá al método $.get
$.get(lukeUrl, options, function (data) {//Ejecución de la petición hhtp, se pasa url, opcion y función para procesar datos.
  console.log(`Hola yo soy: ${data.name}`);
})

