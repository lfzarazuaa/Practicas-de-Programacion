  const celeste = document.getElementById('celeste')//
  const violeta = document.getElementById('violeta')
  const naranja = document.getElementById('naranja')
  const verde = document.getElementById('verde')
  const btnEmpezar = document.getElementById("btnEmpezar")
  class Juego {//El juego consiste en repetir los patrones mostrados en pantalla, tiene 10 niveles.
    constructor() {
      this.inicializar()//Ejecuta la función de inicialización.
      this.generarSecuencia();//Genera aleatoriamente la secuencia que se seguirá.
    }

    inicializar() {
      btnEmpezar.classList.add('hide');//Agrega la clase (css) hide al elemento btnEmpezar.
      this.nivel = 1;//Inicializa en el nivel 1.
      this.colores = {//Objeto con los valores de los objetos (autoasignados).
        celeste,//La propiedad celeste del objeto contiene la variable celeste (celeste: celeste).
        violeta,//La propiedad violeta del objeto contiene la variable violeta (violeta: violeta).
        naranja,//La propiedad naranja del objeto contiene la variable naranja (naranja: naranja).
        verde//La propiedad verde del objeto contiene la variable verde (verde: verde).
      }
    }

    generarSecuencia(){
      this.secuencia = new Array(10).fill(0).map( n=> Math.floor(Math.random() * 4));//Genera un arreglo de 10 elementos al inicio con 0s y luego numeros aleatorios entre 0 y 3.
    }
  }

  function empezarJuego() {
    alert('El juego va a comenzar');
    window.juego = new Juego();
  }


