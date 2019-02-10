function gx = obtenergx(fx)
    syms x;
    gx = fx == 0;
    terminos = children(lhs(gx));
    
    for i = 1 : size(terminos, 2)
        if has(terminos(i), x)
            ind = i;
        else
            break;
        end
    end
    
    gx = isolate(gx, terminos(ind));
    if size(children(lhs(gx)), 2) > 1
        exponente = children(lhs(gx));
        exponente = exponente(2);
    else
        exponente = 1;
    end
    gx = gx ^ (1/exponente);
%     gx = gx / x^(exponente - 1);
    gx = rhs(gx);
end