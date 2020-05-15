var estudiantes = ["Maria", "Sergio", "Rosa", "Daniel"];

function saludarEstudiantes(estudiante) {
    console.log(`Hola, ${estudiante}`);
}

for (var i = 0; i < estudiantes.length; i++) {
    saludarEstudiantes(estudiantes[i]);
}
//for of para iterar sobre cada elemento en una lista.
for (var estudiante of estudiantes) {
    saludarEstudiantes(estudiante);
}

//for in para iterar sobre cada propiedad que tenga un objeto.
var obj = {a: 1, b: 2, c: 3};
for (const prop in obj) {
  console.log(`obj.${prop} = ${obj[prop]}`);
}