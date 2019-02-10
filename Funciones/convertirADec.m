% Método para convertir de cualquier base a decimal, por Luis De Anda
% Parámetros:
%   num = el número que se quiere convertir a decimal
%   baseOrigen = la base del parámetro num
%
% Valores de retorno:
%   res = la representación decimal del número introducido
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