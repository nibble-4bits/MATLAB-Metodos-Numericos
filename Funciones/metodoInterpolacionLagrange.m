% Implementación del método de interpolación por polinomios de Lagrange, por Luis De Anda
% Parámetros:
%   arrDatos = un arreglo de pares ordenados de 2 filas, n columnas donde:
%               1. la primera fila representa el conjunto de coordenadas X
%               2. la segunda fila representa el conjunto de coordenadas Y
%
% Valores de retorno:
%   polinomio = el polinomio que pasa por todos los puntos dados
function polinomio = metodoInterpolacionLagrange(arrDatos)
    syms x;
    Px = 1;
    polinomio = 0;
    
    for i = 1 : size(arrDatos, 2)
        Px = Px * (x - arrDatos(1, i));
    end
    
    terminos = children(Px);
    for i = 1 : size(arrDatos, 2)
        polinomios(i) = Px / terminos(i);
    end
    
    for i = 1 : size(arrDatos, 2)
        polinomio = polinomio + (arrDatos(2, i) * (polinomios(i) / subs(polinomios(i), arrDatos(1, i))));
    end
end