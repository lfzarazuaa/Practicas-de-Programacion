var nombre = "Luis"; var apellido="Zarazua";//Punto y coma para separar 2 declaraciones.

console.log("Hola mi nombre es Luis");//Es necesario punto y coma para separar entre una expresión y un array.
[1, 2 , 3].forEach(n => console.log(n*2));

console.log("Hola mi nombre es Luis");//Es necesario punto y coma para separar entre una expresión y un string.
`${nombre} es un desarrollador.`

function calcularDoble(numero) {
  return {//Despues de un return no puede ir un enter pues lo detecta como punto y coma.
    original: numero, doble: numero * 2
  }
}