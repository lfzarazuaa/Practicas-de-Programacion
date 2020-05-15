var articulos = [
    {nombre: "Bici", costo: 3000 },
    {nombre: "Tv", costo: 25000 },
    {nombre: "Libro", costo: 320 },
    {nombre: "Celular", costo: 11000 },
    {nombre: "Laptop", costo: 18000 },
    {nombre: "Teclado", costo: 750 },
    {nombre: "Audífonos", costo: 1700 }
];

//Función constructora de objetos.
function articulo(nombre, costo){
    this.nombre = nombre;
    this.costo = costo;
}

var articulos2 = [//Objeto contenedor de objetos.
    new articulo("Bici", 3000),
    new articulo("Tv", 25000),
    new articulo("Libro", 320),
    new articulo("Celular", 11000),
    new articulo("Laptop", 18000),
    new articulo("Teclado", 750),
    new articulo("Audífonos", 1700)
];

var articulosFiltrados = articulos2.filter(function(articulo){//Con filter se regresan los elementos que cumplan con la condición.
    return articulo.costo <= 900; //Se específica la condición de filtrado.
});

var nombreArticulos = articulos2.map(function (articulo) {//Itera sobre la variable, ejecutando la función indicada que regresa el parámetro indicado.
    articulo.nombre = "Nombre " + articulo.nombre;
    return articulo.nombre;//Específica que elementos regresar.
});

