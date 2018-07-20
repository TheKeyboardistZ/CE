function [timeT,timeH,rapportoT,rapportoH] = divinaCommedia(n)


% codifica di Huffman, sia tramite quella di Tunstall.
% 

%% Alfabeto primario e testo primario
% Carichiamo i dati
load divinacommedia

c = c(1:n);

% Chiamo la funzione findAlphabet che mi consente di trovare l'alfabeto
% dei simboli che occorrono nel testo primario e le relative frequenze
[A,P] = findAlphabet(c);
dimension = ceil(log2(length(A)))*length(c);

% Converto il testo e l'alfabeto primari nel formato cell
symbols = converti(A);
text = converti(c);

%% Codifica con Huffman
 tic
 dictH = huffmandict(symbols,P);
 compH = huffmanenco(text,dictH);
 timeH = toc;
 
 
 %% Codifica con Tunstall
 tic
 dictT = tunstall(symbols,P,2);
 compT = tunstallenco(text,dictT);
 timeT = toc
 
 %% Confronto 
 
 dimensionH = length(compH);
 rapportoH = dimensionH/dimension;
 dimensionT = length(compT);
 rapportoT = dimensionT/dimension;
 