var luis = {
  nombre: 'Luis',
  apellido: 'Lifszyc',
  edad: 28,
  peso: 75
}

console.log(`Al inicio del año ${luis.nombre} pesa ${luis.peso}kg`)

// function aumentarDePeso (persona) {
//   return persona.peso += 200
// }
const INCREMENTO_PESO = 0.2
const DIAS_DEL_ANIO = 365

const aumentarDePeso = persona => persona.peso += INCREMENTO_PESO //Arrow function para aumentar de peso.
const adelgazar = persona => persona.peso -= INCREMENTO_PESO //Arrow function para aumentar de peso.

for (var i = 1; i <= DIAS_DEL_ANIO; i++) {
  var random = Math.random()

  if (random < 0.25) {//Si el número es menor a 0.25.
    aumentarDePeso(luis)
  } else if (random < 0.5) {//Si está entre 0.25 y 0.5.
    adelgazar(luis)
  }
}

console.log(`Al final del año ${luis.nombre} pesa ${luis.peso.toFixed(1)}kg`)