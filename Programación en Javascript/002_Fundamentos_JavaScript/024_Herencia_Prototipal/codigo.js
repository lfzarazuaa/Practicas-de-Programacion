function heredaDe(prototipoHijo, prototipoPadre) {
  var fn = function () {}//Declara la función a sobreescribir.
  fn.prototype = prototipoPadre.prototype//Asigna el prototipo del padre a la función
  prototipoHijo.prototype = new fn//Asigna una nueva instacia de prototipo a la clase Hija usando la misma de clase padre.
  prototipoHijo.prototype.constructor = prototipoHijo//Define que no compartan el mismo constructor el padre y el hijo.
}

function Persona(nombre, apellido, altura) {
  this.nombre = nombre
  this.apellido = apellido
  this.altura = altura
}

Persona.prototype.saludar = function () {
  console.log(`Hola, me llamo ${this.nombre} ${this.apellido}`)
}

Persona.prototype.soyAlto = function () {
  return this.altura > 1.8
}

function Desarrollador(nombre, apellido) {
  this.nombre = nombre
  this.apellido = apellido
}

heredaDe(Desarrollador, Persona)//Se debe invocar antes de declarar nuevos métodos de la clase.

Desarrollador.prototype.saludar = function () {
  console.log(`Hola, me llamo ${this.nombre} ${this.apellido} y soy desarrollador/a`)
}

var sacha = new Persona('Sacha', 'Lifszyc', 1.72)
var erika = new Persona('Erika', 'Luna', 1.65)
var arturo = new Persona('Arturo', 'Martinez', 1.89)
