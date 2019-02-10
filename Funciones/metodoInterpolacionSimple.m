% Implementación del método de interpolación simple, por Luis De Anda
% Parámetros:
%   arrDatos = un arreglo de pares ordenados de 2 filas, n columnas donde:
%               1. la primera fila representa el conjunto de coordenadas X
%               2. la segunda fila representa el conjunto de coordenadas Y
%
% Valores de retorno:
%   polinomio = el polinomio que pasa por todos los puntos dados
function polinomio = metodoInterpolacionSimple(arrDatos)
    syms x;
    polinomio = 0;
    
    for i = 1 : size(arrDatos, 2)
        for j = 1 : size(arrDatos, 2)
            % se toman los valores de la 1era fila, por eso el 1 en
            % arrDatos(1, i)
            eqnCoeficientes(i, j) = arrDatos(1, i) ^ (j - 1);
        end
        res(i, 1) = arrDatos(2, i);
    end
    
    poliCoeficientes = eqnCoeficientes \ res;
    for i = 1 : size(poliCoeficientes, 1)
        polinomio = polinomio + (poliCoeficientes(i, 1) * x ^ (i - 1));
    end
end