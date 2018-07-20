symbols = 1:6;
n = length(symbols);
p = [.5 .125 .125 .125 .0625 .0625];
dict = huffmandict(symbols,p,2);
%Creiamo un testo random  con i simboli
sig = randsrc(100,1,[symbols; p]);
comp = huffmanenco(sig,dict);

