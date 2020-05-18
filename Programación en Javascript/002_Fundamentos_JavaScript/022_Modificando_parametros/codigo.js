function Persona(nombre, apellido, altura) {//Declaración de clase.
  this.nombre = nombre;
  this.apellido = apellido;
  this.altura = altura;
}

Persona.prototype.saludar = () => console.log(`Hola, me llamo ${this.nombre} ${this.apellido}`)

Persona.prototype.soyAlto = () => {//Declaración del método soy Alto.
  const Umbral_de_Altua=1.8
  return this.altura>=Umbral_de_Altua;
}

var luis = new Persona('Luis Fernando', 'Zarazua Aguilar', 1.75);

var erika = new Persona('Erika', 'Luna', 1.82);

var arturo = new Persona('Arturo', 'Martinez', 1.65);

