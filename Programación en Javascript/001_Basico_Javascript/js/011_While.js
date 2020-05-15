var estudiantes = ["Maria", "Sergio", "Rosa", "Daniel"];

function saludarEstudiantes(estudiante) {
    console.log(`Hola, ${estudiante}`);
}
//While con el elemento shift para eliminar el primer elemento de un array.
while (estudiantes.length>0) {
    var estudiante=estudiantes.shift();//Método shift para eliminar el primer elemento de un array.
    saludarEstudiantes(estudiante);
}