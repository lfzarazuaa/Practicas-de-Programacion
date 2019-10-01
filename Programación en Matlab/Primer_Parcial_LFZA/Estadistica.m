function [  ] = Estadistica(  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x=xlsread('Libro1.xlsx')
z=x(15:30,1:4)
moda=mode(mode(z))
media=mean(mean(z))
mediana=median(median(z))
end

