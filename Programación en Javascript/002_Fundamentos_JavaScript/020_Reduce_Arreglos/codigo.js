var sacha = {
  nombre: 'Sacha',
  apellido: 'Lifszyc',
  altura: 1.72,
  cantidadDeLibros: 111
}

var alan = {
  nombre: 'Alan',
  apellido: 'Perez',
  altura: 1.86,
  cantidadDeLibros: 78
}

var martin = {
  nombre: 'Martin',
  apellido: 'Gomez',
  altura: 1.85,
  cantidadDeLibros: 132
}

var dario = {
  nombre: 'Dario',
  apellido: 'Juarez',
  altura: 1.71,
  cantidadDeLibros: 90
}

var vicky = {
  nombre: 'Vicky',
  apellido: 'Zapata',
  altura: 1.56,
  cantidadDeLibros: 91
}

var paula = {
  nombre: 'Paula',
  apellido: 'Barros',
  altura: 1.76,
  cantidadDeLibros: 182
}

const esAlta = ({ altura }) => altura > 1.8

var personas = [sacha, alan, martin, dario, vicky, paula]

var personasAltas = personas.filter(esAlta)
// var personasAltas = personas.filter(function (persona) {
//   return persona.altura > 1.8
// })

// persona.altura = persona.altura * 100
const pasarAlturaACms = persona => ({//Se usan los () para encerrar el objeto que se devuelve.
  ...persona,
  altura: persona.altura * 100
})

var personasCms = personas.map(pasarAlturaACms)

const calcularAltura = (acum, {altura}) => {
  return acum + altura
}

VALOR_INICIAL=0
var alturaTotal = personas.reduce(calcularAltura,VALOR_INICIAL)//Se le pasa la función a ejecutar y la altura inicial.

const reducer = (acum, { cantidadDeLibros }) => acum + cantidadDeLibros

var totalDeLibros = personas.reduce(reducer, 0)

console.log(alturaTotal)
console.log(totalDeLibros)