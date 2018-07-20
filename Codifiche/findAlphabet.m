function [A,P] = findAlphabet(S)
% Dato un testo S, costruisce l'alfabeto e le relative frequenze

n = length(S);
SCopy = S;
j = 1;
while length(SCopy)>0
    A(j) = SCopy(1);
    SCopy = erase(SCopy,SCopy(1));
    j = j+1;
end
    
A = sort(A);

% costruiamo ora il vettore di probabilità
l = length(A);
P = zeros(l,1);
for i = 1:l 
    P(i) = length(strfind(S,A(i)));
end

P = 1/n * P;  % normalizzo il vettore di probabilità 

end

