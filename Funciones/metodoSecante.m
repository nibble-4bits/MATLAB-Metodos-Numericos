% Implementación del método de la secante, por Luis De Anda
% Parámetros:
%   fx = la función de la cual se quiere encontrar la raíz aproximada
%   x0 = el primer valor estimado inicial
%   x1 = el segundo valor estimado inicial
%   limiteError = el error absoluto como limite de la estimación
%
% Valores de retorno:
%   arrXn = un arreglo con los valores estimados en cada iteración
%   arrXn_1 = un arreglo con los valores previos estimados en cada
%   iteración
%   error = el error estimado en cada paso de la iteración
%   i = el numero de iteraciones realizadas
function [arrXn, arrXn_1, error, i] = metodoSecante(fx, x0, x1, limiteError)
    i = 1;
    
    xnmas1 = double(x1 - ((subs(fx, x1) * (x1 - x0)) / (subs(fx, x1) - subs(fx, x0))));
    errorAbs = double(abs(x1 - x0));
    arrXn(i, 1) = xnmas1;
    arrXn_1(i, 1) = (x1 + x0) / 2;
    error(i, 1) = errorAbs;
    xn_1 = x1;
    xn = xnmas1;
    
    while errorAbs > limiteError
        i = i + 1;
        xnmas1 = double(xn - ((subs(fx, xn) * (xn - xn_1)) / (subs(fx, xn) - subs(fx, xn_1))));
        errorAbs = double(abs(xn - xn_1));
        arrXn(i, 1) = xnmas1;
        arrXn_1(i, 1) = (xn + xn_1) / 2;
        error(i, 1) = errorAbs;
        xn_1 = xn;
        xn = xnmas1;
        if errorAbs > 10000 % no hay solución
            return;
        end
    end
end