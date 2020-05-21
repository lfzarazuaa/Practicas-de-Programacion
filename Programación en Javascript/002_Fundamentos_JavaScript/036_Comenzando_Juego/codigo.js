  const celeste = document.getElementById('celeste')//Div del elemento celeste.
  const violeta = document.getElementById('violeta')//Div del elemento violeta.
  const naranja = document.getElementById('naranja')//Div del elemento naranja.
  const verde = document.getElementById('verde')//Div del elemento verde.
  const btnEmpezar = document.getElementById("btnEmpezar")
  const ULTIMO_NIVEL = 2;
  const TIEMPO_ENTRE_NIVELES = 1500;//Tiempo de espera entre un nivel y otro.
  const TIEMPO_DE_INICIO = 500;//Tiempo de espera entre un nivel y otro.

  class Juego {//El juego consiste en repetir los patrones mostrados en pantalla, tiene 10 niveles.
    constructor() {
      this.inicializar()//Ejecuta la función de inicialización.
      this.generarSecuencia();//Genera aleatoriamente la secuencia que se seguirá.
      setTimeout(() => this.siguienteNivel(),TIEMPO_DE_INICIO);//Tiempo de espera para empezar a mostrar secuencia.
    }

    inicializar() {
      this.elegirColor = this.elegirColor.bind(this);//Hace que en vez de apuntar al elemento html apunte con this, se apunte al objeto juego. 
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
      this.secuencia = new Array(ULTIMO_NIVEL).fill(0).map( n=> Math.floor(Math.random() * 4));//Genera un arreglo de 10 elementos al inicio con 0s y luego numeros aleatorios entre 0 y 3.
    }

    siguienteNivel(){
      this.subnivel = 0;//Subnivel para indicarnos un botón seleccionado.
      this.iluminarSecuencia();
      this.agregarEventosClick();
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

    transformarColorANumero(color){//Función para decodificar los numeros de la secuencia a un color.
      switch (color) {
        case 'celeste':
          return 0;
        case 'violeta':
          return 1;
        case 'naranja':
          return 2;
        case 'verde':
          return 3;
      }
    }

    iluminarSecuencia(){
      for (let i = 0; i < this.nivel; i++) {//Ilumina el número de elementos conforme al nivel en el que se este.
        let color = this.transformarNumeroAColor(this.secuencia[i]);//Nos devuelve un color para cada número.
        //Uso de setTimeout para indicar en multiplos del tiempo (asincronamente) cuando prender cada color (parecido a delay pero con panorama asincrono).
        setTimeout(() => this.iluminarColor(color),this.TiempoSecuencia*(2*i))//Ejecuta función para iluminar el color de la secuencia.
      }
    }

    iluminarColor(color){//Ilumina el color incluyendole una clase (light) al elemento.
      this.colores[color].classList.add('light');//Agrega la clase light (definida en css asignando un color mas suave) al elemento indicado.
      setTimeout(() => this.apagarColor(color),this.TiempoSecuencia);//Regresa al color original dentro del tiempo establecido.
    }

    apagarColor(color){//Devuelve al color original.
      this.colores[color].classList.remove('light');//Remueve la clase light del elemento para dejarlo en su condición original.
    }

    agregarEventosClick(){//Eventos al hacer click en los recuadros.
      this.colores.celeste.addEventListener('click', this.elegirColor);//Agrega el nombre del evento que dispara la acción y que función debe de realizar. 
      this.colores.verde.addEventListener('click', this.elegirColor);//Agrega el nombre del evento que dispara la acción y que función debe de realizar. 
      this.colores.violeta.addEventListener('click', this.elegirColor);//Agrega el nombre del evento que dispara la acción y que función debe de realizar. 
      this.colores.naranja.addEventListener('click', this.elegirColor);//Agrega el nombre del evento que dispara la acción y que función debe de realizar. 
    }

    eliminarEventosClick(){//Eventos al hacer click en los recuadros.
      this.colores.celeste.removeEventListener('click', this.elegirColor);//Agrega el nombre del evento que dispara la acción y que función debe de realizar. 
      this.colores.verde.removeEventListener('click', this.elegirColor);//Agrega el nombre del evento que dispara la acción y que función debe de realizar. 
      this.colores.violeta.removeEventListener('click', this.elegirColor);//Agrega el nombre del evento que dispara la acción y que función debe de realizar. 
      this.colores.naranja.removeEventListener('click', this.elegirColor);//Agrega el nombre del evento que dispara la acción y que función debe de realizar. 
    }

    elegirColor(evento){
      const nombreColor = evento.target.dataset.color//Obtener el color del boton presionado (nombre de la variable).
      const numeroColor = this.transformarColorANumero(nombreColor)//Obtener el número del boton presionado con base en su color.
      this.iluminarColor(nombreColor)//Indica al usuario el color seleccionado.
      if (numeroColor === this.secuencia[this.subnivel]) {//Verifica que haya presionado la tecla de secuencia correcta.
        this.subnivel++//Incrementar el subnivel (paso de la secuencia en la que se encuentre).
        if (this.subnivel === this.nivel) {//Si se seleccionó toda la secuencia correcta.
          this.nivel++;//Incrementa el nivel.
          this.eliminarEventosClick();//Cuando se pasa de nivel se bloquean los eventos del click.
          if (this.nivel === (ULTIMO_NIVEL + 1)) {//Verifica que sea el ultimo nivel.
            this.ganoElJuego();//Método cuando se ganó el juego.
          }
          else{
            setTimeout(() => this.siguienteNivel(),TIEMPO_ENTRE_NIVELES)//Evita que se ejecute la secuencia hasta pasados 2 segundos.
          }
        }
      }
      else{
        this.perdioElJuego();//Método cuando se perdió el juego.
      }
    }

    ganoElJuego(){
      swal("Simón Dice", "¡Felicitaciones, ganaste el juego!", "success").then(() => {//Promesa cuando se acepto el mensaje.
          this.inicializar()//Reinicia el juego.
          btnEmpezar.classList.remove('hide');//Quita la clase (css) hide al elemento btnEmpezar poder comenzar un nuevo juego..
        })
    }

    perdioElJuego(){
      swal("Simón Dice", "¡Muy mal, perdiste el juego!", "error").then(
        () => {//Promesa cuando se acepto el mensaje.
          this.eliminarEventosClick();
          this.inicializar();
          btnEmpezar.classList.remove('hide');//Quita la clase (css) hide al elemento btnEmpezar para poder comenzar un nuevo juego.
        }
      ) 
    }
  }

  function empezarJuego() {
    alert('El juego va a comenzar');//Alerta de inicio de nuevo juego.
    window.juego = new Juego();//Comienza un nuevo juego.
  }


