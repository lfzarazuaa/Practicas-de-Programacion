var x = 4, y = '4'

console.log(x==y);//Comparación que devuelve true, ya que Javascript primero convierte al mismo tipo y luego compara.
console.log(x===y);//Comparación que devuelve false, ya que compara tipo de dato y valor.

var luis = {
  nombre: 'Luis'
}

var otraPersona = {
  ... luis
}

var donkan = {
   nombre: "Luis"
}

console.log(luis===otraPersona);//Son el mismo objeto y contienen el mismo tipo de dato.
console.log(luis===donkan);//Distinto objeto y mismo valor devuelve false.