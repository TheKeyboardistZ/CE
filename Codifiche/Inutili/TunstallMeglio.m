% Questo script codifica un testo generato ad hoc in modo che la codifica
% di Tunstall risulti efficiente
% 

%% Alfabeto primario e testo primario

c = 'AAAAAAAAAAAAAABACEAFGHIAAALMANAOPQARSTAAAUVAZAAAAAABAGAFFFARAVAAARAAFARATAY';

% Chiamo la funzione _findAlphabet_ che mi consente di trovare l'alfabeto
% dei simboli che occorrono nel testo primario e le relative frequenze
[A,P] = findAlphabet(c);

dimension = ceil(log2(length(A)))*length(c);

[Psort,Isort] = sort(P,'descend');
A(Isort);

% Converto il testo e l'alfabeto primari nel formato _cell_
symbols = converti(A);
text = converti(c);

%% Codifica con Huffman
 tic
 dictH = huffmandict(symbols,P);
 toc
 
 tic
 compH = huffmanenco(text,dictH);
 toc
 
 
 %% Codifica con Tunstall
 tic
 dictT = tunstall(symbols,P,1);
 toc

 tic
 compT = tunstallenco(text,dictT);
 toc
 
 %% Confronto 
 
 dimensionH = length(compH);
 rapportoHuffman = dimensionH/dimension
 dimensionT = length(compT);
 rapportoTunstall = dimensionT/dimension
 