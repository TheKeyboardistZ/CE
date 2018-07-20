function d = divergence(P,Q)
%Calcola la divergenza di due vettori di probabilità P e Q di eguale
%lunghezza
n = length(P);
d = 0;
for i = 1:n
    e = e + P(i)*log2(P(i)/Q(i));
end

end

