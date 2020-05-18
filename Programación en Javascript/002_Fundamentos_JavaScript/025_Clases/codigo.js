class Persona {
  constructor(nombre, apellido, altura) {
    this.nombre = nombre
    this.apellido = apellido
    this.altura = altura
  }

  saludar() {
    console.log(`Hola, me llamo ${this.nombre} ${this.apellido}`)
  }

  soyAlto() {
    return this.altura > 1.8
  }
}

class Desarrollador extends Persona{
  constructor(nombre, apellido, altura) {
    super(nombre,apellido,altura)//Llama al constructor del objeto padre.
  }

  saludar() {
    super.saludar();//Llama a la función del objeto Hijo.
    console.log(`Hola, me llamo ${this.nombre} ${this.apellido} y soy desarrollador/a`)
  }
}


var sacha = new Persona('Sacha', 'Lifszyc', 1.72)
var erika = new Persona('Erika', 'Luna', 1.65)
var arturo = new Desarrollador('Arturo', 'Martinez', 1.89)
