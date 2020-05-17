var nombre = "Luis"//Alcance global.

function imprimirNombreEnMayusculas(nombre) {//Parámetro local.
   nombre = nombre.toUpperCase();//Escribe solo en el alcance local.
   console.log(nombre);
}

imprimirNombreEnMayusculas()