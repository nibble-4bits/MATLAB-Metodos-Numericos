% Implementaci�n del m�todo de punto fijo, por Luis De Anda
% Par�metros:
%   fx = la funci�n de la cual se quiere encontrar la ra�z aproximada
%   x0 = el valor estimado inicial
%   porcError = el porcentaje de error como limite de la estimaci�n
%
% Valores de retorno:
%   arrXn = un arreglo con los valores estimados en cada iteraci�n
%   arrXn_1 = un arreglo con los valores previos estimados en cada
%   iteraci�n
%   error = el error estimado en cada paso de la iteraci�n
%   i = el numero de iteraciones realizadas
function [arrXn, arrXn_1, error, i] = metodoPuntoFijo(fx, x0, porcError)
    gx = obtenergx(fx);
    i = 1;
    
    xn = double(subs(gx, x0));
    errorRel = abs(((xn - x0) / x0) * 100);
    arrXn(i, 1) = xn;
    arrXn_1(i, 1) = x0;
    error(i, 1) = errorRel;
    
    while errorRel > porcError
        i = i + 1;
        xn_1 = xn;
        xn = double(subs(gx, xn));
        errorRel = abs(((xn - xn_1) / xn_1) * 100);
        arrXn(i, 1) = xn;
        arrXn_1(i, 1) = xn_1;
        error(i, 1) = errorRel;
    end
end