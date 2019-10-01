var jf = require("johnny-five");
var circuito = new jf.Board();

circuito.on("ready", prender);

function prender() {
  var led = new jf.Led(9);
  var led2 = new jf.Led(13);
  led.blink(200);
  led2.blink(450);
}
