function divisionEntera(dividendo, divisor) {
  if (dividendo < divisor){
    return 0;
  }
  return 1 + divisionEntera(dividendo - divisor, divisor)//El ultimo return en ejecutarse es este y retoma todas las llamada a función.
}
console.log(divisionEntera(100,11));
console.log(divisionEntera(-11,11));
console.log(divisionEntera(15,0.2));
