% Implementación del método de mínimo cuadráticos con polinomio lineal, por Luis De Anda
% Parámetros:
%   arrDatos = un arreglo de pares ordenados de 2 filas, n columnas donde:
%               1. la primera fila representa el conjunto de coordenadas X
%               2. la segunda fila representa el conjunto de coordenadas Y
%
% Valores de retorno:
%   aproxLineal = el polinomio lineal que más se ajusta al conjunto
%   de puntos
function aproxLineal = metodoMinCuadrados(arrDatos)
    syms x;
    sumaX = 0; sumaY = 0; sumaXY = 0;  sumaX2 = 0;
    n = size(arrDatos, 2);
    
    for i = 1 : size(arrDatos, 2)
        sumaX = sumaX + arrDatos(1, i);
        sumaY = sumaY + arrDatos(2, i);
        sumaXY = sumaXY + arrDatos(1, i) * arrDatos(2, i);
        sumaX2 = sumaX2 + arrDatos(1, i) ^ 2;
    end
    
    m = (sumaXY - (sumaX * sumaY / n)) / (sumaX2 - (sumaX ^ 2 / n));
    b = (sumaY / n) - (m * sumaX / n);
    
    aproxLineal = m*x + b;
end