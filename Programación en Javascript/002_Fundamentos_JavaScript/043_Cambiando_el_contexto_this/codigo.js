var luis = {
  nombre: "Luis",
  apellido: "Zarazua",
  edad: 24
}

function saludar(saludo = "Hola") {
  console.log(`${saludo}, mi nombre es ${this.nombre}`); 
}

function saludarBind() {
  console.log(`Hola, mi nombre es ${this.nombre}`); 
}

//Con bind se define cual va a ser el objeto this de la función.
setTimeout(saludar.bind(luis, "Hola compa"), 1000);//Al llamar a Timeout se el this de la función apunta a window.
saludar();//Al ejecutar saludar sin bind this apunta a window

//El segundo parámetro pasado en bind, call y apply son los parámetros de la función llamada.
const saludarLuis=saludarBind.bind(luis, "Hola parce");//Asigna el objeto a this cada vez que se ejecute.
saludarLuis()//Lamado a la función saludarLuis.

saludar.call(luis, "Hola mundo")//LLama a la función asignando un nuevo this y los parámetros de la función.

saludar.apply(luis, ["Hola che"])//Pasa los parámetros de función en un arreglo.