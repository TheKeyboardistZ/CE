% Questo script mostra come, al crescere di j, il tasso tenda all'entropia

c = 'AAAABBCCD';

[A,P] = findAlphabet(c);

[Psort,Isort] = sort(P,'descend');
A(Isort);

symbols = converti(A);
text = converti(c);

 j = 170;
 
 a = zeros(j,1);
 r = zeros(j,1);
 
 % Calcolo l'entropia con la funzione entropy 
 e = entropy(P);
 
 K = length(symbols);
 for i = 1:j
     [dictT,PNew] = tunstall(symbols,P,i);
     a(i) = AvLengthTunstall(dictT,PNew);
     r(i) = 2*ceil(log2(K+i*(K-1)))/a(i);
 end
 
% Disegnamo un grafico 
 
plot(1:j,r,'o')
hold on
plot(1:j,e,'x')
hold off
 