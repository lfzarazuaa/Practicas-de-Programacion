var luis = {//Un objeto se define por clave: valor.
   nombre: "Luis Fernando",
   apellido: "Zarazua Aguilar",
   edad: 24
}

var dario = {
   nombre: "Dario",
   apellido: "Susnisky",
   edad: 24
}

function imprimirNombreEnMayusculas({ nombre }){//Del objeto que se le pase obtiene el atributo nombre.
   console.log(nombre.toUpperCase());//Imprime el nombre en consola.
}

imprimirNombreEnMayusculas(luis)
imprimirNombreEnMayusculas(dario)
imprimirNombreEnMayusculas({nombre: "Pepito"})//Llamada a función cuando se le pasa el objeto sin declarar una variable.