function crearSaludo(finalDeFrase) {
  return function (nombre) {
    console.log(`Hola ${finalDeFrase}, eres ${nombre}`);    
  }
}

const saludoArgentino = crearSaludo('che');//Regresa una función como respuesta.
const saludoMexicano = crearSaludo('compa');//Crea un closure, como un tipo función personalizada.
const saludoColombiano = crearSaludo('parse');//El closure guarda el parámetro que se le pasó al declararlo.

saludoArgentino("Luis")//Llama a la función con closure.
saludoMexicano("Luis")
saludoColombiano("Luis")