function [ output_args ] = series( n )
sum=0;
fact=1;
if(n<2||n>10)
    disp('El no.no es valido')
else
    for i=1:n
        fact=i*fact;
        sum=(fact/1)+sum;
        fprintf(%d/%d +,fact,i);
    end
    fprintf(?El resultado es %f ln;sum);
end


end

