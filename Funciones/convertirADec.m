% M�todo para convertir de cualquier base a decimal, por Luis De Anda
% Par�metros:
%   num = el n�mero que se quiere convertir a decimal
%   baseOrigen = la base del par�metro num
%
% Valores de retorno:
%   res = la representaci�n decimal del n�mero introducido
function res = convertirADec(num, baseOrigen)
    decimal = 0;
    j = 0;
    for i = size(num, 2) : -1: 1
        if isletter(num(i))
            decimal = decimal + double(double(num(i) - 55) * power(baseOrigen, j)); 
        else
            decimal = decimal + double(double(num(i) - 48) * power(baseOrigen, j)); 
        end
        j = j + 1;
    end
    res = decimal;
end