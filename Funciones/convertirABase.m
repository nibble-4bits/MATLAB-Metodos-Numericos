% Método para convertir de decimal a cualquier base, por Luis De Anda
% Parámetros:
%   num = el número decimal que se quiere convertir a otra base
%   baseDestino = la base a la cual se quiere convertir el parámetro num
%
% Valores de retorno:
%   res = la representación en base 'baseDestino' del número introducido
function res = convertirABase(num, baseDestino)
    digitos = '';
    while num >= 1
        if mod(num, baseDestino) > 9
            digitos = [digitos char(mod(num, baseDestino) + 55)];
        else
            digitos = [digitos char(mod(num, baseDestino) + 48)];
        end
        num = floor(num / baseDestino);
    end

    digitosOrd = '';
    for j = size(digitos, 2) : -1: 1
        digitosOrd = [digitosOrd digitos(j)];
    end
    res = digitosOrd;
end