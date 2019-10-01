function [ x,y] = Pares( n )
acu=1
n=input('Ingrese un numero entre 1 y 100')
if(n<=100 && n>=100)
    for i:1:n
        if mod(n,2)=0
        x=acu*(i)
        else
            acu=acu*(i+1)
        end
        else
            disp('Capture otra variable')