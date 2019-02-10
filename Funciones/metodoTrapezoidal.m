% Implementación del método trapezoidal para aproximar integrales, por Luis De Anda
% Parámetros:
%   fx = la función de la cual se quiere encontrar el área bajo la curva
%   a = el inicio del intervalo del cual se quiere calcular el área
%   b = el final del intervalo del cual se quiere calcular el área
%   n = número de trapecios que habrá en el intervalo, entre más trapecios haya, 
%   la aproximación del área será mejor
%
% Valores de retorno:
%   area = el área bajo la curva en el intervalo [a, b]
%   coordXT = las coordenadas X de los 4 puntos que forman el trapecio
%   coordYT = las coordenadas Y de los 4 puntos que forman el trapecio
function [area, coordXT, coordYT] = metodoTrapezoidal(fx, a, b, n)
    area = 0;
    anchoTrapecio = (b - a) / n;
    incremento = a;
    func = matlabFunction(fx); % se convierte a funcion de MATLAB, usar subs() es mas lento y costoso
    
    for i = 1 : n
        base1 = func(incremento);
        base2 = func(incremento + anchoTrapecio);
        coordXT(i, :) = [incremento, incremento + anchoTrapecio, incremento + anchoTrapecio, incremento];
        coordYT(i, :) = [0, 0, base2, base1];
        area = area + (((base1 + base2) / 2) * anchoTrapecio);
        incremento = incremento + anchoTrapecio;
    end
    area = real(area);
    coordXT = real(coordXT);
    coordYT = real(coordYT);
end