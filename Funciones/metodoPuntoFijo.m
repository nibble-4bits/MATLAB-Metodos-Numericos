% Implementación del método de punto fijo, por Luis De Anda
% Parámetros:
%   fx = la función de la cual se quiere encontrar la raíz aproximada
%   x0 = el valor estimado inicial
%   porcError = el porcentaje de error como limite de la estimación
%
% Valores de retorno:
%   arrXn = un arreglo con los valores estimados en cada iteración
%   arrXn_1 = un arreglo con los valores previos estimados en cada
%   iteración
%   error = el error estimado en cada paso de la iteración
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