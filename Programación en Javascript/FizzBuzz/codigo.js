var m3,m5;
for (var i = 1; i < 101; i++) {
  m3=i%3;
  m5=i%5;
  if (m5==0 && m3==0){
    document.write("FizzBuzz<br\>");
  }
  else if (m3==0) {
    document.write("Fizz<br\>");
  }
  else if (m5==0) {
    document.write("Buzz<br\>");
  }
  else {
    document.write(i+"<br\>");
  }
}
