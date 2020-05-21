var nombre = "Luis", edad = 28

function imprimirEdad(nombre, edad) {
   console.log(`${nombre} tiene ${edad} años`);
}

imprimirEdad(nombre, edad);
imprimirEdad("Vicky", 28);
imprimirEdad("Eric", 24);
imprimirEdad("Darío", 27);
imprimirEdad(25, "Carlos");//Javascript no le encuentra sentido al tipo de datos si no se le específica.
imprimirEdad();//Sin párametros nos deja las variables con valor undefined.
