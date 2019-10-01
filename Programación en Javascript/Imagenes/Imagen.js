var vp = document.getElementById('villaplatzi');
var lienzo = vp.getContext("2d");

var fondo = new Image();//Empieza en mayuscula porque es una imagen.
fondo.src = "tile.png";
var vaca = new Image();//Empieza en mayuscula porque es una imagen.
vaca.src = "vaca.png";
var cerdo = new Image();//Empieza en mayuscula porque es una imagen.
cerdo.src = "cerdo.png";
var pollo = new Image();//Empieza en mayuscula porque es una imagen.
pollo.src = "pollo.png";
pollo.addEventListener("load",dibujarMapa);

function dibujarMapa(){
  lienzo.drawImage(fondo,0,0);//imagen,origenx,origeny.
  var min=2, max=8;
  var vacas=numeroAleatorio(min,max);
  var cerdos=numeroAleatorio(min,max);
  var pollos=numeroAleatorio(min,max);
  var total=parseInt(vacas+cerdos+pollos);
  total=parseInt(total**(Math.sqrt(max)/2));
  console.log(total);
  //
  ancho=vp.width;
  largo=vp.height;
  var minX=0,maxX=(ancho-80)/total,minY=0,maxY=(largo-80)/total;
  var coordx,coordy,i;
  for (i = 0; i < vacas; i++) {
    dibujarImagen(vaca,minX,maxX,minY,maxY,total);
  }
  for (i = 0; i < cerdos; i++) {
    dibujarImagen(cerdo,minX,maxX,minY,maxY,total);
  }
  for (i = 0; i < pollos; i++) {
    dibujarImagen(pollo,minX,maxX,minY,maxY,total);
  }
  var texto="vacas=" + vacas + ",cerdos=" + cerdos + ",pollos=" + pollos;
  document.getElementById("parrafo").innerHTML = texto;
  //document.write("vacas=" + vacas + " ,cerdos=" + cerdos + " ,pollos=" + pollos);
  //lienzo.drawImage(vaca,20,20);//imagen,origenx,origeny.
  //lienzo.drawImage(cerdo,60,60);//imagen,origenx,origeny.
  //lienzo.drawImage(pollo,120,120);//imagen,origenx,origeny.
}
function dibujarImagen(imagen,minX,maxX,minY,maxY,total) {
  coordx=numeroAleatorio(minX,maxX)*total,coordy=numeroAleatorio(minY,maxY)*total;
  lienzo.drawImage(imagen,coordx,coordy);//imagen,origenx,origeny.
}
function numeroAleatorio(min,max){
 return Math.floor(Math.random()*(max-min+1)+min);
}
