const cafecito = require('express');//carga la libreria express
const aplicacion = cafecito();//ejecuta la aplicacion express.

aplicacion.get('/', inicio);
aplicacion.get('/cursos', cursos);

function inicio(peticion, resultado) {
  resultado.send("Este es el <strong> home de Jesus Zarazua Abundis</strong>");
}

function cursos(peticion, resultado) {
  resultado.send("Estos son los <strong> cursos </strong>");
}

aplicacion.listen(8989)
