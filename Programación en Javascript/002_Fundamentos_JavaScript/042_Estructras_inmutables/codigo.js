var luis = {
  nombre: "Luis",
  apellido: "Zarazua",
  edad: 24
}

function sumarEdad(persona) {
  persona.edad++;//Incrementa la edad
  return persona
}

function sumarEdadInmutable(persona){
  return ({
  ...persona,
  edad: persona.edad +1  
  })
}

const persona1 = sumarEdadInmutable(luis)
console.log(persona1);
console.log(luis);
const persona2 = sumarEdad(luis)
console.log(persona2);
console.log(luis);