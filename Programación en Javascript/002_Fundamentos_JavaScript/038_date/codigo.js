function diasEntreFechas(fecha1, fecha2) {
  const unDia = 1000 * 60 * 60 * 24;//Definir milisegundos en un día.
  const diferencia = Math.abs(fecha1-fecha2);//Fecha 1 y fecha 2.
  console.log(diferencia);
  return Math.floor(diferencia/unDia);
}

const hoy = new Date();//Nos da un objeto con la fecha actual.
var nacimiento = new Date(1996,2,06);//Nos da un objeto con la fecha establecida.

var edad=Math.floor(diasEntreFechas(nacimiento,hoy)/365);