var miNombre = "Luis Fernando ";//Scope global.

function Hola(){
    var miApellido = "Zarazua";//Scope local
    console.log("Hola " + miNombre + miApellido);
}

console.log(miNombre);
console.log(miApellido);