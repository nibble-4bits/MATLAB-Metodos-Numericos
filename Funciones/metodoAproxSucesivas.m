% Implementación del método de aproximaciones sucesivas, por Luis De Anda
% Parámetros:
%   fx = la función de la cual se quiere encontrar la raíz aproximada
%   xfin = final del intervalo de búsqueda
%   xcom = principio del intervalo de búsqueda
%   x0 = el valor estimado inicial
%
% Valores de retorno:
%   xn = un arreglo con los valores estimados en cada iteración
%   error = el error estimado en cada paso de la iteración
%   i = el numero de iteraciones realizadas
function [xn, xn_1, error, i] = metodoAproxSucesivas(fx, xfin, xcom, x0)
    syms x;
    m = (subs(fx, xfin) - subs(fx, xcom)) / (xfin - xcom);
    gx = (fx - m*x) / -m;
    xn(1, 1) = double(subs(gx, x0));
    xn_1(1, 1) = x0;
    error(1, 1) = double(abs(((xn(1, 1) - x0) / x0) * 100));
    errorAct = error(1, 1);
    i = 1;
    
    while errorAct > 1e-6
        i = i + 1;
        
        xn(i, 1) = double(subs(gx, xn(i - 1, 1)));
        xn_1(i, 1) = xn(i - 1, 1);
        error(i, 1) = double(abs(((xn(i, 1) - xn(i - 1, 1)) / xn(i - 1, 1)) * 100));
        errorAct = error(i, 1);
        
        m = (subs(fx, xn(i, 1)) - subs(fx, xn(i - 1, 1))) / (xn(i, 1) - xn(i - 1, 1));
        gx = (fx - m*x) / -m;
    end
end