function [ y ] = Campana_Gauss(u,o,x)
%Función para calcular la campana de Gauss
%   
y=1/(o*sqrt(2*pi))*exp((-(1/2)*((x-u)/o)^2 ));
end

