function Factorial(numero) {
  if (!this.cache) {//Pregunta si existe una cache (memoria temporal).
    this.cache ={}//Declara la cache.
  }

  if (this.cache[numero]){//Se verifica si ya tenia el resultado previamente calculado.
    return this.cache[numero];//Se regresa el resultado
  }

  if (numero<2){
    return 1;
  }

  this.cache[numero] = numero * Factorial(numero-1)//Guarda en la cache antes de realizar el return.
  return this.cache[numero];//Regresamos el resultado.
}

for (let index = 0; index < 15; index++) {
  console.log(`${index}! = ${Factorial(index)}`);
}

for (let index = 0; index < 55; index++) {
  console.log(`${index}! = ${Factorial(index)}`);
}
