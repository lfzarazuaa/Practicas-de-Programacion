ctrl+barra_espaciadora%%sugerencias a poner de variables.
ctrl+punto%%sugerencias para generar método o constructor.
ctrl+k ctrl+f%%Formatear el documento.
alt+shift%%Seleccionar multiplemente.
https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf %%Consultar todos los atajos.
cw%%Método writeline.
class,prop, propfull%%Permite crear clases, setter y getter.
F2 o click derecho "Rename Symbol"%%Renombra todas las entidades con la nueva cadena.
$ $"Nombre{Nombre}" %% Permite poner cadenas con variables.
En C# todo es un objeto que hereda de la clase objet.
type variable=dato%% Se asignan valores por defecto que no necesariamente se tienen que declarar.
 => %%Asignar mas cortamente.
 (Var1,Var2) =  (Var1,Var2);%%Asignación de tuplas.
 public string Ciudad { get; set; }%% Crear getter y setter.
 type var=dato%%Declarar uso de los parámetros opcionales.
 var:dato%%Usar parámetros opcionales.
La Firma del método es que valor tiene cual devuelve y que recibe.
Extensión jchanon c# para facilitar crear clases en c#.
%%3 formas de mostrar las cadenas en pantalla.
System.Console.WriteLine(curso1.Nombre + "," + curso1.UniqueId);%%
System.Console.WriteLine($"{curso2.Nombre},{curso2.UniqueId}");%%
System.Console.WriteLine(curso3);%% Se necesita hacer override a ToString();
%%Tipos de colecciones
Simples-Manipulan todo como tipos object%%ArrayList,BitArray,Queue,Stack,Sorted.
Specialized-Implementaciones comunes%%StringCollection,BitVector,ListDictionary,NameValueCollection.
Generic-Usan generics para crear implementaciones optimizadas de colección según el tipo de dato configurado.%%Dictionary<T,K>,List<T>,Queue<T>,Stack<T>,HachSet<T>,SortedSet<T>.
Concurrent-Preparadas para acceso concurrente (varios nucleos)%%ConcurrentBag<T>,ConcurrentStack<T>,ConcurrentQueue<T>.
lista.Add%%Agrega un nuevo elemento.
lista.AddRange%%Agrega una nueva lista a lo que ya se tenía.
lista.Clear();%%Limpia la colección de todos los datos.
lista.Remove();%%Elimina el dato usando su HashCode como identificador.
lista.RemoveAll();%%Elimina el con todos los que cumplan con una condicón usa un Predicate para lograrlo.
lista.RemoveAt();%%Remueve por indice.
objeto.GetHashCode();%%Obtener el código hash identificador.
Predicate%%Específica que parámetros de entrada y salida de tener un método.
delegate%% tipo que encapsula de forma segura un método, en una función anónima.
(objeto) => objeto.atributo == variable%%Función lambda para retorno de true/false.
static %% Tipo de clase que no permite nuevas clases es basicamente un objeto.
Por regla general si un método tiene mas de 50 líneas probablemente está mal diseñado.