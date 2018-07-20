% Questo script codifica un frammento della divina commedia sia tramite la 
% codifica di Huffman, sia tramite quella di Tunstall, utilizzando però un
% vettore di probabilità generato a caso

%% Alfabeto primario e testo primario

load divinacommedia

c = c(1:1000);
A = findAlphabet(c);
P = rand(length(A),1);
P = P/sum(P);

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
 dictT = tunstall(symbols,P,2);
 toc

 tic
 compT = tunstallenco(text,dictT);
 toc
 
 %% Confronto 
 
 dimensionH = length(compH);
 rapportoHuffman = dimensionH/dimension
 dimensionT = length(compT);
 rapportoTunstall = dimensionT/dimension
 