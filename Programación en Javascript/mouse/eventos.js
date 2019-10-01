//alert("Conectado");
document.addEventListener("mousedown", presionarMouse);
document.addEventListener("mousemove", moverMouse);
document.addEventListener("mouseup", soltarMouse);

var d=document.getElementById('area_de_dibujo');
var coords = d.getBoundingClientRect();
var ox = parseInt(coords.x);
var oy = parseInt(coords.y);
var presionado=false;
var ancho = d.width;
var largo = d.height;
var colorcito="#00BEBE";
var lienzo = d.getContext("2d");
var xrel,yrel,xi,yi,xf,yf;
console.log(coords);
dibujarLinea(colorcito,0,0,ancho,largo);

function presionarMouse(eventoMouse) {
  presionado=true;
  xi=xrel;
  yi=yrel;
  xf=xrel;
  yf=yrel;
}
function moverMouse(eventoMouse) {
  var x = eventoMouse.clientX;
  var y = eventoMouse.clientY;
  xrel = x-ox;
  yrel = y-oy;
  var coor = "X coords: " + x + ", Y coords: " + y +
             "X offset: " + ox + ", Y offset: " + oy +
             "X relativa: " + xrel + ", Y relativa: " + yrel;
  document.getElementById("parrafo").innerHTML = coor;
  if (presionado){
    xi=xf;
    yi=yf;
    xf=xrel;
    yf=yrel;
    dibujarLinea(colorcito,xi,yi,xf,yf);
  }
}
function soltarMouse(eventoMouse) {
  presionado=false;
}
function dibujarTeclado(evento) {
  //console.log("Tecla oprimida");
  //console.log(evento);
  tecla=event.keyCode;
  // if (tecla==teclas.UP) {
  //   console.log("tecla arriba");
  // }
  // if (tecla==teclas.DOWN) {
  //   console.log("tecla abajo");
  // }
  // if (tecla==teclas.LEFT) {
  //   console.log("tecla izquierda");
  // }
  // if (tecla==teclas.RIGHT) {
  //   console.log("tecla derecha");
  // }
  switch (tecla) {
    case teclas.UP:
        console.log("tecla arriba");
        xi=punto.xCanvas;
        yi=punto.yCanvas;
        punto.moverArriba(inc);
        dibujarLinea(colorcito,xi,yi,punto.xCanvas,punto.yCanvas);
      break;
    case teclas.DOWN:
        console.log("tecla abajo");
        xi=punto.xCanvas;
        yi=punto.yCanvas;
        punto.moverAbajo(inc);
        dibujarLinea(colorcito,xi,yi,punto.xCanvas,punto.yCanvas);
      break;
    case teclas.LEFT:
        console.log("tecla izquierda");
        xi=punto.xCanvas;
        yi=punto.yCanvas;
        punto.moverIzquierda(inc);
        dibujarLinea(colorcito,xi,yi,punto.xCanvas,punto.yCanvas);
      break;
    case teclas.RIGHT:
        console.log("tecla derecha");
        xi=punto.xCanvas;
        yi=punto.yCanvas;
        punto.moverDerecha(inc);
        dibujarLinea(colorcito,xi,yi,punto.xCanvas,punto.yCanvas);
      break;
    default:
      console.log("otra tecla");
  }
  console.log(punto);
}

function dibujarLinea(color,xi,yi,xf,yf) {
  lienzo.beginPath();//Agarrar el lapiz
  lienzo.strokeStyle = color;//Línea roja.
  lienzo.lineWidth = 3;//Línea roja.
  lienzo.moveTo(xi,yi);//Punto de origen.
  lienzo.lineTo(xf,yf);//Punto final.
  lienzo.stroke();//Dibujar.
  lienzo.closePath();//Levantar el lapiz.
}

function VerificarLimites(x,y) {
  if (x<0){
    x=0;
  }
  else if (x>ancho) {
    x=ancho;
  }
  if (y<0){
    y=0;
  }
  else if (y>largo) {
    y=largo;
  }
}
