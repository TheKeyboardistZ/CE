function [A_n] = nAlphabet(A,n)
%Dato un alfabeto e un vettore di probabilità, ritorna l'alfabeto di n-uple
%e il rispettivo vettore di probabilità


%Da mettere a posto, ma almeno il primo pezzo funziona
K = n;                          %// Length of each permutation
x = num2str(A(1));
for i = 2:length(A)
    x = strcat(x,num2str(A(i)));
end                              %// Set of possible letters
                          

%// Create all possible permutations (with repetition) of letters stored in x
C = cell(K, 1);             %// Preallocate a cell array
[C{:}] = ndgrid(x);         %// Create K grids of values
y = cellfun(@(x){x(:)}, C); %// Convert grids to column vectors
A_n = [y{:}];  %// Obtain all permutations
A_n = str2num(A_n);

end
