class Billete {
  constructor(valor,cantidad) {
    this.valor = valor;
    this.cantidad = cantidad
  }
}

class Cajero {
  constructor() {
    this.caja = [];
    this.caja.push(new Billete(500,150));
    this.caja.push(new Billete(200,150));
    this.caja.push(new Billete(100,200));
    this.caja.push(new Billete(50,150));
    this.caja.push(new Billete(20,200));
    this.caja.push(new Billete(10,300));
    this.entregado = [];
    this.dinero = 0;
    this.div = 0;//division
    this.papeles = 0;
  }

  entregarDinero(dinero) {
    this.entregado = [];
    this.dinero = dinero;
    this.div = 0;//division
    this.papeles = 0;
    for (var bi of this.caja) {
      //if (this.dinero>0){
        this.div=Math.floor(this.dinero/bi.valor);
        if (this.div<bi.cantidad){
          this.papeles=this.div;
        } else {
          this.papeles=bi.cantidad;
        }
        this.entregado.push(new Billete(bi.valor,this.papeles));
        this.dinero-=bi.valor*this.papeles
      //}
    }
    var mensaje="",texto,e;
    if (this.dinero>0){
      mensaje="No se disponen de los billetes para dar esa cantidad.";
    }
    else{
      for (var i in this.entregado) {
        e=this.entregado[i];
        this.caja[i].cantidad-=e.cantidad;
        if (e.cantidad>1){
          texto=e.cantidad + " billetes de $" + e.valor + "<br/>";
        }
        else if (e.cantidad>0) {
          texto=e.cantidad + " billete de $" + e.valor + "<br/>";
        }
        else{
          texto="";
        }
        mensaje=mensaje+texto;
      }
    }
    return mensaje;
  }

  mostrarEstado(){
    var mensaje="",texto;
    for (var e of this.caja) {
      if (e.cantidad==1){
        texto=e.cantidad + " billete de $" + e.valor + "<br/>";
      }
      else {
        texto=e.cantidad + " billetes de $" + e.valor + "<br/>";
      }
      mensaje=mensaje+texto;
    }
    return mensaje
  }
}

var t=document.getElementById('monto');
var b = document.getElementById("Extraer");
var cajero=new Cajero();
b.addEventListener("click",entregarDinero);
var estado = document.getElementById("Estado");
var resultado = document.getElementById("Resultado");
estado.innerHTML=cajero.mostrarEstado();
function entregarDinero() {
  d=parseInt(t.value);
  if (!Number.isNaN(d)){
  resultado.innerHTML=cajero.entregarDinero(d);
  estado.innerHTML=cajero.mostrarEstado();}
}
