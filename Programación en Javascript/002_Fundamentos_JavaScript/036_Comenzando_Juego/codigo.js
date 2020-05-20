  const celeste = document.getElementById('celeste')//Div del elemento celeste.
  const violeta = document.getElementById('violeta')//Div del elemento violeta.
  const naranja = document.getElementById('naranja')//Div del elemento naranja.
  const verde = document.getElementById('verde')//Div del elemento verde.
  const btnEmpezar = document.getElementById("btnEmpezar")
  class Juego {//El juego consiste en repetir los patrones mostrados en pantalla, tiene 10 niveles.
    constructor() {
      this.inicializar()//Ejecuta la función de inicialización.
      this.generarSecuencia();//Genera aleatoriamente la secuencia que se seguirá.
      this.siguientenivel();
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
      this.TiempoSecuencia=450;//Tiempo de un frame de la secuencia en ms.
    }

    generarSecuencia(){
      this.secuencia = new Array(10).fill(0).map( n=> Math.floor(Math.random() * 4));//Genera un arreglo de 10 elementos al inicio con 0s y luego numeros aleatorios entre 0 y 3.
    }

    siguientenivel(){
      this.iluminarSecuencia();
    }

    transformarNumeroAColor(numero){//Función para decodificar los numeros de la secuencia a un color.
      switch (numero) {
        case 0:
          return 'celeste';
        case 1:
          return 'violeta'
        case 2:
          return 'naranja'
        case 3:
          return 'verde'
        default:
          return 'naranja'
      }
    }

    iluminarSecuencia(){
      for (let i = 0; i < this.nivel; i++) {//Ilumina el número de elementos conforme al nivel en el que se este.
        let color = this.transformarNumeroAColor(this.secuencia[i]);//Nos devuelve un color para cada número.
        //Uso de setTimeout para indicar en multiplos del tiempo (asincronamente) cuando prender cada color (parecido a delay pero con panorama asincrono).
        setTimeout(() => this.iluminarColor(color),this.TiempoSecuencia*i)//Ejecuta función para iluminar el color de la secuencia.
      }
    }

    iluminarColor(color){//Ilumina el color incluyendole una clase (light) al elemento.
      this.colores[color].classList.add('light');//Agrega la clase light (definida en css asignando un color mas suave) al elemento indicado.
      setTimeout(() => this.apagarColor(color),this.TiempoSecuencia);//Regresa al color original dentro del tiempo establecido.
    }

    apagarColor(color){
      this.colores[color].classList.remove('light');//Remueve la clase light del elemento para dejarlo en su condición original.
    }
  }

  function empezarJuego() {
    alert('El juego va a comenzar');
    window.juego = new Juego();
  }


