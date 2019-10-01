var texto=document.getElementById("texto_lineas");
var boton=document.getElementById("botoncito");

boton.addEventListener("click",dibujoPorClick);

var d=document.getElementById('dibujito');
var ancho = d.width;
var largo = d.height;
var lienzo = d.getContext("2d");
var coordenadaCanvas = new Coordenada(0,0);
console.log(lienzo);
console.log(texto);
//dibujarLinea("red",10,300,220,10);
//dibujarLinea("yellow",300,10,10,220);
function DibujarParabola(lineas){
  var l=0;
  var yi,xf;
  var colorcito="#00BEBE";
  coordenadaCanvas.Calcular(20,20);
  alert("Punto en x="+coordenadaCanvas.xCanvas+"\nPunto en y="+coordenadaCanvas.yCanvas);
  for(l = 0;l < lineas; l++){
    xf=(ancho/lineas)*(l+1);
    yi=(largo/lineas)*l;
    dibujarLinea(colorcito,0,yi,xf,largo);
  }

  dibujarLinea("black",1,largo,ancho-1,largo-1);
  dibujarLinea("black",1,1,1,largo);
}

function DibujarCirculo(puntos) {
  var lim=150,i=0;
  lim=puntos;
  var xi1,yi1,xf1,yf1,xi2,yi2,xf2,yf2;
  var xi3,yi3,xf3,yf3,xi4,yi4,xf4,yf4;
  inc=5;
  while(i<=lim){
    //Cuadrante 1
    xi1=lim*2;
    yi1=lim-i;
    xf1=lim*2-i;
    yf1=0;
    dibujarLinea("orange",xi1,yi1,xf1,yf1);
    //Cuadrante 2
    xi2=lim-i;
    yi2=0;
    xf2=0;
    yf2=i;
    dibujarLinea("green",xi2,yi2,xf2,yf2);
    //Cuadrante 3
    xi3=0;
    yi3=i+lim;
    xf3=i;
    yf3=lim*2;
    dibujarLinea("red",xi3,yi3,xf3,yf3);
    //Cuadrante 4
    xi4=lim*2;
    yi4=i+lim;
    xf4=lim*2-i;
    yf4=lim*2;
    dibujarLinea("black",xi4,yi4,xf4,yf4);
    i=i+inc;
  }
  dibujarLinea("black",1,1,lim*2,1);
  dibujarLinea("black",1,1,1,lim*2);
  dibujarLinea("black",lim*2,lim*2,lim*2,1);
  dibujarLinea("black",lim*2,lim*2,1,lim*2);
}

function dibujoPorClick() {
  var x=parseInt(texto.value);
  lienzo.clearRect(0, 0, ancho, largo);
  if (x>=0 && x<=150){
    DibujarParabola(x);
  }
  else{
    alert("Ingrese un número entre 20 y 300")
  }
}

function dibujarLinea(color,xi,yi,xf,yf) {
  lienzo.beginPath();//Agarrar el lapiz
  lienzo.strokeStyle = color;//Línea roja.
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

Coordenada.prototype.Calcular = function(x,y) {
  this.xCanvas = ancho/2+x;
  this.yCanvas = largo/2-x;
};
