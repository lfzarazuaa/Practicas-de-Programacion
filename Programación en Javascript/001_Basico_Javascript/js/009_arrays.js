var frutas = ["Manzana", "Plátano", "Cereza", "Fresa"];
var longitud = frutas.length;//Calcula la longitud del array.

var primerElemento = frutas[0];

var masFrutas = frutas.push("Uvas");//Agrega mas elementos al array al final del array.

console.log(frutas)
console.log(masFrutas)

var ultimo = frutas.pop();//Elimina un elemento del array.

var nuevaLongitud = frutas.unshift("Uvas");//Agrega el elemento al inicio del array.

var borrarPrimerElemento = frutas.shift();//Elimina el primer elemento del array.

var posicion = frutas.indexOf("Plátano");//Obtener el índice del elemento buscado.
