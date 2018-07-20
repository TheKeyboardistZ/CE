function [T,PNew] = tunstall(A,P,j)
%% Creazione famiglia di messaggi
% Dato un alfabeto A,un vettore di probabilità P e la lunghezza j, calcola
% la corrispondente codifica di Tunstall

M = A;
PNew = P;
for i = 1:j 
    [~,maxIndex] = max(PNew);
    m = M{maxIndex}; %Seleziono l'elemento con probabilità max
    M(maxIndex) = []; %Lo cancello 
    p = PNew(maxIndex);
    PNew(maxIndex) = [];
    for k = 1:length(A) %aggiungo i K elementi "ma" con a \in A 
       M{length(M)+1} = strcat(m,A{k});
       PNew = [PNew', p*P(k)]';
    end
end

T = M;

%% Conversione in binario 
n = length(T);
l = ceil(log2(n));
    for i = 1:n
        T{i,2} = de2bi(i-1,l);
    end
    
end

