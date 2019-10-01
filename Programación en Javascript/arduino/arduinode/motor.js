var cinco = require("johnny-five");
var circuito = new cinco.Board();
var bombillo, motorcito, celda;

circuito.on("ready", prender);

function prender() {
  var configuracion ={pin:"A0", freq: 50};
  celda = new cinco.Sensor(configuracion);

  bombillo = new cinco.Led(13);
  bombillo.blink(200);

  motorcito = new cinco.Servo(9);
  motorcito.to(90);

  ondear();
}
var turno;
function ondear() {//funcion recursiva
  console.log("Luz: " + celda.value);
  var luz = celda.value;
  if (luz>800) {
    if(turno == 1){
      turno = 0;
      motorcito.to(70);
    }
    else {
      turno = 1;
      motorcito.to(110);
    }
  } else {
    motorcito.to(10);
  }
  setTimeout(ondear,1000);
}
