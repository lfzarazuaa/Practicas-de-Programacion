//Aplicación del hoisting (llamar una variable antes de declararla).
console.log(miNombre);

var miNombre = "Luis"

//Hoisting al llamar una función.

hey()

function hey() {
    console.log("Hola " + miApellido)
}

miApellido