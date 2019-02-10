% Implementación del método de mínimo cuadráticos con polinomio cuadrático, por Luis De Anda
% Parámetros:
%   arrDatos = un arreglo de pares ordenados de 2 filas, n columnas donde:
%               1. la primera fila representa el conjunto de coordenadas X
%               2. la segunda fila representa el conjunto de coordenadas Y
%
% Valores de retorno:
%   aproxCuadratica = el polinomio cuadrático que más se ajusta al conjunto
%   de puntos
function aproxCuadratica = metodoMinCuadradosCuadratico(arrDatos)
    syms x;
    sumaX = 0; sumaX2 = 0; sumaX3 = 0; sumaX4 = 0;
    sumaY = 0; sumaXY = 0; sumaX2Y = 0;
    n = size(arrDatos, 2);
    
    for i = 1 : size(arrDatos, 2)
        sumaX = sumaX + arrDatos(1, i);
        sumaX2 = sumaX2 + (arrDatos(1, i) ^ 2);
        sumaX3 = sumaX3 + (arrDatos(1, i) ^ 3);
        sumaX4 = sumaX4 + (arrDatos(1, i) ^ 4);
        sumaY = sumaY + arrDatos(2, i);
        sumaXY = sumaXY + (arrDatos(1, i) * arrDatos(2, i));
        sumaX2Y = sumaX2Y + ((arrDatos(1, i) ^ 2) * arrDatos(2, i));
    end
    
    eqnCoeficientes = [n sumaX sumaX2
                       sumaX sumaX2 sumaX3
                       sumaX2 sumaX3 sumaX4];
    
    res = [sumaY 
           sumaXY 
           sumaX2Y];
    
    poliCoeficientes = eqnCoeficientes \ res;
    aproxCuadratica = poliCoeficientes(1, 1) + poliCoeficientes(2, 1)*x + poliCoeficientes(3, 1)*x ^ 2;
end