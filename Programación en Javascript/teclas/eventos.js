//alert("Conectado");
document.addEventListener("keyup",dibujarTeclado);

var d=document.getElementById('area_de_dibujo');
var ancho = d.width;
var largo = d.height;
var colorcito="#00BEBE";
var lienzo = d.getContext("2d");
var inc = 10;
var punto = new Coordenada(0,0);
var tecla;
var teclas = { //Objeto JSON
  UP: 38,
  DOWN: 40,
  LEFT: 37,
  RIGHT: 39
};

console.log(teclas);


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

function Coordenada(x,y) {
  this.xCartesiana = x;
  this.yCartesiana = y;
  this.xCanvas = ancho/2+x;
  this.yCanvas = largo/2-x;
}

Coordenada.prototype.moverIzquierda = function(inc) {
  this.xCartesiana-=inc;
  this.xCanvas = ancho/2+this.xCartesiana;
  this.VerificarLimites();
};

Coordenada.prototype.moverDerecha = function(inc) {
  this.xCartesiana+=inc;
  this.xCanvas = ancho/2+this.xCartesiana;
  this.VerificarLimites();
};

Coordenada.prototype.moverArriba = function(inc) {
  this.yCartesiana+=inc;
  this.yCanvas = largo/2-this.yCartesiana;
  this.VerificarLimites();
};

Coordenada.prototype.moverAbajo = function(inc) {
  this.yCartesiana-=inc;
  this.yCanvas = largo/2-this.yCartesiana;
  this.VerificarLimites();
};

Coordenada.prototype.VerificarLimites = function() {
  if (this.xCanvas<0){
    this.xCanvas=0;
    this.xCartesiana=-ancho/2;
  }
  else if (this.xCanvas>ancho) {
    this.xCanvas=ancho;
    this.xCartesiana = ancho/2;
  }
  if (this.yCanvas<0){
    this.yCanvas=0;
    this.yCartesiana=largo/2;
  }
  else if (this.yCanvas>largo) {
    this.yCanvas=largo;
    this.yCartesiana = -largo/2;
  }
};

Coordenada.prototype.Calcular = function(x,y) {
  this.xCanvas = ancho/2+x;
  this.yCanvas = largo/2-x;
};
