function e = entropy(P)
%Calcola l'entropia di un vettore di probabilità 
n = length(P);
e = 0;
for i = 1:n
    e = e - P(i)*log2(P(i));
end




end

