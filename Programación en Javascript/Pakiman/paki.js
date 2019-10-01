var cauchin= new Pakiman("Cauchin",100,30);
var pokacho= new Pakiman("Pokacho",80,50);
var tocinauro= new Pakiman("Tocinauro",120,40);
var coleccion = [cauchin,pokacho];
coleccion.push(tocinauro);
// coleccion.pop();
// for (var i = 0; i < coleccion.length; i++) {
//   coleccion[i].mostrar();
// }
// for (var p in coleccion) {
//   coleccion[p].mostrar();
// }
for (p of coleccion) {
  p.mostrar();
}
// pokacho.mostrar();
// cauchin.mostrar();
// tocinauro.mostrar();
// console.log(cauchin,pokacho,tocinauro);
// pokacho.hablar();
// var cajitas = ["Hola",1,cauchin];
// cajitas.push("ultimo");
// cajitas["nombre"]="Platzi";
// console.log(cajitas);
