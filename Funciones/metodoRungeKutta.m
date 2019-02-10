% Implementación del método de Runge-Kutta de 2do y 4to orden, por Luis De Anda
% Parámetros:
%   ecuacionDiff = la ecuación diferencial
%   x0 = inicio del intervalo
%   xn = final del intervalo
%   y0 = el valor y estimado inicial
%   n = numero de iteraciones
%   orden = el orden del método ('2' ó '4')
%
% Valores de retorno:
%   ys = un arreglo con los valores estimados en cada iteración
%   xs = un arreglo con los valores obtenidos de x en cada iteración
function [ys, xs] = metodoRungeKutta(ecuacionDiff, x0, xn, y0, n, orden)
    syms x y;
    h = (xn - x0) / n;
    xs(1, 1) = x0;
    ys(1, 1) = y0;
    
    switch orden
        case '2' % 2do orden
            for i = 1 : n
                xs(i + 1, 1) = xs(i, 1) + h;
                k1(i) = double(subs(ecuacionDiff, [x y], [xs(i, 1) ys(i, 1)]));
                k2(i) = double(subs(ecuacionDiff, [x y], [xs(i, 1) + h ys(i, 1) + k1(i)*h]));
                
                ys(i + 1, 1) = ys(i, 1) + ((h / 2) * (k1(i) + k2(i)));
            end
        case '4' % 4to orden
            for i = 1 : n
                xs(i + 1, 1) = xs(i, 1) + h;
                k1(i) = double(subs(ecuacionDiff, [x y], [xs(i, 1), ys(i, 1)]));
                k2(i) = double(subs(ecuacionDiff, [x y], [xs(i, 1) + h/2, ys(i, 1) + (k1(i)*h) / 2]));
                k3(i) = double(subs(ecuacionDiff, [x y], [xs(i, 1) + h/2, ys(i, 1) + (k2(i)*h) / 2]));
                k4(i) = double(subs(ecuacionDiff, [x y], [xs(i, 1) + h, ys(i, 1) + k3(i)*h]));
                
                ys(i + 1, 1) = ys(i, 1) + ((h / 6) * (k1(i) + 2*k2(i) + 2*k3(i) + k4(i)));
            end
    end
end