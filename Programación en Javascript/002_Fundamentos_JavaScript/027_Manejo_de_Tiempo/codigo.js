var ms = 2000;
console.log("a");//Primera instrucción.
setTimeout( () => console.log("b"),ms)//Se ejecuta hasta que todas las tareas de la pila se terminen y hayan pasado al menos los ms indicados.
console.log("c");//Segunda instrucción.

