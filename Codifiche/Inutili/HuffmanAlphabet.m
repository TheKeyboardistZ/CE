function [B] = HuffmanAlphabet(A,P)
%A alfabeto di simboli
%P vettore di probabilità 
%B nuovo alfabeto binario

K = length(A);

[PNew,Ip] = sort(P);
ANew = A;
for i = 1:K
    ANew(i) = A(Ip(i));
end

    




end

