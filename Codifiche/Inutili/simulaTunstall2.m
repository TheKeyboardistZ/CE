function [rapportoTunstall,time] = simulaTunstall2(n,m)
%SIMULATUNSTALL codifica con Tunstall una stringa generata a caso lunga n
%con m simboli . In questo caso m <= 10
len = n;
n_simboli = m;
P = rand(n_simboli-1,1);
P = P/(2*sum(P));


seq = randsrc(1,len,[0 : n_simboli-1; 1/2 P']);
stringa = num2str(seq);
stringa = erase(stringa,' ');


[A,P] = findAlphabet(stringa);
symbols = converti(A);
text = converti(stringa);
 dimension = ceil(log2(length(A)))*length(stringa);

 dictT = tunstall(symbols,P,1);

 tic
 compT = tunstallenco(text,dictT);
 time = toc;
 
 dimensionT = length(compT);
 rapportoTunstall = dimensionT/dimension;

end

