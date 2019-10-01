var imagenes = []
imagenes["Cauchin"] = "vaca.png";
imagenes["Pokacho"] = "pollo.png";
imagenes["Tocinauro"] = "cerdo.png";

class Pakiman {
  constructor(nombre,vida,ataque) {
    this.imagen = new Image();
    this.nombre = nombre;
    this.vida = vida;
    this.ataque = ataque;
    this.tipo = "tierra";
    this.imagen.src = imagenes[this.nombre];
  }
  hablar(){
    alert(this.nombre);
  }
  mostrar(){
    document.body.appendChild(this.imagen);//muestra la imagen en pantalla.
    document.write("<p>");
    document.write("<strong>" + this.nombre + "</strong><br/>");
    document.write("<i> Vida:" + this.vida + "</i><br/>");
    document.write("<i> Ataque:" + this.ataque + "</i><br/>");
    document.write("</p>");
  }
}
