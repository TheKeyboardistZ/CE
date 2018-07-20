function i = inaccuracy(P,Q)
%Calcola l'entropia mista di P e Q
i = divergence(P,Q)+entropy(P);

end

