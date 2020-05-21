class Persona {
  constructor(nombre, apellido, altura) {
    this.nombre = nombre
    this.apellido = apellido
    this.altura = altura
  }

  saludar(responder) {
    var {nombre, apellido} = this;//Desustructra el objeto para recibir los parámetros nombre y apellido.
    console.log(`Hola, me llamo ${nombre} ${apellido}`)
    if (responder) {//Verifica que se le haya pasado el parámetro.
      responder(nombre,apellido);
    }
  }

  soyAlto() {
    return this.altura > 1.8
  }
}

class Desarrollador extends Persona{
  constructor(nombre, apellido, altura) {
    super(nombre,apellido,altura)//Llama al constructor del objeto padre.
  }

  saludar(responder) {
    var {nombre, apellido} = this;//Desustructra el objeto para recibir los parámetros nombre y apellido.
    console.log(`Hola, me llamo ${this.nombre} ${this.apellido} y soy desarrollador/a`)
    responder(nombre,apellido,true);
  }
}

function responderSaludo(nombre, apellido, esDev) {
  console.log(`Buen día ${nombre} ${apellido}`)
  if (esDev) {
    console.log("Ah mirá, no sabía que eras desarrollador.");
  }
}

var sacha = new Persona('Sacha', 'Lifszyc', 1.72)
var erika = new Persona('Erika', 'Luna', 1.65)
var arturo = new Desarrollador('Arturo', 'Martinez', 1.89)

sacha.saludar();
erika.saludar(responderSaludo);
arturo.saludar(responderSaludo);