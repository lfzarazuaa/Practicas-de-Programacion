var luis ={
  nombre: "Luis",
  apellido: "Zarazua",
  edad: 24
}

function esMayorDeEdad(persona) {
  //var mensaje; //Equivalente declarar aqui que dentro del if por hoisting.
  if ( persona.edad >18 ) {
    var mensaje = "Es mayor de edad";
  } else {
    var mensaje = "Es menor de edad";
    var mensaje2 = "Este es otro mensaje";//Javascript usando hoisting declara la variable para que pueda ser accedida en un ámbito local para la función.
  }
  console.log(mensaje);//Muestra el mensaje usando hoisting.
  console.log(mensaje2);//Muestra el mensaje2 declarándolo si no existe, ya que lo identifica declarado en un segmento de código por el cual no siempre se pasa.
  console.log(mensaje3);//Da como resultado error de refencia.  
}

function esMayorDeEdadLet(persona) {
  let mensaje;//Declaración en el bloque de la función.
  const MAYORIA_DE_EDAD = 18//Const no puede ser reasignada en el programa.
  if ( persona.edad > MAYORIA_DE_EDAD ) {
    mensaje = "Es mayor de edad";
    let mensaje2 = "Solo estoy definido en el if."
  } else {
    mensaje = "Es menor de edad";
    let mensaje2 = "Solo estoy definido en el else."
  }
  console.log(mensaje);//Muestra el mensaje.
  console.log(mensaje2);//Muestra mensaje no definido.
}

esMayorDeEdadLet(luis)
esMayorDeEdad(luis)

