var valorBilletes = [50,20,10];
var cantidadBilletes = [10,12,5];
var entregaBilletes = [0,0,0];
var cantidadBilletesCopia = cantidadBilletes;
var monto=260;

for (var i in valorBilletes) {
    var totalBilletes=cantidadBilletes[i];
    billetesNecesitados=Math.floor(monto/valorBilletes[i]);
    console.log("billetes necesitados ="+billetesNecesitados);
    if (billetesNecesitados<=totalBilletes){
      entregaBilletes[i]=billetesNecesitados;
      cantidadBilletes[i]-=billetesNecesitados;
    } else {
      entregaBilletes[i]=cantidadBilletes[i];
      cantidadBilletes[i]=0;
    }
    console.log("entregaBilletes ="+entregaBilletes[i]);
    monto-=entregaBilletes[i]*valorBilletes[i];
    if (monto==0){
      document.write("El monto se puede dar.<br/>");
      for (var i in entregaBilletes){
        document.write(desplegarMensaje(valorBilletes[i],entregaBilletes[i]));
      }
      break;
    }
}
if (monto!=0){
  document.write("El monto no se puede dar");
}
function desplegarMensaje(billete,cantidad) {
  var texto;
  if(cantidad>1){
    texto=cantidad+" billetes de "+billete+"<br/>";
  }
  else if (cantidad==1) {
    texto=cantidad+" billete de "+billete+"<br/>";
  }
  else{
    texto="";
  }
  return texto;
}
