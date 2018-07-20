function [rapportoTunstall,time] = simulaTunstall(n,m,p)
%SIMULATUNSTALL codifica con Tunstall una stringa generata a caso lunga n
%con m simboli. p è il peso della lettera più frequente

len = n;
n_simboli = m;
P = rand(n_simboli-1,1);
P = (P/sum(P))*(1-p);

stringa = ' ';

seq = randsrc(1,len,[65 : n_simboli + 64; p P']);
for i = 1:len 
    stringa(i) = seq(i);
end


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

