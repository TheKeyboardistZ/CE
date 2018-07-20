% Questo script codifica una stringa casuale di DNA, sia tramite la codifica di
% Huffman che qualla di Tunstall
%

%% Alfabeto e testo primari 
c = 'aaatagcgtgtccctagtctgcaattttctagctatggctatatcgcaggaacgatttgcttgtggtcttttctagccctttaccgacatgcctgctcaatcgtgaggaccgtcctgaagatgcagacatacgagcgtaacactgggtgagcatctgtggggtctaagaccggaaatagtgcagtggcaaaacgtgcatcctttatgggttgtgtcctttcggtcagtggctatacggcaagcccacgcctcgaaagttgtgagcggtatgtgagaatcccaaaggtgccgtgtccagtgcgcagctgtccggtcgtcgtgcaacctgcgactttgaacagcacgactgtaagtaaagtaaccggatgatactagaaaggcccatcacgcttgctatcaatgacacattacagcgattacgaagtgaggtttgcgcggagttgacgaccaatgccggctattgaatcactaccatcggccgaaattctagtcatggataattttgagctcattcgacagggccgtgccgccactttcgcagtatttatagtgtgggatgatacccggcagctgatctaacgtccaagttgaaactagcgcttgatacaagacgcggtcccttactgtcatatcgagatttctaggacgacgtgaggaattatgtaagcggttgcccggttcgggtcccaggcgagtattgagagcataattcgacaatgcattgagagcaccggtgctcacccggtcggtgaatttatacatgtcctaacctacttggaatttccataaagctgtcaactgcaccgggtgcaagcaccgccggattgtaaggtttgcaagcgcccttccttatgaagatcactgcaattatgtcgtatccagccggtgatggaacatctacgcggaggctctttttatgaattgtccgccggcgaaatctaggtttctgataacaaggtttactacttcctcatagggacgtgtataggcacatcttgag';

% Chiamo la funzione findAlphabet che mi consente di trovare l'alfabeto
% dei simboli che occorrono nel testo primario e le relative frequenze
[A,P] = findAlphabet(c);

dimension = ceil(log2(length(A)))*length(c);

[Psort,Isort] = sort(P,'descend');
A(Isort);

% Converto il testo e l'alfabeto primari nel formato cell
symbols = zeros(length(A),1);
for i = 1:length(A)
    symbols(i) = A(i);
end
 symbols = cellstr(num2str(symbols));
 
 text = zeros(length(c),1);
 for i = 1:length(c)
     text(i) = c(i);
 end
 text = cellstr(num2str(text));

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
 