var luis = {//Un objeto se define por clave: valor.
   nombre: "Luis Fernando",
   apellido: "Zarazua Aguilar",
   edad: 24
}

var dario = {
   nombre: "Dario",
   apellido: "Susnisky",
   edad: 28
}

function imprimirNombreEnMayusculas(persona){
   var { nombre } = persona;//Desestructra el objeto , creando una variable local nombre que contiene el valor del nombre de la persona. 
   console.log(nombre.toUpperCase());//Imprime el nombre en consola.
}

function imprimirNombreYEdad(persona) {
   var { nombre, edad } = persona;//Desestructura en nombre y edad. 
   console.log(`Hola, me llamo ${nombre} y tengo ${edad} años.`)
}

function sumarEdadObjeto(persona){
   persona.edad += 1;//Incrementa la edad en el objeto (ámbito global).
}

function sumarEdad(edad) {
   edad+=1;//Incrementa la edad en un ámbito local.   
}

function sumarEdadEnObjetoNuevo(persona) {//Paso de objeto sin modificar su valor.
   return{
      ...persona,//Crea una copia en memoria del objeto.
      edad: persona.edad + 1//Sobrescribe el valor del atributo edad.
   }
}

imprimirNombreEnMayusculas(luis)
imprimirNombreEnMayusculas(dario)
imprimirNombreEnMayusculas({nombre: "Pepito"})//Llamada a función cuando se le pasa el objeto sin declarar una variable.
imprimirNombreYEdad(luis)
imprimirNombreYEdad(dario)