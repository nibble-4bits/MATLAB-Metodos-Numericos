% Implementaci�n del m�todo de Newton-Raphson modificado, por Luis De Anda
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
function [arrXn, arrXn_1, error, i] = metodoNRModificado(fx, x0, porcError)
    f_x = diff(fx);
    f__x = diff(f_x);
    i = 1;
    
    xn = double(x0 - ((subs(fx, x0) * subs(f_x, x0)) / (double(subs(f_x, x0) * subs(f_x, x0)) - subs(fx, x0) * subs(f__x, x0))));
    errorRel = double(abs(((xn - x0) / x0) * 100));
    arrXn(i, 1) = xn;
    arrXn_1(i, 1) = x0;
    error(i, 1) = errorRel;
    
    while errorRel > porcError
        i = i + 1;
        xn_1 = xn;
        xn = double(xn - ((subs(fx, xn) * subs(f_x, xn)) / (double(subs(f_x, xn) * subs(f_x, xn)) - subs(fx, xn) * subs(f__x, xn))));
        errorRel = double(abs(((xn - xn_1) / xn_1) * 100));
        arrXn(i, 1) = xn;
        arrXn_1(i, 1) = xn_1;
        error(i, 1) = errorRel;
        if errorRel > 10000 % no hay soluci�n
            return;
        end
    end
end