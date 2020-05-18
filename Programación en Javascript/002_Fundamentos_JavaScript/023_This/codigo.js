function Persona(nombre, apellido, altura) {//Declaración de clase.
  this.nombre = nombre;
  this.apellido = apellido;
  this.altura = altura;
}

Persona.prototype.saludar = function () {//Declaración del método de una clase.
  console.log(`Hola, me llamo ${this.nombre} ${this.apellido}`)
}

Persona.prototype.soyAlto = function () {//Declaración del método soy Alto.
  const Umbral_de_Altura=1.8
  return this.altura>=Umbral_de_Altura;
}

Persona.prototype.Ambito_global = () => console.log(this) //Regresa window.

var luis = new Persona('Luis Fernando', 'Zarazua Aguilar', 1.75);

var erika = new Persona('Erika', 'Luna', 1.82);

var arturo = new Persona('Arturo', 'Martinez', 1.65);

console.log(this)//Apunta al objeto window.
