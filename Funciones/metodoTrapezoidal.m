% Implementaci�n del m�todo trapezoidal para aproximar integrales, por Luis De Anda
% Par�metros:
%   fx = la funci�n de la cual se quiere encontrar el �rea bajo la curva
%   a = el inicio del intervalo del cual se quiere calcular el �rea
%   b = el final del intervalo del cual se quiere calcular el �rea
%   n = n�mero de trapecios que habr� en el intervalo, entre m�s trapecios haya, 
%   la aproximaci�n del �rea ser� mejor
%
% Valores de retorno:
%   area = el �rea bajo la curva en el intervalo [a, b]
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