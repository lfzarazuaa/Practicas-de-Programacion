var articulos = [
    {nombre: "Bici", costo: 3000 },
    {nombre: "Tv", costo: 25000 },
    {nombre: "Libro", costo: 320 },
    {nombre: "Celular", costo: 11000 },
    {nombre: "Laptop", costo: 18000 },
    {nombre: "Teclado", costo: 750 },
    {nombre: "Audífonos", costo: 1700 }
];

var encuentraArticulo = articulos.find(function(articulo){//Con find se regresa el primer elemento que regresa true en la función definida.
    return articulo.nombre === "Laptop"; //Se específica la condición de filtrado.
});

articulos.forEach(function (articulo) {//Itera para cada elemento ejecutando la función declarada.
    console.log(articulo.nombre)
});

var articulosBaratos = articulos.some(function (articulo) {//Itera sobre cada elemento y si en algun momento se regresa true por medio de la función devuelve true a la variable.
    return articulo.costo <= 700;//Devuelve si hay al menos un artículo que cumpla con esta condición.
});