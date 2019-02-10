% Implementación del método de Newton-Raphson, por Luis De Anda
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
function [arrXn, arrXn_1, error, i] = metodoNewtonRaphson(fx, x0, porcError)
    f_x = diff(fx);
    i = 1;
    
    xn = double(x0 - subs(fx, x0) / subs(f_x, x0));
    errorRel = double(abs(((xn - x0) / x0) * 100));
    arrXn(i, 1) = xn;
    arrXn_1(i, 1) = x0;
    error(i, 1) = errorRel;
    
    while errorRel > porcError
        i = i + 1;
        xn_1 = xn;
        xn = double(xn - subs(fx, xn) / subs(f_x, xn));
        errorRel = double(abs(((xn - xn_1) / xn_1) * 100));
        arrXn(i, 1) = xn;
        arrXn_1(i, 1) = xn_1;
        error(i, 1) = errorRel;
        if errorRel > 10000 % no hay solución
            return;
        end
    end
end