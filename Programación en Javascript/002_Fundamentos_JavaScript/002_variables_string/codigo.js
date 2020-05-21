var nombre = "Luis Fernando", apellido = "Zarazua Aguilar";
var nombreEnMayusculas = nombre.toUpperCase();//Convertir a Mayúsculas.
var nombreEnMinusculas = nombre.toLowerCase();//Convertir a Minúsculas.

var primeraLetraDelNombre = nombre.charAt(0);//Extraer la posición cero del String.
var cantidadDeLetrasDelNombre = nombre.length;//Caracteres en el string.

var nombreCompleto =`${nombre} ${apellido.toUpperCase()}`;//Notación para interpolar variables.

var str = nombre.charAt(1,3);//Nos devuelve el substring.

var ultimaLetra = nombre.charAt(nombre.length-1);